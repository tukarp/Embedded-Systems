;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module DSM_51_CLOCK_IN_C
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DISPLAY_PATTERNS
	.globl _main
	.globl _clock
	.globl _TEST_LED
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _DISPLAY_SWITCH
	.globl _INTERRUPT_T0_FLAG
	.globl _SECOND_PASSED_FLAG
	.globl _ACTIVE_KEYBOARD_DISPLAY_INDEX
	.globl _ACTIVE_KEYBOARD_DISPLAY_BIT
	.globl _KEYBOARD
	.globl _ACTIVE_DISPLAY_BIT
	.globl _ACTIVE_DISPLAY_INDEX
	.globl _ACTIVE_DISPLAY_SEGMENTS_BUFFER
	.globl _ACTIVE_DISPLAY_BUFFER
	.globl _CLOCK_ARRAY
	.globl _T0_INTERRUPTS_COUNTER
	.globl _test_led
	.globl _display_handler
	.globl _display
	.globl _keyboard_handler
	.globl _keyboard
	.globl _update_seconds
	.globl _update_minutes
	.globl _update_hours
	.globl _update_time
	.globl _t0_interrupt
	.globl _initialize
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
_TEST_LED	=	0x0097
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_T0_INTERRUPTS_COUNTER::
	.ds 2
_CLOCK_ARRAY::
	.ds 6
_ACTIVE_DISPLAY_BUFFER::
	.ds 2
_ACTIVE_DISPLAY_SEGMENTS_BUFFER::
	.ds 2
_ACTIVE_DISPLAY_INDEX::
	.ds 1
_ACTIVE_DISPLAY_BIT::
	.ds 1
_KEYBOARD::
	.ds 4
_ACTIVE_KEYBOARD_DISPLAY_BIT::
	.ds 1
_ACTIVE_KEYBOARD_DISPLAY_INDEX::
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_SECOND_PASSED_FLAG::
	.ds 1
_INTERRUPT_T0_FLAG::
	.ds 1
_DISPLAY_SWITCH	=	0x0096
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_t0_interrupt
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	DSM-51-CLOCK-IN-C.c:18: unsigned char CLOCK_ARRAY[6] = {1, 4, 5, 5, 3, 2};    // TABLICA WYŒWIETLAJ¥CA ZEGAREK
	mov	_CLOCK_ARRAY,#0x01
	mov	(_CLOCK_ARRAY + 0x0001),#0x04
	mov	(_CLOCK_ARRAY + 0x0002),#0x05
	mov	(_CLOCK_ARRAY + 0x0003),#0x05
	mov	(_CLOCK_ARRAY + 0x0004),#0x03
	mov	(_CLOCK_ARRAY + 0x0005),#0x02
;	DSM-51-CLOCK-IN-C.c:21: __xdata unsigned char * ACTIVE_DISPLAY_BUFFER = (__xdata unsigned char *) 0xFF30;               // BUFOR WYBIERAJ¥CY AKTYWNY WYŒWIETLACZ DLA WYŒWIETLACZA 7-SEGMENTOWEGO
	mov	_ACTIVE_DISPLAY_BUFFER,#0x30
	mov	(_ACTIVE_DISPLAY_BUFFER + 1),#0xff
;	DSM-51-CLOCK-IN-C.c:22: __xdata unsigned char * ACTIVE_DISPLAY_SEGMENTS_BUFFER = (__xdata unsigned char *) 0xFF38;      // BUFOR WYBIERAJ¥CY AKTYWNE SEGMENTY WYŒWIETLACZA
	mov	_ACTIVE_DISPLAY_SEGMENTS_BUFFER,#0x38
	mov	(_ACTIVE_DISPLAY_SEGMENTS_BUFFER + 1),#0xff
;	DSM-51-CLOCK-IN-C.c:41: unsigned char KEYBOARD[4] = {0, 0, 0, 0};    // TABLICA PRZECHOWUJ¥CA STANY KLAWIATURY
	mov	_KEYBOARD,#0x00
	mov	(_KEYBOARD + 0x0001),#0x00
	mov	(_KEYBOARD + 0x0002),#0x00
	mov	(_KEYBOARD + 0x0003),#0x00
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'test_led'
;------------------------------------------------------------
;	DSM-51-CLOCK-IN-C.c:63: void test_led() {
;	-----------------------------------------
;	 function test_led
;	-----------------------------------------
_test_led:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	DSM-51-CLOCK-IN-C.c:64: TEST_LED = !TEST_LED;
	cpl	_TEST_LED
;	DSM-51-CLOCK-IN-C.c:65: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'display_handler'
;------------------------------------------------------------
;	DSM-51-CLOCK-IN-C.c:68: void display_handler() {
;	-----------------------------------------
;	 function display_handler
;	-----------------------------------------
_display_handler:
;	DSM-51-CLOCK-IN-C.c:70: if(ACTIVE_DISPLAY_INDEX < 5) {
	mov	a,#0x100 - 0x05
	add	a,_ACTIVE_DISPLAY_INDEX
	jc	00102$
;	DSM-51-CLOCK-IN-C.c:71: ACTIVE_DISPLAY_INDEX++;
	inc	_ACTIVE_DISPLAY_INDEX
;	DSM-51-CLOCK-IN-C.c:72: ACTIVE_DISPLAY_BIT += ACTIVE_DISPLAY_BIT;
	mov	a,_ACTIVE_DISPLAY_BIT
	add	a,_ACTIVE_DISPLAY_BIT
	mov	_ACTIVE_DISPLAY_BIT,a
	ret
00102$:
;	DSM-51-CLOCK-IN-C.c:75: ACTIVE_DISPLAY_INDEX = 0;
	mov	_ACTIVE_DISPLAY_INDEX,#0x00
;	DSM-51-CLOCK-IN-C.c:76: ACTIVE_DISPLAY_BIT = 1;
	mov	_ACTIVE_DISPLAY_BIT,#0x01
;	DSM-51-CLOCK-IN-C.c:78: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'display'
;------------------------------------------------------------
;	DSM-51-CLOCK-IN-C.c:81: void display() {
;	-----------------------------------------
;	 function display
;	-----------------------------------------
_display:
;	DSM-51-CLOCK-IN-C.c:82: DISPLAY_SWITCH = TRUE;                                                                          // W£¥CZA WYŒWIETLACZ LED
;	assignBit
	setb	_DISPLAY_SWITCH
;	DSM-51-CLOCK-IN-C.c:83: * ACTIVE_DISPLAY_BUFFER = ACTIVE_DISPLAY_BIT;                                                   // WYBIERA WYŒWIETLACZ LED
	mov	dpl,_ACTIVE_DISPLAY_BUFFER
	mov	dph,(_ACTIVE_DISPLAY_BUFFER + 1)
	mov	a,_ACTIVE_DISPLAY_BIT
	movx	@dptr,a
;	DSM-51-CLOCK-IN-C.c:84: * ACTIVE_DISPLAY_SEGMENTS_BUFFER = DISPLAY_PATTERNS[CLOCK_ARRAY[ACTIVE_DISPLAY_INDEX]];         // WYBIERA SEGMENTY WYŒWIETLACZA LED
	mov	r6,_ACTIVE_DISPLAY_SEGMENTS_BUFFER
	mov	r7,(_ACTIVE_DISPLAY_SEGMENTS_BUFFER + 1)
	mov	a,_ACTIVE_DISPLAY_INDEX
	add	a,#_CLOCK_ARRAY
	mov	r1,a
	mov	a,@r1
	mov	dptr,#_DISPLAY_PATTERNS
	movc	a,@a+dptr
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
;	DSM-51-CLOCK-IN-C.c:85: DISPLAY_SWITCH = FALSE;                                                                         // WY£¥CZA WYŒWIETLACZ LED
;	assignBit
	clr	_DISPLAY_SWITCH
;	DSM-51-CLOCK-IN-C.c:86: display_handler();                                                                              // ZMIENIAJ SEGMENTY WYŒWIETLACZA
;	DSM-51-CLOCK-IN-C.c:87: }
	ljmp	_display_handler
;------------------------------------------------------------
;Allocation info for local variables in function 'keyboard_handler'
;------------------------------------------------------------
;	DSM-51-CLOCK-IN-C.c:94: void keyboard_handler() {
;	-----------------------------------------
;	 function keyboard_handler
;	-----------------------------------------
_keyboard_handler:
;	DSM-51-CLOCK-IN-C.c:96: if((KEYBOARD[0] != KEYBOARD[1]) && (KEYBOARD[0] != KEYBOARD[2]) && (KEYBOARD[0] != KEYBOARD[3])) {
	mov	a,_KEYBOARD
	mov	r7,a
	cjne	a,(_KEYBOARD + 0x0001),00263$
	ljmp	00158$
00263$:
	mov	a,r7
	cjne	a,(_KEYBOARD + 0x0002),00264$
	ljmp	00158$
00264$:
	mov	a,r7
	cjne	a,(_KEYBOARD + 0x0003),00265$
	ljmp	00158$
00265$:
;	DSM-51-CLOCK-IN-C.c:98: if(KEYBOARD[0] == (ENTER | LEFT)) {
	cjne	r7,#0x21,00155$
;	DSM-51-CLOCK-IN-C.c:99: if(CLOCK_ARRAY[4] < 9) {
	mov	r6,(_CLOCK_ARRAY + 0x0004)
	cjne	r6,#0x09,00268$
00268$:
	jnc	00110$
;	DSM-51-CLOCK-IN-C.c:100: CLOCK_ARRAY[4]++;
	mov	a,r6
	inc	a
	mov	(_CLOCK_ARRAY + 0x0004),a
	ljmp	00158$
00110$:
;	DSM-51-CLOCK-IN-C.c:102: if((CLOCK_ARRAY[5] < 1) || ((CLOCK_ARRAY[5] < 2) && (CLOCK_ARRAY[4] < 6))) {
	mov	r5,(_CLOCK_ARRAY + 0x0005)
	cjne	r5,#0x01,00270$
00270$:
	jc	00104$
	cjne	r5,#0x02,00272$
00272$:
	jnc	00105$
	cjne	r6,#0x06,00274$
00274$:
	jnc	00105$
00104$:
;	DSM-51-CLOCK-IN-C.c:103: CLOCK_ARRAY[4] = 0;
	mov	(_CLOCK_ARRAY + 0x0004),#0x00
;	DSM-51-CLOCK-IN-C.c:104: CLOCK_ARRAY[5]++;
	mov	a,(_CLOCK_ARRAY + 0x0005)
	mov	r4,a
	inc	a
	mov	(_CLOCK_ARRAY + 0x0005),a
	ljmp	00158$
00105$:
;	DSM-51-CLOCK-IN-C.c:105: } else if((CLOCK_ARRAY[4] == 9) && (CLOCK_ARRAY[5] == 1)) {
	cjne	r6,#0x09,00276$
	sjmp	00277$
00276$:
	ljmp	00158$
00277$:
	cjne	r5,#0x01,00278$
	sjmp	00279$
00278$:
	ljmp	00158$
00279$:
;	DSM-51-CLOCK-IN-C.c:106: CLOCK_ARRAY[5] = 2;
	mov	(_CLOCK_ARRAY + 0x0005),#0x02
;	DSM-51-CLOCK-IN-C.c:107: CLOCK_ARRAY[4] = 0;
	mov	(_CLOCK_ARRAY + 0x0004),#0x00
	ljmp	00158$
00155$:
;	DSM-51-CLOCK-IN-C.c:110: } else if(KEYBOARD[0] == (ENTER | DOWN)) {
	cjne	r7,#0x11,00152$
;	DSM-51-CLOCK-IN-C.c:111: if(CLOCK_ARRAY[2] < 9) {
	mov	r6,(_CLOCK_ARRAY + 0x0002)
	cjne	r6,#0x09,00282$
00282$:
	jnc	00115$
;	DSM-51-CLOCK-IN-C.c:112: CLOCK_ARRAY[2]++;
	mov	a,r6
	inc	a
	mov	(_CLOCK_ARRAY + 0x0002),a
	ljmp	00158$
00115$:
;	DSM-51-CLOCK-IN-C.c:114: if(CLOCK_ARRAY[3] < 6) {
	mov	a,#0x100 - 0x06
	add	a,(_CLOCK_ARRAY + 0x0003)
	jnc	00284$
	ljmp	00158$
00284$:
;	DSM-51-CLOCK-IN-C.c:115: CLOCK_ARRAY[2] = 0;
	mov	(_CLOCK_ARRAY + 0x0002),#0x00
;	DSM-51-CLOCK-IN-C.c:116: CLOCK_ARRAY[3]++;
	mov	a,(_CLOCK_ARRAY + 0x0003)
	mov	r6,a
	inc	a
	mov	(_CLOCK_ARRAY + 0x0003),a
	ljmp	00158$
00152$:
;	DSM-51-CLOCK-IN-C.c:119: } else if(KEYBOARD[0] == (ENTER | RIGHT)) {
	cjne	r7,#0x05,00149$
;	DSM-51-CLOCK-IN-C.c:120: if(CLOCK_ARRAY[0] < 9) {
	mov	r6,_CLOCK_ARRAY
	cjne	r6,#0x09,00287$
00287$:
	jnc	00120$
;	DSM-51-CLOCK-IN-C.c:121: CLOCK_ARRAY[0]++;
	mov	a,r6
	inc	a
	mov	_CLOCK_ARRAY,a
	ljmp	00158$
00120$:
;	DSM-51-CLOCK-IN-C.c:123: if(CLOCK_ARRAY[1] < 6) {
	mov	a,#0x100 - 0x06
	add	a,(_CLOCK_ARRAY + 0x0001)
	jnc	00289$
	ljmp	00158$
00289$:
;	DSM-51-CLOCK-IN-C.c:124: CLOCK_ARRAY[0] = 0;
	mov	_CLOCK_ARRAY,#0x00
;	DSM-51-CLOCK-IN-C.c:125: CLOCK_ARRAY[1]++;
	mov	a,(_CLOCK_ARRAY + 0x0001)
	mov	r6,a
	inc	a
	mov	(_CLOCK_ARRAY + 0x0001),a
	sjmp	00158$
00149$:
;	DSM-51-CLOCK-IN-C.c:129: } else if(KEYBOARD[0] == (ESC | LEFT)) {
	cjne	r7,#0x22,00146$
;	DSM-51-CLOCK-IN-C.c:130: if(CLOCK_ARRAY[4] > 0) {
	mov	a,(_CLOCK_ARRAY + 0x0004)
	mov	r6,a
	jz	00128$
;	DSM-51-CLOCK-IN-C.c:131: CLOCK_ARRAY[4]--;
	mov	a,r6
	dec	a
	mov	(_CLOCK_ARRAY + 0x0004),a
	sjmp	00158$
00128$:
;	DSM-51-CLOCK-IN-C.c:133: if(CLOCK_ARRAY[5] > 0) {
	mov	a,(_CLOCK_ARRAY + 0x0005)
	jz	00125$
;	DSM-51-CLOCK-IN-C.c:134: CLOCK_ARRAY[4] = 9;
	mov	(_CLOCK_ARRAY + 0x0004),#0x09
;	DSM-51-CLOCK-IN-C.c:135: CLOCK_ARRAY[5]--;
	mov	a,(_CLOCK_ARRAY + 0x0005)
	mov	r6,a
	dec	a
	mov	(_CLOCK_ARRAY + 0x0005),a
	sjmp	00158$
00125$:
;	DSM-51-CLOCK-IN-C.c:136: } else if(CLOCK_ARRAY[3] > 0) {
	mov	a,(_CLOCK_ARRAY + 0x0003)
	mov	r6,a
	jz	00158$
;	DSM-51-CLOCK-IN-C.c:137: CLOCK_ARRAY[3]--;
	mov	a,r6
	dec	a
	mov	(_CLOCK_ARRAY + 0x0003),a
	sjmp	00158$
00146$:
;	DSM-51-CLOCK-IN-C.c:140: } else if(KEYBOARD[0] == (ESC | DOWN)) {
	cjne	r7,#0x12,00143$
;	DSM-51-CLOCK-IN-C.c:141: if(CLOCK_ARRAY[2] > 0) {
	mov	a,(_CLOCK_ARRAY + 0x0002)
	mov	r6,a
	jz	00136$
;	DSM-51-CLOCK-IN-C.c:142: CLOCK_ARRAY[2]--;
	mov	a,r6
	dec	a
	mov	(_CLOCK_ARRAY + 0x0002),a
	sjmp	00158$
00136$:
;	DSM-51-CLOCK-IN-C.c:144: if(CLOCK_ARRAY[3] > 0) {
	mov	a,(_CLOCK_ARRAY + 0x0003)
	jz	00133$
;	DSM-51-CLOCK-IN-C.c:145: CLOCK_ARRAY[2] = 9;
	mov	(_CLOCK_ARRAY + 0x0002),#0x09
;	DSM-51-CLOCK-IN-C.c:146: CLOCK_ARRAY[3]--;
	mov	a,(_CLOCK_ARRAY + 0x0003)
	mov	r6,a
	dec	a
	mov	(_CLOCK_ARRAY + 0x0003),a
	sjmp	00158$
00133$:
;	DSM-51-CLOCK-IN-C.c:147: } else if(CLOCK_ARRAY[1] > 0) {
	mov	a,(_CLOCK_ARRAY + 0x0001)
	mov	r6,a
	jz	00158$
;	DSM-51-CLOCK-IN-C.c:148: CLOCK_ARRAY[1]--;
	mov	a,r6
	dec	a
	mov	(_CLOCK_ARRAY + 0x0001),a
	sjmp	00158$
00143$:
;	DSM-51-CLOCK-IN-C.c:151: } else if(KEYBOARD[0] == (ESC | RIGHT)) {
	cjne	r7,#0x06,00158$
;	DSM-51-CLOCK-IN-C.c:152: if(CLOCK_ARRAY[0] > 0) {
	mov	a,_CLOCK_ARRAY
	mov	r7,a
	jz	00158$
;	DSM-51-CLOCK-IN-C.c:153: CLOCK_ARRAY[0]--;
	mov	a,r7
	dec	a
	mov	_CLOCK_ARRAY,a
00158$:
;	DSM-51-CLOCK-IN-C.c:157: KEYBOARD[3] = KEYBOARD[2];
	mov	r7,(_KEYBOARD + 0x0002)
	mov	(_KEYBOARD + 0x0003),r7
;	DSM-51-CLOCK-IN-C.c:158: KEYBOARD[2] = KEYBOARD[1];
	mov	r7,(_KEYBOARD + 0x0001)
	mov	(_KEYBOARD + 0x0002),r7
;	DSM-51-CLOCK-IN-C.c:159: KEYBOARD[1] = KEYBOARD[0];
	mov	r7,_KEYBOARD
	mov	(_KEYBOARD + 0x0001),r7
;	DSM-51-CLOCK-IN-C.c:160: KEYBOARD[0] = 0;
	mov	_KEYBOARD,#0x00
;	DSM-51-CLOCK-IN-C.c:161: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'keyboard'
;------------------------------------------------------------
;	DSM-51-CLOCK-IN-C.c:164: void keyboard() {
;	-----------------------------------------
;	 function keyboard
;	-----------------------------------------
_keyboard:
;	DSM-51-CLOCK-IN-C.c:165: ACTIVE_KEYBOARD_DISPLAY_INDEX++;
	inc	_ACTIVE_KEYBOARD_DISPLAY_INDEX
;	DSM-51-CLOCK-IN-C.c:167: if(P3_5) {
	jnb	_P3_5,00102$
;	DSM-51-CLOCK-IN-C.c:168: KEYBOARD[0] = (KEYBOARD[0] | ACTIVE_KEYBOARD_DISPLAY_BIT);
	mov	a,_ACTIVE_KEYBOARD_DISPLAY_BIT
	orl	a,_KEYBOARD
	mov	_KEYBOARD,a
00102$:
;	DSM-51-CLOCK-IN-C.c:170: ACTIVE_KEYBOARD_DISPLAY_BIT += ACTIVE_KEYBOARD_DISPLAY_BIT;
	mov	a,_ACTIVE_KEYBOARD_DISPLAY_BIT
	add	a,_ACTIVE_KEYBOARD_DISPLAY_BIT
	mov	_ACTIVE_KEYBOARD_DISPLAY_BIT,a
;	DSM-51-CLOCK-IN-C.c:172: if(ACTIVE_KEYBOARD_DISPLAY_BIT == 0b1000000) {
	mov	a,#0x40
	cjne	a,_ACTIVE_KEYBOARD_DISPLAY_BIT,00107$
;	DSM-51-CLOCK-IN-C.c:173: ACTIVE_DISPLAY_INDEX = 0;
	mov	_ACTIVE_DISPLAY_INDEX,#0x00
;	DSM-51-CLOCK-IN-C.c:174: ACTIVE_KEYBOARD_DISPLAY_BIT = 0b0000001;
	mov	_ACTIVE_KEYBOARD_DISPLAY_BIT,#0x01
;	DSM-51-CLOCK-IN-C.c:175: if(KEYBOARD[0] != 0) {
	mov	a,_KEYBOARD
	jz	00107$
;	DSM-51-CLOCK-IN-C.c:176: keyboard_handler();
;	DSM-51-CLOCK-IN-C.c:179: }
	ljmp	_keyboard_handler
00107$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'update_seconds'
;------------------------------------------------------------
;	DSM-51-CLOCK-IN-C.c:186: void update_seconds() {
;	-----------------------------------------
;	 function update_seconds
;	-----------------------------------------
_update_seconds:
;	DSM-51-CLOCK-IN-C.c:188: if(CLOCK_ARRAY[0] == 10) {
	mov	a,#0x0a
	cjne	a,_CLOCK_ARRAY,00102$
;	DSM-51-CLOCK-IN-C.c:189: CLOCK_ARRAY[0] = 0;
	mov	_CLOCK_ARRAY,#0x00
;	DSM-51-CLOCK-IN-C.c:190: CLOCK_ARRAY[1]++;
	mov	a,(_CLOCK_ARRAY + 0x0001)
	mov	r7,a
	inc	a
	mov	(_CLOCK_ARRAY + 0x0001),a
00102$:
;	DSM-51-CLOCK-IN-C.c:193: if(CLOCK_ARRAY[1] == 6) {
	mov	a,#0x06
	cjne	a,(_CLOCK_ARRAY + 0x0001),00105$
;	DSM-51-CLOCK-IN-C.c:194: CLOCK_ARRAY[1] = 0;
	mov	(_CLOCK_ARRAY + 0x0001),#0x00
;	DSM-51-CLOCK-IN-C.c:195: CLOCK_ARRAY[2]++;
	mov	a,(_CLOCK_ARRAY + 0x0002)
	mov	r7,a
	inc	a
	mov	(_CLOCK_ARRAY + 0x0002),a
00105$:
;	DSM-51-CLOCK-IN-C.c:197: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'update_minutes'
;------------------------------------------------------------
;	DSM-51-CLOCK-IN-C.c:200: void update_minutes() {
;	-----------------------------------------
;	 function update_minutes
;	-----------------------------------------
_update_minutes:
;	DSM-51-CLOCK-IN-C.c:202: if(CLOCK_ARRAY[2] == 10) {
	mov	a,#0x0a
	cjne	a,(_CLOCK_ARRAY + 0x0002),00102$
;	DSM-51-CLOCK-IN-C.c:203: CLOCK_ARRAY[2] = 0;
	mov	(_CLOCK_ARRAY + 0x0002),#0x00
;	DSM-51-CLOCK-IN-C.c:204: CLOCK_ARRAY[3]++;
	mov	a,(_CLOCK_ARRAY + 0x0003)
	mov	r7,a
	inc	a
	mov	(_CLOCK_ARRAY + 0x0003),a
00102$:
;	DSM-51-CLOCK-IN-C.c:207: if(CLOCK_ARRAY[3] == 6) {
	mov	a,#0x06
	cjne	a,(_CLOCK_ARRAY + 0x0003),00105$
;	DSM-51-CLOCK-IN-C.c:208: CLOCK_ARRAY[3] = 0;
	mov	(_CLOCK_ARRAY + 0x0003),#0x00
;	DSM-51-CLOCK-IN-C.c:209: CLOCK_ARRAY[4]++;
	mov	a,(_CLOCK_ARRAY + 0x0004)
	mov	r7,a
	inc	a
	mov	(_CLOCK_ARRAY + 0x0004),a
00105$:
;	DSM-51-CLOCK-IN-C.c:211: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'update_hours'
;------------------------------------------------------------
;	DSM-51-CLOCK-IN-C.c:214: void update_hours() {
;	-----------------------------------------
;	 function update_hours
;	-----------------------------------------
_update_hours:
;	DSM-51-CLOCK-IN-C.c:216: if(CLOCK_ARRAY[4] == 10) {
	mov	a,#0x0a
	cjne	a,(_CLOCK_ARRAY + 0x0004),00102$
;	DSM-51-CLOCK-IN-C.c:217: CLOCK_ARRAY[4] = 0;
	mov	(_CLOCK_ARRAY + 0x0004),#0x00
;	DSM-51-CLOCK-IN-C.c:218: CLOCK_ARRAY[5]++;
	mov	a,(_CLOCK_ARRAY + 0x0005)
	mov	r7,a
	inc	a
	mov	(_CLOCK_ARRAY + 0x0005),a
00102$:
;	DSM-51-CLOCK-IN-C.c:221: if(((CLOCK_ARRAY[5] == 2) && (CLOCK_ARRAY[4] >= 4)) || (CLOCK_ARRAY[5] >= 3)) {
	mov	r7,(_CLOCK_ARRAY + 0x0005)
	cjne	r7,#0x02,00106$
	mov	a,#0x100 - 0x04
	add	a,(_CLOCK_ARRAY + 0x0004)
	jc	00103$
00106$:
	cjne	r7,#0x03,00122$
00122$:
	jc	00107$
00103$:
;	DSM-51-CLOCK-IN-C.c:222: CLOCK_ARRAY[0] = 0;
	mov	_CLOCK_ARRAY,#0x00
;	DSM-51-CLOCK-IN-C.c:223: CLOCK_ARRAY[1] = 0;
	mov	(_CLOCK_ARRAY + 0x0001),#0x00
;	DSM-51-CLOCK-IN-C.c:224: CLOCK_ARRAY[2] = 0;
	mov	(_CLOCK_ARRAY + 0x0002),#0x00
;	DSM-51-CLOCK-IN-C.c:225: CLOCK_ARRAY[3] = 0;
	mov	(_CLOCK_ARRAY + 0x0003),#0x00
;	DSM-51-CLOCK-IN-C.c:226: CLOCK_ARRAY[4] = 0;
	mov	(_CLOCK_ARRAY + 0x0004),#0x00
;	DSM-51-CLOCK-IN-C.c:227: CLOCK_ARRAY[5] = 0;
	mov	(_CLOCK_ARRAY + 0x0005),#0x00
00107$:
;	DSM-51-CLOCK-IN-C.c:229: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'update_time'
;------------------------------------------------------------
;	DSM-51-CLOCK-IN-C.c:232: void update_time() {
;	-----------------------------------------
;	 function update_time
;	-----------------------------------------
_update_time:
;	DSM-51-CLOCK-IN-C.c:233: if(SECOND_PASSED_FLAG == 1) {
;	DSM-51-CLOCK-IN-C.c:234: SECOND_PASSED_FLAG = 0;
;	assignBit
	jbc	_SECOND_PASSED_FLAG,00109$
	ret
00109$:
;	DSM-51-CLOCK-IN-C.c:235: CLOCK_ARRAY[0]++;
	mov	a,_CLOCK_ARRAY
	inc	a
	mov	_CLOCK_ARRAY,a
;	DSM-51-CLOCK-IN-C.c:236: update_seconds();
	lcall	_update_seconds
;	DSM-51-CLOCK-IN-C.c:237: update_minutes();
	lcall	_update_minutes
;	DSM-51-CLOCK-IN-C.c:238: update_hours();
;	DSM-51-CLOCK-IN-C.c:240: }
	ljmp	_update_hours
;------------------------------------------------------------
;Allocation info for local variables in function 't0_interrupt'
;------------------------------------------------------------
;	DSM-51-CLOCK-IN-C.c:243: void t0_interrupt() __interrupt(1) {
;	-----------------------------------------
;	 function t0_interrupt
;	-----------------------------------------
_t0_interrupt:
	push	acc
	push	psw
;	DSM-51-CLOCK-IN-C.c:244: TH0 = 228;                      // USTAW TH0
	mov	_TH0,#0xe4
;	DSM-51-CLOCK-IN-C.c:245: TL0 = 124;                      // USTAW TL0
	mov	_TL0,#0x7c
;	DSM-51-CLOCK-IN-C.c:246: INTERRUPT_T0_FLAG = 1;          // SYGNALIZUJ PRZERWANIE
;	assignBit
	setb	_INTERRUPT_T0_FLAG
;	DSM-51-CLOCK-IN-C.c:247: T0_INTERRUPTS_COUNTER++;        // ZAKTUALIZUJ LICZNIK PRZERWAÑ T0
	inc	_T0_INTERRUPTS_COUNTER
	clr	a
	cjne	a,_T0_INTERRUPTS_COUNTER,00109$
	inc	(_T0_INTERRUPTS_COUNTER + 1)
00109$:
;	DSM-51-CLOCK-IN-C.c:249: if(T0_INTERRUPTS_COUNTER >= 1024) {
	clr	c
	mov	a,(_T0_INTERRUPTS_COUNTER + 1)
	xrl	a,#0x80
	subb	a,#0x84
	jc	00103$
;	DSM-51-CLOCK-IN-C.c:250: SECOND_PASSED_FLAG = TRUE;
;	assignBit
	setb	_SECOND_PASSED_FLAG
;	DSM-51-CLOCK-IN-C.c:251: T0_INTERRUPTS_COUNTER -= 1024;
	mov	a,(_T0_INTERRUPTS_COUNTER + 1)
	add	a,#0xfc
	mov	(_T0_INTERRUPTS_COUNTER + 1),a
00103$:
;	DSM-51-CLOCK-IN-C.c:253: }
	pop	psw
	pop	acc
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'initialize'
;------------------------------------------------------------
;	DSM-51-CLOCK-IN-C.c:260: void initialize() {
;	-----------------------------------------
;	 function initialize
;	-----------------------------------------
_initialize:
;	DSM-51-CLOCK-IN-C.c:262: T0_INTERRUPTS_COUNTER = FALSE;
	clr	a
	mov	_T0_INTERRUPTS_COUNTER,a
	mov	(_T0_INTERRUPTS_COUNTER + 1),a
;	DSM-51-CLOCK-IN-C.c:263: SECOND_PASSED_FLAG = FALSE;
;	assignBit
	clr	_SECOND_PASSED_FLAG
;	DSM-51-CLOCK-IN-C.c:264: INTERRUPT_T0_FLAG = FALSE;
;	assignBit
	clr	_INTERRUPT_T0_FLAG
;	DSM-51-CLOCK-IN-C.c:267: ACTIVE_KEYBOARD_DISPLAY_INDEX = 0;
	mov	_ACTIVE_KEYBOARD_DISPLAY_INDEX,#0x00
;	DSM-51-CLOCK-IN-C.c:268: ACTIVE_KEYBOARD_DISPLAY_BIT = 0b00000001;
	mov	_ACTIVE_KEYBOARD_DISPLAY_BIT,#0x01
;	DSM-51-CLOCK-IN-C.c:271: ACTIVE_DISPLAY_INDEX = 0;
	mov	_ACTIVE_DISPLAY_INDEX,#0x00
;	DSM-51-CLOCK-IN-C.c:272: ACTIVE_DISPLAY_BIT = 0b00000001;
	mov	_ACTIVE_DISPLAY_BIT,#0x01
;	DSM-51-CLOCK-IN-C.c:275: TH0 = 228;
	mov	_TH0,#0xe4
;	DSM-51-CLOCK-IN-C.c:276: TH1 = 250;
	mov	_TH1,#0xfa
;	DSM-51-CLOCK-IN-C.c:277: TL0 = 124;
	mov	_TL0,#0x7c
;	DSM-51-CLOCK-IN-C.c:278: TL1 = 250;
	mov	_TL1,#0xfa
;	DSM-51-CLOCK-IN-C.c:281: TF1 = FALSE;
;	assignBit
	clr	_TF1
;	DSM-51-CLOCK-IN-C.c:282: RI = FALSE;
;	assignBit
	clr	_RI
;	DSM-51-CLOCK-IN-C.c:283: TI = FALSE;
;	assignBit
	clr	_TI
;	DSM-51-CLOCK-IN-C.c:286: ET0 = TRUE;
;	assignBit
	setb	_ET0
;	DSM-51-CLOCK-IN-C.c:287: ES = TRUE;
;	assignBit
	setb	_ES
;	DSM-51-CLOCK-IN-C.c:288: EA = TRUE;
;	assignBit
	setb	_EA
;	DSM-51-CLOCK-IN-C.c:289: TR0 = TRUE;
;	assignBit
	setb	_TR0
;	DSM-51-CLOCK-IN-C.c:290: TR1 = TRUE;
;	assignBit
	setb	_TR1
;	DSM-51-CLOCK-IN-C.c:291: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'clock'
;------------------------------------------------------------
;	DSM-51-CLOCK-IN-C.c:298: void clock() {
;	-----------------------------------------
;	 function clock
;	-----------------------------------------
_clock:
;	DSM-51-CLOCK-IN-C.c:300: if(INTERRUPT_T0_FLAG == 1) {
;	DSM-51-CLOCK-IN-C.c:301: INTERRUPT_T0_FLAG = 0;      // USTAW FLAGÊ PRZERWANIA NA 0
;	assignBit
	jbc	_INTERRUPT_T0_FLAG,00109$
	ret
00109$:
;	DSM-51-CLOCK-IN-C.c:302: update_time();              // OBS£U¯ LICZNIK CZASU
	lcall	_update_time
;	DSM-51-CLOCK-IN-C.c:303: keyboard();                 // OBS£U¯ KLAWIATURÊ
	lcall	_keyboard
;	DSM-51-CLOCK-IN-C.c:304: display();                  // OBS£U¯ WYŒWIETLACZ
;	DSM-51-CLOCK-IN-C.c:306: }
	ljmp	_display
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	DSM-51-CLOCK-IN-C.c:312: void main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	DSM-51-CLOCK-IN-C.c:314: initialize();
	lcall	_initialize
;	DSM-51-CLOCK-IN-C.c:317: while(TRUE) {
00102$:
;	DSM-51-CLOCK-IN-C.c:318: clock();
	lcall	_clock
;	DSM-51-CLOCK-IN-C.c:320: }
	sjmp	00102$
	.area CSEG    (CODE)
	.area CONST   (CODE)
_DISPLAY_PATTERNS:
	.db #0x3f	; 63
	.db #0x06	; 6
	.db #0x5b	; 91
	.db #0x4f	; 79	'O'
	.db #0x66	; 102	'f'
	.db #0x6d	; 109	'm'
	.db #0x7d	; 125
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x6f	; 111	'o'
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
