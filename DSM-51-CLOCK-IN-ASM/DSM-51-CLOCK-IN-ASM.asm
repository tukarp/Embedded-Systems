; Projekt zegarka dla DSM-51 Assemblerze
; https://github.com/tukarp
;

; GLOBAL
TEST bit P1.7
BUZZER bit P1.5
SEG7 bit P1.6
SKEY bit P3.5

; DISPLAY
ACTIVE_DISPLAY_BUFFER equ 30h 				; ADRES REJESTRU AKTYWNYCH WYŚWIETLACZY
ACTIVE_DISPLAY_SEGMENTS_BUFFER equ 38h      ; ADRES REJESTRU AKTYWNYCH SEGMENTÓW

; KEYBOARD
KEYBOARD  equ 7Ch                           ; 4 OSTATNIE STANY KLAWIATURY

; CLOCK
CLOCK equ 76h                               ; TABLICA NA 6 CYFR WSKAZANIA ZEGARA
SS	  equ 75h                               ; LICZNIK SEKUND
MM    equ 74h				                ; LICZNIK MINUT
HH    equ 73h				                ; LICZNIK GODZIN


org 0
    ljmp start

org 0Bh				                        ; PROCEDURA OBSŁUGI PRZERWANIA OD TIMER0
    mov TH0, #224           	            ; DLA TRYBU 0 - 900 PRZERWAŃ NA SEKUNDĘ CO 1024 CYKLE MASZYNOWE
    setb F0
    reti            		                ; POWRÓT Z PRZERWANIA

org 80h

; USTAW CZAS
start:
    mov SS, #41
    mov MM, #55
    mov HH, #23

    lcall calculate_time

    mov R1, #CLOCK			                ; PO TABLICY Z CYFRAMI CHODZIMY WSKAŹNIKIEM R1

    clr SEG7 			                    ;  WŁĄCZ 7-SEGMENT
    mov R7, #00000001b 		                ; ZACZYNAMY OD NAJMŁODSZEGO WYŚWIETLACZA
    mov DPTR, #DISPLAY_PATTERNS       	    ; ADRES TABLICY PRZECHOWYWUJĄCEJ WZORY 7-SEGMENTOWEGO WYŚWIETLACZA DO DPTR

  mov IE, #0				                ; BLOKUJEMY WSZYSTKIE PRZERWANIA
    mov TMOD, #01110000b		            ; BLOKADA TIMER1, TIMER0 W TRYBIE 0
    mov TH0, #224           	            ; 900 PRZERWAŃ NA SEKUNDĘ CO 1024 CYKLE MASZYNOWE

    mov R6, #132            	            ; ZLICZANIE DO 900, ŻEBY PIERWSZA SEKUNDA TRWAŁA SEKUNDĘ
    mov R5, #4

    setb TR0			                    ; ZGODA NA ZLICZANIE PRZEZ LICZNIKI TIMERA0
    setb ET0			                    ; ZGODA NA OBSŁUGĘ PRZERWANIA OD TIMERA0
    setb EA				                    ; GLOBALNA ZGODA NA OBSŁUGĘ PRZERWANIA

main_loop:
    jnb F0, main_loop		                ; CZEKAMY NA PRZERWANIE
    clr F0				                    ; ZAPOMINAMY O PRZERWANIU

    ; TUTAJ JESTEM 900 RAZY NA SEKUNDĘ

    ; CYFRA
    mov R0, #ACTIVE_DISPLAY_SEGMENTS_BUFFER ; ZAŁADUJ ADRES ACTIVE_DISPLAY_SEGMENTS_BUFFER DO R0
    mov A, @R1             		            ; AKTUALNA CYFRA ZEGARA DO AKUMULATORA
    inc R1                  	            ; W NASTĘPNYM OBROCIE PĘTLI WEŹ NASTĘPNĄ CYFRĘ
    setb SEG7               	            ; WYŁĄCZ 7-SEGMENTOWY WYŚWIETLACZ (ANTI-GHOSTING)
    movx @R0, A             	            ; WYSYŁAMY WZOREK DO REJESTRU SEGMENTÓW

    ; WYŚWIETLACZ
    mov R0, #ACTIVE_DISPLAY_BUFFER 		    ; ZAŁADUJ ADRES ACTIVE_DISPLAY_BUFFER DO R0
    mov A, R7			                    ; AKTUALNY WYŚWIETLACZ DO AKUMULATORA
    movx @R0, A             	            ; WYBIERZ WYŚWIETLACZ
    clr SEG7                	            ; WŁĄCZ 7-SEGMENTOWY WYŚWIETLACZ

    jnb SKEY, no_key
    orl KEYBOARD, A

no_key:
    rl A                    	            ; W NASTĘPNYM OBROCIE PĘTLI WEŹ NASTĘPNY WYŚWIETLACZ
    mov R7, A			                    ; ZAPAMIĘTAJ W R7 NOWY WYŚWIETLACZ
    jnb ACC.7, noACC7 		                ; JEŚLI BIT 7 = 0, SKOCZ DO noACC7
    mov R7, #00000001b      	            ; JEŚLI NIE, ZACZYNAM ZNOWU OD NAJMŁODSZEGO WYŚWIETLACZA
    mov R1, #CLOCK 			                ; WRACAMY NA POCZĄTEK TABLICY CLOCK

    ; DEBOUNCING KLAWIATURY, 3 TAKIE SAME, 1 NIE ABY ZAREAGOWAĆ TYLKO RAZ
    mov A, KEYBOARD
    cjne A, KEYBOARD+1, unstable
    cjne A, KEYBOARD+2, unstable
    cjne A, KEYBOARD+3, stable
    sjmp unstable

stable:
    jz unstable			                    ; NIE REAGUJEMY NA PUSZCZENIE KLAWISZA
    lcall keyboard_handler

unstable:
    mov KEYBOARD+3, KEYBOARD+2
    mov KEYBOARD+2, KEYBOARD+1
    mov KEYBOARD+1, KEYBOARD
    mov KEYBOARD, #0            	        ; SKŁADAJ KLAWIATURĘ OD POCZĄTKU

noACC7:
    djnz R6, main_loop      	            ; SKOCZ DO main_loop JEŚLI R6 NIE JEST ZEREM
    djnz R5, main_loop      	            ; SKOCZ DO main_loop JEŚLI R5 NIE JEST ZEREM

    mov R6, #132            	            ; ZLICZANIE DO 900 (SEKUNDA)
    mov R5, #4

    ; TUTAJ JESTEM CO SEKUNDĘ
    inc SS        			                ; ZWIĘKSZ SEKUNDY

    ; ZWIĘKSZANIE MINUT / GODZIN PRZY PRZEPEŁNIENIU
    mov A, SS
    cjne A, #60, no60      	                ; JEŚLI SEKUNDY NIE SĄ RÓWNE 60, POMIJAMY
    mov SS, #0              	            ; JEŚLI SĄ RÓWNE 60, ZERUJEMY JE
    inc MM           		                ; I ZWIĘKSZAMY MINUTY

    mov A, MM
    cjne A, #60, no60
    mov MM, #0
    inc HH

    mov A, HH
    cjne A, #24, no60
    mov HH, #0

no60:
    lcall calculate_time
    sjmp main_loop

keyboard_handler:         		            ; ZAKŁADAMY, ŻE STAN KLAWIATURY JEST W AKUMULATORZE
        cjne A, #100010b, no_left_esc
        mov A, HH
        cjne A, #23, add_hours
        mov HH, #0

no_left_esc:
    cjne A, #100001b, no_left_enter
    mov A, HH
    cjne A, #0, subtract_hours
    mov HH, #23

no_left_enter:
    cjne A, #10010b, no_down_esc
    mov A, MM
    cjne A, #59, add_minutes
    mov MM, #0

no_down_esc:
    cjne A, #10001b, no_down_enter
    mov A, MM
    cjne a, #0, subtract_minutes
    mov MM, #59

no_down_enter:
    cjne A, #110b, no_right_esc
    mov A, SS
    cjne A, #59, add_seconds
    mov SS, #0

no_right_esc:
    cjne A, #101b, no_right_enter
    mov A, SS
    cjne A, #0, subtract_seconds
    mov SS, #59

no_right_enter:
    cjne A, #1000b, no_up
    mov SS, #0
    mov R6, #132            	            ; ZLICZANIE DO 900 (SEKUNDA)
    mov R5, #4

add_hours:
    inc HH
    sjmp no_up

subtract_hours:
    dec HH
    sjmp no_up

add_minutes:
    inc MM
    sjmp no_up

subtract_minutes:
    dec MM
    sjmp no_up

add_seconds:
    inc SS
    sjmp no_up

subtract_seconds:
    dec SS
    sjmp no_up

no_up:
    lcall calculate_time
    ret

calculate_time:                   		    ; PRZELICZANIE LICZB Z HH, MM i SS NA CYFRY DLA TABLICY CLOCK
    mov DPTR, #DISPLAY_PATTERNS

    mov A, SS			                    ; ZAŁADUJ DO AKUMULATORA LICZNIK SEKUND
    mov B, #10
    div AB				                    ; PODZIEL SEKUNDY PRZEZ 10
    movc A, @A+DPTR         	            ; POBIERAMY WZÓR CYFRY DZIESIĄTEK SEKUND Z PAMIĘCI ROM
    mov CLOCK+1, A          	            ; UMIESZCZAMY GO W ODPOWIEDNIM MIEJSCU
    mov A, B                	            ; JEDNOSTKI SEKUND DO AKUMULATORA
    movc A, @A+DPTR         	            ; POBIERAMY WZÓR CYFRY JEDNOSTEK SEKUND Z PAMIĘCI ROM
    mov CLOCK, A            	            ; UMIESZCZAMY GO W ODPOWIEDNIM MIEJSCU

    mov A, MM			                    ; ZAŁADUJ DO AKUMULATORA LICZNIK MINUT
    mov B, #10
    div AB				                    ; PODZIEL MINUTY PRZEZ 10
    movc A, @A+DPTR         	            ; POBIERAMY WZÓR CYFRY DZIESIĄTEK MINUT Z PAMIĘCI ROM
    mov CLOCK+3, A          	            ; UMIESZCZAMY GO W ODPOWIEDNIM MIEJSCU
    mov A, B                	            ; JEDNOSTKI MINUT DO AKUMULATORA
    movc A, @A+DPTR         	            ; POBIERAMY WZÓR CYFRY JEDNOSTEK MINUT Z PAMIĘCI ROM
    mov CLOCK+2, A          	            ; UMIESZCZAMY GO W ODPOWIEDNIM MIEJSCU

    mov A, HH			                    ; ZAŁADUJ DO AKUMULATORA LICZNIK GODZIN
    mov B, #10
    div AB				                    ; PODZIEL GODZINY PRZEZ 10
    movc A, @A+DPTR         	            ; POBIERAMY WZÓR CYFRY DZIESIĄTEK GODZIN Z PAMIĘCI ROM
    mov CLOCK+5, A          	            ; UMIESZCZAMY GO W ODPOWIEDNIM MIEJSCU
    mov A, B                	            ; JEDNOSTKI GODZIN DO AKUMULATORA
    movc A, @A+DPTR         	            ; POBIERAMY WZÓR CYFRY JEDNOSTEK GODZIN Z PAMIĘCI ROM
    mov CLOCK+4, A          	            ; UMIESZCZAMY GO W ODPOWIEDNIM MIEJSCU

    ret                     	            ; POWRÓT Z FUNKCJI

DISPLAY_PATTERNS:
;DEFINICJE WZORÓW WYŚWIETLACZA 7-SEGMENTOWEGO PRZECHOWYWANA W PAMIĘCI ROM
db 00111111b, 00000110b, 01011011b, 01001111b
db 01100110b, 01101101b, 01111101b, 00000111b
db 01111111b, 01101111b, 01110111b, 01111100b

end
