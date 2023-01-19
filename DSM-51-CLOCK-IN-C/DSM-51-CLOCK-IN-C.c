// Projekt zegarka dla DSM-51
// https://github.com/tukarp

#include <8051.h>

// GLOBAL
#define TRUE 1
#define FALSE 0

// FLAGI BITOWE
__bit SECOND_PASSED_FLAG;       // FLAGA MIJAJ•CEJ SEKUNDY
__bit INTERRUPT_T0_FLAG;	    // FLAGA PRZERWANIA LICZNIKA T0
int T0_INTERRUPTS_COUNTER;      // LICZNIK PRZERWA— LICZNIKA T0

// CLOCK
// OD LEWEJ ZACZYNAJ• SI  SEKUNDY - JEST GODZINA 23:55:41
//unsigned char CLOCK_ARRAY[6] = {0, 0, 0, 0, 0, 0};  // TABLICA WYåWIETLAJ•CA ZEGAREK - TEST
unsigned char CLOCK_ARRAY[6] = {1, 4, 5, 5, 3, 2};    // TABLICA WYåWIETLAJ•CA ZEGAREK

// DISPLAY
__xdata unsigned char * ACTIVE_DISPLAY_BUFFER = (__xdata unsigned char *) 0xFF30;               // BUFOR WYBIERAJ•CY AKTYWNY WYåWIETLACZ DLA WYåWIETLACZA 7-SEGMENTOWEGO
__xdata unsigned char * ACTIVE_DISPLAY_SEGMENTS_BUFFER = (__xdata unsigned char *) 0xFF38;      // BUFOR WYBIERAJ•CY AKTYWNE SEGMENTY WYåWIETLACZA
__bit __at (0x96) DISPLAY_SWITCH;                   // PRZE£•CZNIK WYåWIETLACZA LED
__sbit __at(0x97) TEST_LED;                         // DIODA TEST
unsigned char ACTIVE_DISPLAY_INDEX;                 // INDEKS AKTYWNEGO WYåWIETLACZA
unsigned char ACTIVE_DISPLAY_BIT;                   // AKTYWNY WYåWIETLACZ BITOWO
__code unsigned char DISPLAY_PATTERNS[10] = {       // DEFINICJE WZOR”W WYåWIETLACZA 7-SEGMENTOWEGO
        0b0111111, 0b0000110, 0b1011011, 0b1001111,
        0b1100110, 0b1101101, 0b1111101, 0b0000111,
        0b1111111, 0b1101111
};

// KEYBOARD
// WZORY PRZYCISK”W
#define ENTER 0b000001
#define ESC 0b000010
#define RIGHT 0b000100
#define UP 0b001000
#define DOWN 0b010000
#define LEFT 0b100000
unsigned char KEYBOARD[4] = {0, 0, 0, 0};    // TABLICA PRZECHOWUJ•CA STANY KLAWIATURY
unsigned char ACTIVE_KEYBOARD_DISPLAY_BIT;                  // AKTYWNY STAN KLAWIATURY BITOWO
unsigned char ACTIVE_KEYBOARD_DISPLAY_INDEX;                // INDEKS AKTYWNEGO WYåWIETLACZA

// FUNKCJE
void t0_interrupt() __interrupt(1); // OBS£UØ PRZERWANIA
void test_led();                    // OBS£UØ DIODE TEST
void display_handler();             // OBS£UØ ZMIAN  SEGMENT”W WYåWIETLACZA
void display();                     // OBS£UØ WYåWIETLANIE
void keyboard();                    // OBS£UØ KLAWIATUR 
void keyboard_handler();            // OBS£UØ LOGIK  KLAWIATURY
void update_seconds();              // OBS£UØ SEKUNDY
void update_minutes();              // OBS£UØ MINUT
void update_hours();                // OBS£UØ GODZINY
void update_time();                 // OBS£UØ CZAS
void initialize();                  // USTAWIENIE WARTOåCI POCZ•TKOWYCH

// --------------------------------------------------
// ----------------------DISPLAY---------------------
// --------------------------------------------------

// OBS£UØ DIODE TEST
void test_led() {
    TEST_LED = !TEST_LED;
}

// OBS£UØ ZMIAN  SEGMENT”W WYåWIETLACZA
void display_handler() {
    // JEåLI INDEKS WYåWIETLACZA JEST MNIEJSZY OD 5 - IDè DO NAST PNEGO WYåWIETLACZA
    if(ACTIVE_DISPLAY_INDEX < 5) {
        ACTIVE_DISPLAY_INDEX++;
        ACTIVE_DISPLAY_BIT += ACTIVE_DISPLAY_BIT;
    // JEåLI INDEKS WYåWIETLACZA JEST WI KSZY OD 5 - ZRESETUJ WARTOå∆
    } else {
        ACTIVE_DISPLAY_INDEX = 0;
        ACTIVE_DISPLAY_BIT = 1;
    }
}

// OBS£UØ WYåWIETLANIE
void display() {
    DISPLAY_SWITCH = TRUE;                                                                          // W£•CZA WYåWIETLACZ LED
    * ACTIVE_DISPLAY_BUFFER = ACTIVE_DISPLAY_BIT;                                                   // WYBIERA WYåWIETLACZ LED
    * ACTIVE_DISPLAY_SEGMENTS_BUFFER = DISPLAY_PATTERNS[CLOCK_ARRAY[ACTIVE_DISPLAY_INDEX]];         // WYBIERA SEGMENTY WYåWIETLACZA LED
    DISPLAY_SWITCH = FALSE;                                                                         // WY£•CZA WYåWIETLACZ LED
    display_handler();                                                                              // ZMIENIAJ SEGMENTY WYåWIETLACZA
}

// --------------------------------------------------
// ---------------------KEYBOARD---------------------
// --------------------------------------------------

// OBS£UØ LOGIK  KLAWIATURY
void keyboard_handler() {
    // WARUNKI ODEJMOWANIA / DODAWANIA CZASU
    if((KEYBOARD[0] != KEYBOARD[1]) && (KEYBOARD[0] != KEYBOARD[2]) && (KEYBOARD[0] != KEYBOARD[3])) {
        // DODAWANIE CZASU
        if(KEYBOARD[0] == (ENTER | LEFT)) {
            if(CLOCK_ARRAY[4] < 9) {
                CLOCK_ARRAY[4]++;
            } else {
                if((CLOCK_ARRAY[5] < 1) || ((CLOCK_ARRAY[5] < 2) && (CLOCK_ARRAY[4] < 6))) {
                    CLOCK_ARRAY[4] = 0;
                    CLOCK_ARRAY[5]++;
                } else if((CLOCK_ARRAY[4] == 9) && (CLOCK_ARRAY[5] == 1)) {
                    CLOCK_ARRAY[5] = 2;
                    CLOCK_ARRAY[4] = 0;
                }
            }
        } else if(KEYBOARD[0] == (ENTER | DOWN)) {
            if(CLOCK_ARRAY[2] < 9) {
                CLOCK_ARRAY[2]++;
            } else {
                if(CLOCK_ARRAY[3] < 6) {
                    CLOCK_ARRAY[2] = 0;
                    CLOCK_ARRAY[3]++;
                }
            }
        } else if(KEYBOARD[0] == (ENTER | RIGHT)) {
            if(CLOCK_ARRAY[0] < 9) {
                CLOCK_ARRAY[0]++;
            } else {
                if(CLOCK_ARRAY[1] < 6) {
                    CLOCK_ARRAY[0] = 0;
                    CLOCK_ARRAY[1]++;
                }
            }
        // ODEJMOWANIE CZASU
        } else if(KEYBOARD[0] == (ESC | LEFT)) {
            if(CLOCK_ARRAY[4] > 0) {
                CLOCK_ARRAY[4]--;
            } else {
                if(CLOCK_ARRAY[5] > 0) {
                    CLOCK_ARRAY[4] = 9;
                    CLOCK_ARRAY[5]--;
                } else if(CLOCK_ARRAY[3] > 0) {
                    CLOCK_ARRAY[3]--;
                }
            }
        } else if(KEYBOARD[0] == (ESC | DOWN)) {
            if(CLOCK_ARRAY[2] > 0) {
                CLOCK_ARRAY[2]--;
            } else {
                if(CLOCK_ARRAY[3] > 0) {
                    CLOCK_ARRAY[2] = 9;
                    CLOCK_ARRAY[3]--;
                } else if(CLOCK_ARRAY[1] > 0) {
                    CLOCK_ARRAY[1]--;
                }
            }
        } else if(KEYBOARD[0] == (ESC | RIGHT)) {
            if(CLOCK_ARRAY[0] > 0) {
                CLOCK_ARRAY[0]--;
            }
        }
    }
    KEYBOARD[3] = KEYBOARD[2];
    KEYBOARD[2] = KEYBOARD[1];
    KEYBOARD[1] = KEYBOARD[0];
    KEYBOARD[0] = 0;
}

// OBS£UØ KLAWIATUR 
void keyboard() {
    ACTIVE_KEYBOARD_DISPLAY_INDEX++;
    // SPRAWDè CZY KLAWIATURA BY£A WCIåNI TA
    if(P3_5) {
        KEYBOARD[0] = (KEYBOARD[0] | ACTIVE_KEYBOARD_DISPLAY_BIT);
    }
    ACTIVE_KEYBOARD_DISPLAY_BIT += ACTIVE_KEYBOARD_DISPLAY_BIT;
    // OBS£UØ LOGIK  KLAWIATURY
    if(ACTIVE_KEYBOARD_DISPLAY_BIT == 0b1000000) {
        ACTIVE_DISPLAY_INDEX = 0;
        ACTIVE_KEYBOARD_DISPLAY_BIT = 0b0000001;
        if(KEYBOARD[0] != 0) {
            keyboard_handler();
        }
    }
}

// --------------------------------------------------
// ----------------------TIMER-----------------------
// --------------------------------------------------

// OBS£UØ SEKUNDY
void update_seconds() {
    // ZWI KSZENIE JEDNOåCI SEKUND
    if(CLOCK_ARRAY[0] == 10) {
        CLOCK_ARRAY[0] = 0;
        CLOCK_ARRAY[1]++;
    }
    // ZWI KSZENIE DZIESI•TEK SEKUND
    if(CLOCK_ARRAY[1] == 6) {
        CLOCK_ARRAY[1] = 0;
        CLOCK_ARRAY[2]++;
    }
}

// OBS£UØ MINUTY
void update_minutes() {
    // ZWI KSZENIE JEDNOåCI MINUT
    if(CLOCK_ARRAY[2] == 10) {
        CLOCK_ARRAY[2] = 0;
        CLOCK_ARRAY[3]++;
    }
    // ZWI KSZENIE DZIESI•TEK MINUT
    if(CLOCK_ARRAY[3] == 6) {
        CLOCK_ARRAY[3] = 0;
        CLOCK_ARRAY[4]++;
    }
}

// OBS£UØ GODZINY
void update_hours() {
    // ZWI KSZENIE JEDNOåCI GODZIN
    if(CLOCK_ARRAY[4] == 10) {
        CLOCK_ARRAY[4] = 0;
        CLOCK_ARRAY[5]++;
    }
    // ZWI KSZENIE DZIESI•TEK GODZIN - CZYLI ZEROWANIE ZEGARKA
    if(((CLOCK_ARRAY[5] == 2) && (CLOCK_ARRAY[4] >= 4)) || (CLOCK_ARRAY[5] >= 3)) {
        CLOCK_ARRAY[0] = 0;
        CLOCK_ARRAY[1] = 0;
        CLOCK_ARRAY[2] = 0;
        CLOCK_ARRAY[3] = 0;
        CLOCK_ARRAY[4] = 0;
        CLOCK_ARRAY[5] = 0;
    }
}

// OBS£UØ CZAS
void update_time() {
    if(SECOND_PASSED_FLAG == 1) {
        SECOND_PASSED_FLAG = 0;
        CLOCK_ARRAY[0]++;
        update_seconds();
        update_minutes();
        update_hours();
    }
}

// OBS£UØ PRZERWANIA
void t0_interrupt() __interrupt(1) {
    TH0 = 228;                      // USTAW TH0
    TL0 = 124;                      // USTAW TL0
    INTERRUPT_T0_FLAG = 1;          // SYGNALIZUJ PRZERWANIE
    T0_INTERRUPTS_COUNTER++;        // ZAKTUALIZUJ LICZNIK PRZERWA— T0
    // JEåLI MIN £O 1024 PRZERWA— ZRESETUJ LICZNIK
    if(T0_INTERRUPTS_COUNTER >= 1024) {
        SECOND_PASSED_FLAG = TRUE;
        T0_INTERRUPTS_COUNTER -= 1024;
    }
}

// --------------------------------------------------
// ------------------INITIALIZATION------------------
// --------------------------------------------------

// USTAWIENIE WARTOåCI POCZ•TKOWYCH
void initialize() {
    // USTAWIENIE ZMIENNYCH
    T0_INTERRUPTS_COUNTER = FALSE;
    SECOND_PASSED_FLAG = FALSE;
    INTERRUPT_T0_FLAG = FALSE;

    // USTAWIENIA KLAWIATURY
    ACTIVE_KEYBOARD_DISPLAY_INDEX = 0;
    ACTIVE_KEYBOARD_DISPLAY_BIT = 0b00000001;

    // USTAWIENIE WYåWIETLACZA
    ACTIVE_DISPLAY_INDEX = 0;
    ACTIVE_DISPLAY_BIT = 0b00000001;

    // USTAWIENIE REJESTR”W KONTROLNYCH
    TH0 = 228;
    TH1 = 250;
    TL0 = 124;
    TL1 = 250;

    // USTAWIENIE REJESTR”W 0
    TF1 = FALSE;
    RI = FALSE;
    TI = FALSE;

    // USTAWIENIE REJESTR”W NA 1
    ET0 = TRUE;
    ES = TRUE;
    EA = TRUE;
    TR0 = TRUE;
    TR1 = TRUE;
}

// --------------------------------------------------
// -----------------------CLOCK----------------------
// --------------------------------------------------

// ZEGAREK
void clock() {
    // ODåWIEØENIE PO PRZERWANIU
    if(INTERRUPT_T0_FLAG == 1) {
        INTERRUPT_T0_FLAG = 0;      // USTAW FLAG  PRZERWANIA NA 0
        update_time();              // OBS£UØ LICZNIK CZASU
        keyboard();                 // OBS£UØ KLAWIATUR 
        display();                  // OBS£UØ WYåWIETLACZ
    }
}

// --------------------------------------------------
// -----------------------MAIN-----------------------
// --------------------------------------------------

void main() {
    // USTAWIENIE WARTOåCI POCZ•TKOWYCH
    initialize();

    // P TLA PROGRAMOWA
    while(TRUE) {
        clock();
    }
}
