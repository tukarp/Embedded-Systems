                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module DSM_51_CLOCK
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _DISPLAY_PATTERNS
                                     12 	.globl _main
                                     13 	.globl _clock
                                     14 	.globl _TEST_LED
                                     15 	.globl _CY
                                     16 	.globl _AC
                                     17 	.globl _F0
                                     18 	.globl _RS1
                                     19 	.globl _RS0
                                     20 	.globl _OV
                                     21 	.globl _F1
                                     22 	.globl _P
                                     23 	.globl _PS
                                     24 	.globl _PT1
                                     25 	.globl _PX1
                                     26 	.globl _PT0
                                     27 	.globl _PX0
                                     28 	.globl _RD
                                     29 	.globl _WR
                                     30 	.globl _T1
                                     31 	.globl _T0
                                     32 	.globl _INT1
                                     33 	.globl _INT0
                                     34 	.globl _TXD
                                     35 	.globl _RXD
                                     36 	.globl _P3_7
                                     37 	.globl _P3_6
                                     38 	.globl _P3_5
                                     39 	.globl _P3_4
                                     40 	.globl _P3_3
                                     41 	.globl _P3_2
                                     42 	.globl _P3_1
                                     43 	.globl _P3_0
                                     44 	.globl _EA
                                     45 	.globl _ES
                                     46 	.globl _ET1
                                     47 	.globl _EX1
                                     48 	.globl _ET0
                                     49 	.globl _EX0
                                     50 	.globl _P2_7
                                     51 	.globl _P2_6
                                     52 	.globl _P2_5
                                     53 	.globl _P2_4
                                     54 	.globl _P2_3
                                     55 	.globl _P2_2
                                     56 	.globl _P2_1
                                     57 	.globl _P2_0
                                     58 	.globl _SM0
                                     59 	.globl _SM1
                                     60 	.globl _SM2
                                     61 	.globl _REN
                                     62 	.globl _TB8
                                     63 	.globl _RB8
                                     64 	.globl _TI
                                     65 	.globl _RI
                                     66 	.globl _P1_7
                                     67 	.globl _P1_6
                                     68 	.globl _P1_5
                                     69 	.globl _P1_4
                                     70 	.globl _P1_3
                                     71 	.globl _P1_2
                                     72 	.globl _P1_1
                                     73 	.globl _P1_0
                                     74 	.globl _TF1
                                     75 	.globl _TR1
                                     76 	.globl _TF0
                                     77 	.globl _TR0
                                     78 	.globl _IE1
                                     79 	.globl _IT1
                                     80 	.globl _IE0
                                     81 	.globl _IT0
                                     82 	.globl _P0_7
                                     83 	.globl _P0_6
                                     84 	.globl _P0_5
                                     85 	.globl _P0_4
                                     86 	.globl _P0_3
                                     87 	.globl _P0_2
                                     88 	.globl _P0_1
                                     89 	.globl _P0_0
                                     90 	.globl _B
                                     91 	.globl _ACC
                                     92 	.globl _PSW
                                     93 	.globl _IP
                                     94 	.globl _P3
                                     95 	.globl _IE
                                     96 	.globl _P2
                                     97 	.globl _SBUF
                                     98 	.globl _SCON
                                     99 	.globl _P1
                                    100 	.globl _TH1
                                    101 	.globl _TH0
                                    102 	.globl _TL1
                                    103 	.globl _TL0
                                    104 	.globl _TMOD
                                    105 	.globl _TCON
                                    106 	.globl _PCON
                                    107 	.globl _DPH
                                    108 	.globl _DPL
                                    109 	.globl _SP
                                    110 	.globl _P0
                                    111 	.globl _DISPLAY_SWITCH
                                    112 	.globl _INTERRUPT_T0_FLAG
                                    113 	.globl _SECOND_PASSED_FLAG
                                    114 	.globl _ACTIVE_KEYBOARD_DISPLAY_INDEX
                                    115 	.globl _ACTIVE_KEYBOARD_DISPLAY_BIT
                                    116 	.globl _KEYBOARD
                                    117 	.globl _ACTIVE_DISPLAY_BIT
                                    118 	.globl _ACTIVE_DISPLAY_INDEX
                                    119 	.globl _ACTIVE_DISPLAY_SEGMENTS_BUFFER
                                    120 	.globl _ACTIVE_DISPLAY_BUFFER
                                    121 	.globl _CLOCK_ARRAY
                                    122 	.globl _T0_INTERRUPTS_COUNTER
                                    123 	.globl _test_led
                                    124 	.globl _display_handler
                                    125 	.globl _display
                                    126 	.globl _keyboard_handler
                                    127 	.globl _keyboard
                                    128 	.globl _update_seconds
                                    129 	.globl _update_minutes
                                    130 	.globl _update_hours
                                    131 	.globl _update_time
                                    132 	.globl _t0_interrupt
                                    133 	.globl _initialize
                                    134 ;--------------------------------------------------------
                                    135 ; special function registers
                                    136 ;--------------------------------------------------------
                                    137 	.area RSEG    (ABS,DATA)
      000000                        138 	.org 0x0000
                           000080   139 _P0	=	0x0080
                           000081   140 _SP	=	0x0081
                           000082   141 _DPL	=	0x0082
                           000083   142 _DPH	=	0x0083
                           000087   143 _PCON	=	0x0087
                           000088   144 _TCON	=	0x0088
                           000089   145 _TMOD	=	0x0089
                           00008A   146 _TL0	=	0x008a
                           00008B   147 _TL1	=	0x008b
                           00008C   148 _TH0	=	0x008c
                           00008D   149 _TH1	=	0x008d
                           000090   150 _P1	=	0x0090
                           000098   151 _SCON	=	0x0098
                           000099   152 _SBUF	=	0x0099
                           0000A0   153 _P2	=	0x00a0
                           0000A8   154 _IE	=	0x00a8
                           0000B0   155 _P3	=	0x00b0
                           0000B8   156 _IP	=	0x00b8
                           0000D0   157 _PSW	=	0x00d0
                           0000E0   158 _ACC	=	0x00e0
                           0000F0   159 _B	=	0x00f0
                                    160 ;--------------------------------------------------------
                                    161 ; special function bits
                                    162 ;--------------------------------------------------------
                                    163 	.area RSEG    (ABS,DATA)
      000000                        164 	.org 0x0000
                           000080   165 _P0_0	=	0x0080
                           000081   166 _P0_1	=	0x0081
                           000082   167 _P0_2	=	0x0082
                           000083   168 _P0_3	=	0x0083
                           000084   169 _P0_4	=	0x0084
                           000085   170 _P0_5	=	0x0085
                           000086   171 _P0_6	=	0x0086
                           000087   172 _P0_7	=	0x0087
                           000088   173 _IT0	=	0x0088
                           000089   174 _IE0	=	0x0089
                           00008A   175 _IT1	=	0x008a
                           00008B   176 _IE1	=	0x008b
                           00008C   177 _TR0	=	0x008c
                           00008D   178 _TF0	=	0x008d
                           00008E   179 _TR1	=	0x008e
                           00008F   180 _TF1	=	0x008f
                           000090   181 _P1_0	=	0x0090
                           000091   182 _P1_1	=	0x0091
                           000092   183 _P1_2	=	0x0092
                           000093   184 _P1_3	=	0x0093
                           000094   185 _P1_4	=	0x0094
                           000095   186 _P1_5	=	0x0095
                           000096   187 _P1_6	=	0x0096
                           000097   188 _P1_7	=	0x0097
                           000098   189 _RI	=	0x0098
                           000099   190 _TI	=	0x0099
                           00009A   191 _RB8	=	0x009a
                           00009B   192 _TB8	=	0x009b
                           00009C   193 _REN	=	0x009c
                           00009D   194 _SM2	=	0x009d
                           00009E   195 _SM1	=	0x009e
                           00009F   196 _SM0	=	0x009f
                           0000A0   197 _P2_0	=	0x00a0
                           0000A1   198 _P2_1	=	0x00a1
                           0000A2   199 _P2_2	=	0x00a2
                           0000A3   200 _P2_3	=	0x00a3
                           0000A4   201 _P2_4	=	0x00a4
                           0000A5   202 _P2_5	=	0x00a5
                           0000A6   203 _P2_6	=	0x00a6
                           0000A7   204 _P2_7	=	0x00a7
                           0000A8   205 _EX0	=	0x00a8
                           0000A9   206 _ET0	=	0x00a9
                           0000AA   207 _EX1	=	0x00aa
                           0000AB   208 _ET1	=	0x00ab
                           0000AC   209 _ES	=	0x00ac
                           0000AF   210 _EA	=	0x00af
                           0000B0   211 _P3_0	=	0x00b0
                           0000B1   212 _P3_1	=	0x00b1
                           0000B2   213 _P3_2	=	0x00b2
                           0000B3   214 _P3_3	=	0x00b3
                           0000B4   215 _P3_4	=	0x00b4
                           0000B5   216 _P3_5	=	0x00b5
                           0000B6   217 _P3_6	=	0x00b6
                           0000B7   218 _P3_7	=	0x00b7
                           0000B0   219 _RXD	=	0x00b0
                           0000B1   220 _TXD	=	0x00b1
                           0000B2   221 _INT0	=	0x00b2
                           0000B3   222 _INT1	=	0x00b3
                           0000B4   223 _T0	=	0x00b4
                           0000B5   224 _T1	=	0x00b5
                           0000B6   225 _WR	=	0x00b6
                           0000B7   226 _RD	=	0x00b7
                           0000B8   227 _PX0	=	0x00b8
                           0000B9   228 _PT0	=	0x00b9
                           0000BA   229 _PX1	=	0x00ba
                           0000BB   230 _PT1	=	0x00bb
                           0000BC   231 _PS	=	0x00bc
                           0000D0   232 _P	=	0x00d0
                           0000D1   233 _F1	=	0x00d1
                           0000D2   234 _OV	=	0x00d2
                           0000D3   235 _RS0	=	0x00d3
                           0000D4   236 _RS1	=	0x00d4
                           0000D5   237 _F0	=	0x00d5
                           0000D6   238 _AC	=	0x00d6
                           0000D7   239 _CY	=	0x00d7
                           000097   240 _TEST_LED	=	0x0097
                                    241 ;--------------------------------------------------------
                                    242 ; overlayable register banks
                                    243 ;--------------------------------------------------------
                                    244 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        245 	.ds 8
                                    246 ;--------------------------------------------------------
                                    247 ; internal ram data
                                    248 ;--------------------------------------------------------
                                    249 	.area DSEG    (DATA)
      000008                        250 _T0_INTERRUPTS_COUNTER::
      000008                        251 	.ds 2
      00000A                        252 _CLOCK_ARRAY::
      00000A                        253 	.ds 6
      000010                        254 _ACTIVE_DISPLAY_BUFFER::
      000010                        255 	.ds 2
      000012                        256 _ACTIVE_DISPLAY_SEGMENTS_BUFFER::
      000012                        257 	.ds 2
      000014                        258 _ACTIVE_DISPLAY_INDEX::
      000014                        259 	.ds 1
      000015                        260 _ACTIVE_DISPLAY_BIT::
      000015                        261 	.ds 1
      000016                        262 _KEYBOARD::
      000016                        263 	.ds 4
      00001A                        264 _ACTIVE_KEYBOARD_DISPLAY_BIT::
      00001A                        265 	.ds 1
      00001B                        266 _ACTIVE_KEYBOARD_DISPLAY_INDEX::
      00001B                        267 	.ds 1
                                    268 ;--------------------------------------------------------
                                    269 ; overlayable items in internal ram
                                    270 ;--------------------------------------------------------
                                    271 ;--------------------------------------------------------
                                    272 ; Stack segment in internal ram
                                    273 ;--------------------------------------------------------
                                    274 	.area	SSEG
      000021                        275 __start__stack:
      000021                        276 	.ds	1
                                    277 
                                    278 ;--------------------------------------------------------
                                    279 ; indirectly addressable internal ram data
                                    280 ;--------------------------------------------------------
                                    281 	.area ISEG    (DATA)
                                    282 ;--------------------------------------------------------
                                    283 ; absolute internal ram data
                                    284 ;--------------------------------------------------------
                                    285 	.area IABS    (ABS,DATA)
                                    286 	.area IABS    (ABS,DATA)
                                    287 ;--------------------------------------------------------
                                    288 ; bit data
                                    289 ;--------------------------------------------------------
                                    290 	.area BSEG    (BIT)
      000000                        291 _SECOND_PASSED_FLAG::
      000000                        292 	.ds 1
      000001                        293 _INTERRUPT_T0_FLAG::
      000001                        294 	.ds 1
                           000096   295 _DISPLAY_SWITCH	=	0x0096
                                    296 ;--------------------------------------------------------
                                    297 ; paged external ram data
                                    298 ;--------------------------------------------------------
                                    299 	.area PSEG    (PAG,XDATA)
                                    300 ;--------------------------------------------------------
                                    301 ; external ram data
                                    302 ;--------------------------------------------------------
                                    303 	.area XSEG    (XDATA)
                                    304 ;--------------------------------------------------------
                                    305 ; absolute external ram data
                                    306 ;--------------------------------------------------------
                                    307 	.area XABS    (ABS,XDATA)
                                    308 ;--------------------------------------------------------
                                    309 ; external initialized ram data
                                    310 ;--------------------------------------------------------
                                    311 	.area XISEG   (XDATA)
                                    312 	.area HOME    (CODE)
                                    313 	.area GSINIT0 (CODE)
                                    314 	.area GSINIT1 (CODE)
                                    315 	.area GSINIT2 (CODE)
                                    316 	.area GSINIT3 (CODE)
                                    317 	.area GSINIT4 (CODE)
                                    318 	.area GSINIT5 (CODE)
                                    319 	.area GSINIT  (CODE)
                                    320 	.area GSFINAL (CODE)
                                    321 	.area CSEG    (CODE)
                                    322 ;--------------------------------------------------------
                                    323 ; interrupt vector
                                    324 ;--------------------------------------------------------
                                    325 	.area HOME    (CODE)
      000000                        326 __interrupt_vect:
      000000 02 00 11         [24]  327 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  328 	reti
      000004                        329 	.ds	7
      00000B 02 02 89         [24]  330 	ljmp	_t0_interrupt
                                    331 ;--------------------------------------------------------
                                    332 ; global & static initialisations
                                    333 ;--------------------------------------------------------
                                    334 	.area HOME    (CODE)
                                    335 	.area GSINIT  (CODE)
                                    336 	.area GSFINAL (CODE)
                                    337 	.area GSINIT  (CODE)
                                    338 	.globl __sdcc_gsinit_startup
                                    339 	.globl __sdcc_program_startup
                                    340 	.globl __start__stack
                                    341 	.globl __mcs51_genXINIT
                                    342 	.globl __mcs51_genXRAMCLEAR
                                    343 	.globl __mcs51_genRAMCLEAR
                                    344 ;	DSM-51-CLOCK.c:19: unsigned char CLOCK_ARRAY[6] = {1, 4, 5, 5, 3, 2};    // TABLICA WYŚWIETLAJĄCA ZEGAREK
      00006A 75 0A 01         [24]  345 	mov	_CLOCK_ARRAY,#0x01
      00006D 75 0B 04         [24]  346 	mov	(_CLOCK_ARRAY + 0x0001),#0x04
      000070 75 0C 05         [24]  347 	mov	(_CLOCK_ARRAY + 0x0002),#0x05
      000073 75 0D 05         [24]  348 	mov	(_CLOCK_ARRAY + 0x0003),#0x05
      000076 75 0E 03         [24]  349 	mov	(_CLOCK_ARRAY + 0x0004),#0x03
      000079 75 0F 02         [24]  350 	mov	(_CLOCK_ARRAY + 0x0005),#0x02
                                    351 ;	DSM-51-CLOCK.c:22: __xdata unsigned char * ACTIVE_DISPLAY_BUFFER = (__xdata unsigned char *) 0xFF30;               // BUFOR WYBIERAJĄCY AKTYWNY WYŚWIETLACZ DLA WYŚWIETLACZA 7-SEGMENTOWEGO
      00007C 75 10 30         [24]  352 	mov	_ACTIVE_DISPLAY_BUFFER,#0x30
      00007F 75 11 FF         [24]  353 	mov	(_ACTIVE_DISPLAY_BUFFER + 1),#0xff
                                    354 ;	DSM-51-CLOCK.c:23: __xdata unsigned char * ACTIVE_DISPLAY_SEGMENTS_BUFFER = (__xdata unsigned char *) 0xFF38;      // BUFOR WYBIERAJĄCY AKTYWNE SEGMENTY WYŚWIETLACZA
      000082 75 12 38         [24]  355 	mov	_ACTIVE_DISPLAY_SEGMENTS_BUFFER,#0x38
      000085 75 13 FF         [24]  356 	mov	(_ACTIVE_DISPLAY_SEGMENTS_BUFFER + 1),#0xff
                                    357 ;	DSM-51-CLOCK.c:42: unsigned char KEYBOARD[4] = {0, 0, 0, 0};     // TABLICA PRZECHOWUJĄCA STANY KLAWIATURY
      000088 75 16 00         [24]  358 	mov	_KEYBOARD,#0x00
      00008B 75 17 00         [24]  359 	mov	(_KEYBOARD + 0x0001),#0x00
      00008E 75 18 00         [24]  360 	mov	(_KEYBOARD + 0x0002),#0x00
      000091 75 19 00         [24]  361 	mov	(_KEYBOARD + 0x0003),#0x00
                                    362 	.area GSFINAL (CODE)
      000094 02 00 0E         [24]  363 	ljmp	__sdcc_program_startup
                                    364 ;--------------------------------------------------------
                                    365 ; Home
                                    366 ;--------------------------------------------------------
                                    367 	.area HOME    (CODE)
                                    368 	.area HOME    (CODE)
      00000E                        369 __sdcc_program_startup:
      00000E 02 02 F2         [24]  370 	ljmp	_main
                                    371 ;	return from main will return to caller
                                    372 ;--------------------------------------------------------
                                    373 ; code
                                    374 ;--------------------------------------------------------
                                    375 	.area CSEG    (CODE)
                                    376 ;------------------------------------------------------------
                                    377 ;Allocation info for local variables in function 'test_led'
                                    378 ;------------------------------------------------------------
                                    379 ;	DSM-51-CLOCK.c:64: void test_led() {
                                    380 ;	-----------------------------------------
                                    381 ;	 function test_led
                                    382 ;	-----------------------------------------
      000097                        383 _test_led:
                           000007   384 	ar7 = 0x07
                           000006   385 	ar6 = 0x06
                           000005   386 	ar5 = 0x05
                           000004   387 	ar4 = 0x04
                           000003   388 	ar3 = 0x03
                           000002   389 	ar2 = 0x02
                           000001   390 	ar1 = 0x01
                           000000   391 	ar0 = 0x00
                                    392 ;	DSM-51-CLOCK.c:65: TEST_LED = !TEST_LED;
      000097 B2 97            [12]  393 	cpl	_TEST_LED
                                    394 ;	DSM-51-CLOCK.c:66: }
      000099 22               [24]  395 	ret
                                    396 ;------------------------------------------------------------
                                    397 ;Allocation info for local variables in function 'display_handler'
                                    398 ;------------------------------------------------------------
                                    399 ;	DSM-51-CLOCK.c:69: void display_handler() {
                                    400 ;	-----------------------------------------
                                    401 ;	 function display_handler
                                    402 ;	-----------------------------------------
      00009A                        403 _display_handler:
                                    404 ;	DSM-51-CLOCK.c:71: if(ACTIVE_DISPLAY_INDEX < 5) {
      00009A 74 FB            [12]  405 	mov	a,#0x100 - 0x05
      00009C 25 14            [12]  406 	add	a,_ACTIVE_DISPLAY_INDEX
      00009E 40 09            [24]  407 	jc	00102$
                                    408 ;	DSM-51-CLOCK.c:72: ACTIVE_DISPLAY_INDEX++;
      0000A0 05 14            [12]  409 	inc	_ACTIVE_DISPLAY_INDEX
                                    410 ;	DSM-51-CLOCK.c:73: ACTIVE_DISPLAY_BIT += ACTIVE_DISPLAY_BIT;
      0000A2 E5 15            [12]  411 	mov	a,_ACTIVE_DISPLAY_BIT
      0000A4 25 15            [12]  412 	add	a,_ACTIVE_DISPLAY_BIT
      0000A6 F5 15            [12]  413 	mov	_ACTIVE_DISPLAY_BIT,a
      0000A8 22               [24]  414 	ret
      0000A9                        415 00102$:
                                    416 ;	DSM-51-CLOCK.c:76: ACTIVE_DISPLAY_INDEX = 0;
      0000A9 75 14 00         [24]  417 	mov	_ACTIVE_DISPLAY_INDEX,#0x00
                                    418 ;	DSM-51-CLOCK.c:77: ACTIVE_DISPLAY_BIT = 1;
      0000AC 75 15 01         [24]  419 	mov	_ACTIVE_DISPLAY_BIT,#0x01
                                    420 ;	DSM-51-CLOCK.c:79: }
      0000AF 22               [24]  421 	ret
                                    422 ;------------------------------------------------------------
                                    423 ;Allocation info for local variables in function 'display'
                                    424 ;------------------------------------------------------------
                                    425 ;	DSM-51-CLOCK.c:82: void display() {
                                    426 ;	-----------------------------------------
                                    427 ;	 function display
                                    428 ;	-----------------------------------------
      0000B0                        429 _display:
                                    430 ;	DSM-51-CLOCK.c:83: DISPLAY_SWITCH = TRUE;                                                                          // WŁĄCZA WYŚWIETLACZ LED
                                    431 ;	assignBit
      0000B0 D2 96            [12]  432 	setb	_DISPLAY_SWITCH
                                    433 ;	DSM-51-CLOCK.c:84: * ACTIVE_DISPLAY_BUFFER = ACTIVE_DISPLAY_BIT;                                                   // WYBIERA WYŚWIETLACZ LED
      0000B2 85 10 82         [24]  434 	mov	dpl,_ACTIVE_DISPLAY_BUFFER
      0000B5 85 11 83         [24]  435 	mov	dph,(_ACTIVE_DISPLAY_BUFFER + 1)
      0000B8 E5 15            [12]  436 	mov	a,_ACTIVE_DISPLAY_BIT
      0000BA F0               [24]  437 	movx	@dptr,a
                                    438 ;	DSM-51-CLOCK.c:85: * ACTIVE_DISPLAY_SEGMENTS_BUFFER = DISPLAY_PATTERNS[CLOCK_ARRAY[ACTIVE_DISPLAY_INDEX]];     	// WYBIERA SEGMENTY WYŚWIETLACZA LED
      0000BB AE 12            [24]  439 	mov	r6,_ACTIVE_DISPLAY_SEGMENTS_BUFFER
      0000BD AF 13            [24]  440 	mov	r7,(_ACTIVE_DISPLAY_SEGMENTS_BUFFER + 1)
      0000BF E5 14            [12]  441 	mov	a,_ACTIVE_DISPLAY_INDEX
      0000C1 24 0A            [12]  442 	add	a,#_CLOCK_ARRAY
      0000C3 F9               [12]  443 	mov	r1,a
      0000C4 E7               [12]  444 	mov	a,@r1
      0000C5 90 02 FE         [24]  445 	mov	dptr,#_DISPLAY_PATTERNS
      0000C8 93               [24]  446 	movc	a,@a+dptr
      0000C9 8E 82            [24]  447 	mov	dpl,r6
      0000CB 8F 83            [24]  448 	mov	dph,r7
      0000CD F0               [24]  449 	movx	@dptr,a
                                    450 ;	DSM-51-CLOCK.c:86: DISPLAY_SWITCH = FALSE;                                                                         // WYŁĄCZA WYŚWIETLACZ LED
                                    451 ;	assignBit
      0000CE C2 96            [12]  452 	clr	_DISPLAY_SWITCH
                                    453 ;	DSM-51-CLOCK.c:87: display_handler();                                                                              // ZMIENIAJ SEGMENTY WYŚWIETLACZA
                                    454 ;	DSM-51-CLOCK.c:88: }
      0000D0 02 00 9A         [24]  455 	ljmp	_display_handler
                                    456 ;------------------------------------------------------------
                                    457 ;Allocation info for local variables in function 'keyboard_handler'
                                    458 ;------------------------------------------------------------
                                    459 ;	DSM-51-CLOCK.c:95: void keyboard_handler() {
                                    460 ;	-----------------------------------------
                                    461 ;	 function keyboard_handler
                                    462 ;	-----------------------------------------
      0000D3                        463 _keyboard_handler:
                                    464 ;	DSM-51-CLOCK.c:97: if((KEYBOARD[0] != KEYBOARD[1]) && (KEYBOARD[0] != KEYBOARD[2]) && (KEYBOARD[0] != KEYBOARD[3])) {
      0000D3 E5 16            [12]  465 	mov	a,_KEYBOARD
      0000D5 FF               [12]  466 	mov	r7,a
      0000D6 B5 17 03         [24]  467 	cjne	a,(_KEYBOARD + 0x0001),00263$
      0000D9 02 01 D8         [24]  468 	ljmp	00158$
      0000DC                        469 00263$:
      0000DC EF               [12]  470 	mov	a,r7
      0000DD B5 18 03         [24]  471 	cjne	a,(_KEYBOARD + 0x0002),00264$
      0000E0 02 01 D8         [24]  472 	ljmp	00158$
      0000E3                        473 00264$:
      0000E3 EF               [12]  474 	mov	a,r7
      0000E4 B5 19 03         [24]  475 	cjne	a,(_KEYBOARD + 0x0003),00265$
      0000E7 02 01 D8         [24]  476 	ljmp	00158$
      0000EA                        477 00265$:
                                    478 ;	DSM-51-CLOCK.c:99: if(KEYBOARD[0] == (ENTER | LEFT)) {
      0000EA BF 21 44         [24]  479 	cjne	r7,#0x21,00155$
                                    480 ;	DSM-51-CLOCK.c:100: if(CLOCK_ARRAY[4] < 9) {
      0000ED AE 0E            [24]  481 	mov	r6,(_CLOCK_ARRAY + 0x0004)
      0000EF BE 09 00         [24]  482 	cjne	r6,#0x09,00268$
      0000F2                        483 00268$:
      0000F2 50 07            [24]  484 	jnc	00110$
                                    485 ;	DSM-51-CLOCK.c:101: CLOCK_ARRAY[4]++;
      0000F4 EE               [12]  486 	mov	a,r6
      0000F5 04               [12]  487 	inc	a
      0000F6 F5 0E            [12]  488 	mov	(_CLOCK_ARRAY + 0x0004),a
      0000F8 02 01 D8         [24]  489 	ljmp	00158$
      0000FB                        490 00110$:
                                    491 ;	DSM-51-CLOCK.c:103: if((CLOCK_ARRAY[5] < 1) || ((CLOCK_ARRAY[5] < 2) && (CLOCK_ARRAY[4] < 6))) {
      0000FB AD 0F            [24]  492 	mov	r5,(_CLOCK_ARRAY + 0x0005)
      0000FD BD 01 00         [24]  493 	cjne	r5,#0x01,00270$
      000100                        494 00270$:
      000100 40 0A            [24]  495 	jc	00104$
      000102 BD 02 00         [24]  496 	cjne	r5,#0x02,00272$
      000105                        497 00272$:
      000105 50 11            [24]  498 	jnc	00105$
      000107 BE 06 00         [24]  499 	cjne	r6,#0x06,00274$
      00010A                        500 00274$:
      00010A 50 0C            [24]  501 	jnc	00105$
      00010C                        502 00104$:
                                    503 ;	DSM-51-CLOCK.c:104: CLOCK_ARRAY[4] = 0;
      00010C 75 0E 00         [24]  504 	mov	(_CLOCK_ARRAY + 0x0004),#0x00
                                    505 ;	DSM-51-CLOCK.c:105: CLOCK_ARRAY[5]++;
      00010F E5 0F            [12]  506 	mov	a,(_CLOCK_ARRAY + 0x0005)
      000111 FC               [12]  507 	mov	r4,a
      000112 04               [12]  508 	inc	a
      000113 F5 0F            [12]  509 	mov	(_CLOCK_ARRAY + 0x0005),a
      000115 02 01 D8         [24]  510 	ljmp	00158$
      000118                        511 00105$:
                                    512 ;	DSM-51-CLOCK.c:106: } else if((CLOCK_ARRAY[4] == 9) && (CLOCK_ARRAY[5] == 1)) {
      000118 BE 09 02         [24]  513 	cjne	r6,#0x09,00276$
      00011B 80 03            [24]  514 	sjmp	00277$
      00011D                        515 00276$:
      00011D 02 01 D8         [24]  516 	ljmp	00158$
      000120                        517 00277$:
      000120 BD 01 02         [24]  518 	cjne	r5,#0x01,00278$
      000123 80 03            [24]  519 	sjmp	00279$
      000125                        520 00278$:
      000125 02 01 D8         [24]  521 	ljmp	00158$
      000128                        522 00279$:
                                    523 ;	DSM-51-CLOCK.c:107: CLOCK_ARRAY[5] = 2;
      000128 75 0F 02         [24]  524 	mov	(_CLOCK_ARRAY + 0x0005),#0x02
                                    525 ;	DSM-51-CLOCK.c:108: CLOCK_ARRAY[4] = 0;
      00012B 75 0E 00         [24]  526 	mov	(_CLOCK_ARRAY + 0x0004),#0x00
      00012E 02 01 D8         [24]  527 	ljmp	00158$
      000131                        528 00155$:
                                    529 ;	DSM-51-CLOCK.c:111: } else if(KEYBOARD[0] == (ENTER | DOWN)) {
      000131 BF 11 23         [24]  530 	cjne	r7,#0x11,00152$
                                    531 ;	DSM-51-CLOCK.c:112: if(CLOCK_ARRAY[2] < 9) {
      000134 AE 0C            [24]  532 	mov	r6,(_CLOCK_ARRAY + 0x0002)
      000136 BE 09 00         [24]  533 	cjne	r6,#0x09,00282$
      000139                        534 00282$:
      000139 50 07            [24]  535 	jnc	00115$
                                    536 ;	DSM-51-CLOCK.c:113: CLOCK_ARRAY[2]++;
      00013B EE               [12]  537 	mov	a,r6
      00013C 04               [12]  538 	inc	a
      00013D F5 0C            [12]  539 	mov	(_CLOCK_ARRAY + 0x0002),a
      00013F 02 01 D8         [24]  540 	ljmp	00158$
      000142                        541 00115$:
                                    542 ;	DSM-51-CLOCK.c:115: if(CLOCK_ARRAY[3] < 6) {
      000142 74 FA            [12]  543 	mov	a,#0x100 - 0x06
      000144 25 0D            [12]  544 	add	a,(_CLOCK_ARRAY + 0x0003)
      000146 50 03            [24]  545 	jnc	00284$
      000148 02 01 D8         [24]  546 	ljmp	00158$
      00014B                        547 00284$:
                                    548 ;	DSM-51-CLOCK.c:116: CLOCK_ARRAY[2] = 0;
      00014B 75 0C 00         [24]  549 	mov	(_CLOCK_ARRAY + 0x0002),#0x00
                                    550 ;	DSM-51-CLOCK.c:117: CLOCK_ARRAY[3]++;
      00014E E5 0D            [12]  551 	mov	a,(_CLOCK_ARRAY + 0x0003)
      000150 FE               [12]  552 	mov	r6,a
      000151 04               [12]  553 	inc	a
      000152 F5 0D            [12]  554 	mov	(_CLOCK_ARRAY + 0x0003),a
      000154 02 01 D8         [24]  555 	ljmp	00158$
      000157                        556 00152$:
                                    557 ;	DSM-51-CLOCK.c:120: } else if(KEYBOARD[0] == (ENTER | RIGHT)) {
      000157 BF 05 22         [24]  558 	cjne	r7,#0x05,00149$
                                    559 ;	DSM-51-CLOCK.c:121: if(CLOCK_ARRAY[0] < 9) {
      00015A AE 0A            [24]  560 	mov	r6,_CLOCK_ARRAY
      00015C BE 09 00         [24]  561 	cjne	r6,#0x09,00287$
      00015F                        562 00287$:
      00015F 50 07            [24]  563 	jnc	00120$
                                    564 ;	DSM-51-CLOCK.c:122: CLOCK_ARRAY[0]++;
      000161 EE               [12]  565 	mov	a,r6
      000162 04               [12]  566 	inc	a
      000163 F5 0A            [12]  567 	mov	_CLOCK_ARRAY,a
      000165 02 01 D8         [24]  568 	ljmp	00158$
      000168                        569 00120$:
                                    570 ;	DSM-51-CLOCK.c:124: if(CLOCK_ARRAY[1] < 6) {
      000168 74 FA            [12]  571 	mov	a,#0x100 - 0x06
      00016A 25 0B            [12]  572 	add	a,(_CLOCK_ARRAY + 0x0001)
      00016C 50 03            [24]  573 	jnc	00289$
      00016E 02 01 D8         [24]  574 	ljmp	00158$
      000171                        575 00289$:
                                    576 ;	DSM-51-CLOCK.c:125: CLOCK_ARRAY[0] = 0;
      000171 75 0A 00         [24]  577 	mov	_CLOCK_ARRAY,#0x00
                                    578 ;	DSM-51-CLOCK.c:126: CLOCK_ARRAY[1]++;
      000174 E5 0B            [12]  579 	mov	a,(_CLOCK_ARRAY + 0x0001)
      000176 FE               [12]  580 	mov	r6,a
      000177 04               [12]  581 	inc	a
      000178 F5 0B            [12]  582 	mov	(_CLOCK_ARRAY + 0x0001),a
      00017A 80 5C            [24]  583 	sjmp	00158$
      00017C                        584 00149$:
                                    585 ;	DSM-51-CLOCK.c:130: } else if(KEYBOARD[0] == (ESC | LEFT)) {
      00017C BF 22 25         [24]  586 	cjne	r7,#0x22,00146$
                                    587 ;	DSM-51-CLOCK.c:131: if(CLOCK_ARRAY[4] > 0) {
      00017F E5 0E            [12]  588 	mov	a,(_CLOCK_ARRAY + 0x0004)
      000181 FE               [12]  589 	mov	r6,a
      000182 60 06            [24]  590 	jz	00128$
                                    591 ;	DSM-51-CLOCK.c:132: CLOCK_ARRAY[4]--;
      000184 EE               [12]  592 	mov	a,r6
      000185 14               [12]  593 	dec	a
      000186 F5 0E            [12]  594 	mov	(_CLOCK_ARRAY + 0x0004),a
      000188 80 4E            [24]  595 	sjmp	00158$
      00018A                        596 00128$:
                                    597 ;	DSM-51-CLOCK.c:134: if(CLOCK_ARRAY[5] > 0) {
      00018A E5 0F            [12]  598 	mov	a,(_CLOCK_ARRAY + 0x0005)
      00018C 60 0B            [24]  599 	jz	00125$
                                    600 ;	DSM-51-CLOCK.c:135: CLOCK_ARRAY[4] = 9;
      00018E 75 0E 09         [24]  601 	mov	(_CLOCK_ARRAY + 0x0004),#0x09
                                    602 ;	DSM-51-CLOCK.c:136: CLOCK_ARRAY[5]--;
      000191 E5 0F            [12]  603 	mov	a,(_CLOCK_ARRAY + 0x0005)
      000193 FE               [12]  604 	mov	r6,a
      000194 14               [12]  605 	dec	a
      000195 F5 0F            [12]  606 	mov	(_CLOCK_ARRAY + 0x0005),a
      000197 80 3F            [24]  607 	sjmp	00158$
      000199                        608 00125$:
                                    609 ;	DSM-51-CLOCK.c:137: } else if(CLOCK_ARRAY[3] > 0) {
      000199 E5 0D            [12]  610 	mov	a,(_CLOCK_ARRAY + 0x0003)
      00019B FE               [12]  611 	mov	r6,a
      00019C 60 3A            [24]  612 	jz	00158$
                                    613 ;	DSM-51-CLOCK.c:138: CLOCK_ARRAY[3]--;
      00019E EE               [12]  614 	mov	a,r6
      00019F 14               [12]  615 	dec	a
      0001A0 F5 0D            [12]  616 	mov	(_CLOCK_ARRAY + 0x0003),a
      0001A2 80 34            [24]  617 	sjmp	00158$
      0001A4                        618 00146$:
                                    619 ;	DSM-51-CLOCK.c:141: } else if(KEYBOARD[0] == (ESC | DOWN)) {
      0001A4 BF 12 25         [24]  620 	cjne	r7,#0x12,00143$
                                    621 ;	DSM-51-CLOCK.c:142: if(CLOCK_ARRAY[2] > 0) {
      0001A7 E5 0C            [12]  622 	mov	a,(_CLOCK_ARRAY + 0x0002)
      0001A9 FE               [12]  623 	mov	r6,a
      0001AA 60 06            [24]  624 	jz	00136$
                                    625 ;	DSM-51-CLOCK.c:143: CLOCK_ARRAY[2]--;
      0001AC EE               [12]  626 	mov	a,r6
      0001AD 14               [12]  627 	dec	a
      0001AE F5 0C            [12]  628 	mov	(_CLOCK_ARRAY + 0x0002),a
      0001B0 80 26            [24]  629 	sjmp	00158$
      0001B2                        630 00136$:
                                    631 ;	DSM-51-CLOCK.c:145: if(CLOCK_ARRAY[3] > 0) {
      0001B2 E5 0D            [12]  632 	mov	a,(_CLOCK_ARRAY + 0x0003)
      0001B4 60 0B            [24]  633 	jz	00133$
                                    634 ;	DSM-51-CLOCK.c:146: CLOCK_ARRAY[2] = 9;
      0001B6 75 0C 09         [24]  635 	mov	(_CLOCK_ARRAY + 0x0002),#0x09
                                    636 ;	DSM-51-CLOCK.c:147: CLOCK_ARRAY[3]--;
      0001B9 E5 0D            [12]  637 	mov	a,(_CLOCK_ARRAY + 0x0003)
      0001BB FE               [12]  638 	mov	r6,a
      0001BC 14               [12]  639 	dec	a
      0001BD F5 0D            [12]  640 	mov	(_CLOCK_ARRAY + 0x0003),a
      0001BF 80 17            [24]  641 	sjmp	00158$
      0001C1                        642 00133$:
                                    643 ;	DSM-51-CLOCK.c:148: } else if(CLOCK_ARRAY[1] > 0) {
      0001C1 E5 0B            [12]  644 	mov	a,(_CLOCK_ARRAY + 0x0001)
      0001C3 FE               [12]  645 	mov	r6,a
      0001C4 60 12            [24]  646 	jz	00158$
                                    647 ;	DSM-51-CLOCK.c:149: CLOCK_ARRAY[1]--;
      0001C6 EE               [12]  648 	mov	a,r6
      0001C7 14               [12]  649 	dec	a
      0001C8 F5 0B            [12]  650 	mov	(_CLOCK_ARRAY + 0x0001),a
      0001CA 80 0C            [24]  651 	sjmp	00158$
      0001CC                        652 00143$:
                                    653 ;	DSM-51-CLOCK.c:152: } else if(KEYBOARD[0] == (ESC | RIGHT)) {
      0001CC BF 06 09         [24]  654 	cjne	r7,#0x06,00158$
                                    655 ;	DSM-51-CLOCK.c:153: if(CLOCK_ARRAY[0] > 0) {
      0001CF E5 0A            [12]  656 	mov	a,_CLOCK_ARRAY
      0001D1 FF               [12]  657 	mov	r7,a
      0001D2 60 04            [24]  658 	jz	00158$
                                    659 ;	DSM-51-CLOCK.c:154: CLOCK_ARRAY[0]--;
      0001D4 EF               [12]  660 	mov	a,r7
      0001D5 14               [12]  661 	dec	a
      0001D6 F5 0A            [12]  662 	mov	_CLOCK_ARRAY,a
      0001D8                        663 00158$:
                                    664 ;	DSM-51-CLOCK.c:158: KEYBOARD[3] = KEYBOARD[2];
      0001D8 AF 18            [24]  665 	mov	r7,(_KEYBOARD + 0x0002)
      0001DA 8F 19            [24]  666 	mov	(_KEYBOARD + 0x0003),r7
                                    667 ;	DSM-51-CLOCK.c:159: KEYBOARD[2] = KEYBOARD[1];
      0001DC AF 17            [24]  668 	mov	r7,(_KEYBOARD + 0x0001)
      0001DE 8F 18            [24]  669 	mov	(_KEYBOARD + 0x0002),r7
                                    670 ;	DSM-51-CLOCK.c:160: KEYBOARD[1] = KEYBOARD[0];
      0001E0 AF 16            [24]  671 	mov	r7,_KEYBOARD
      0001E2 8F 17            [24]  672 	mov	(_KEYBOARD + 0x0001),r7
                                    673 ;	DSM-51-CLOCK.c:161: KEYBOARD[0] = 0;
      0001E4 75 16 00         [24]  674 	mov	_KEYBOARD,#0x00
                                    675 ;	DSM-51-CLOCK.c:162: }
      0001E7 22               [24]  676 	ret
                                    677 ;------------------------------------------------------------
                                    678 ;Allocation info for local variables in function 'keyboard'
                                    679 ;------------------------------------------------------------
                                    680 ;	DSM-51-CLOCK.c:165: void keyboard() {
                                    681 ;	-----------------------------------------
                                    682 ;	 function keyboard
                                    683 ;	-----------------------------------------
      0001E8                        684 _keyboard:
                                    685 ;	DSM-51-CLOCK.c:166: ACTIVE_KEYBOARD_DISPLAY_INDEX++;
      0001E8 05 1B            [12]  686 	inc	_ACTIVE_KEYBOARD_DISPLAY_INDEX
                                    687 ;	DSM-51-CLOCK.c:168: if(P3_5) {
      0001EA 30 B5 06         [24]  688 	jnb	_P3_5,00102$
                                    689 ;	DSM-51-CLOCK.c:169: KEYBOARD[0] = (KEYBOARD[0] | ACTIVE_KEYBOARD_DISPLAY_BIT);
      0001ED E5 1A            [12]  690 	mov	a,_ACTIVE_KEYBOARD_DISPLAY_BIT
      0001EF 45 16            [12]  691 	orl	a,_KEYBOARD
      0001F1 F5 16            [12]  692 	mov	_KEYBOARD,a
      0001F3                        693 00102$:
                                    694 ;	DSM-51-CLOCK.c:171: ACTIVE_KEYBOARD_DISPLAY_BIT += ACTIVE_KEYBOARD_DISPLAY_BIT;
      0001F3 E5 1A            [12]  695 	mov	a,_ACTIVE_KEYBOARD_DISPLAY_BIT
      0001F5 25 1A            [12]  696 	add	a,_ACTIVE_KEYBOARD_DISPLAY_BIT
      0001F7 F5 1A            [12]  697 	mov	_ACTIVE_KEYBOARD_DISPLAY_BIT,a
                                    698 ;	DSM-51-CLOCK.c:173: if(ACTIVE_KEYBOARD_DISPLAY_BIT == 0b1000000) {
      0001F9 74 40            [12]  699 	mov	a,#0x40
      0001FB B5 1A 0D         [24]  700 	cjne	a,_ACTIVE_KEYBOARD_DISPLAY_BIT,00107$
                                    701 ;	DSM-51-CLOCK.c:174: ACTIVE_DISPLAY_INDEX = 0;
      0001FE 75 14 00         [24]  702 	mov	_ACTIVE_DISPLAY_INDEX,#0x00
                                    703 ;	DSM-51-CLOCK.c:175: ACTIVE_KEYBOARD_DISPLAY_BIT = 0b0000001;
      000201 75 1A 01         [24]  704 	mov	_ACTIVE_KEYBOARD_DISPLAY_BIT,#0x01
                                    705 ;	DSM-51-CLOCK.c:176: if(KEYBOARD[0] != 0) {
      000204 E5 16            [12]  706 	mov	a,_KEYBOARD
      000206 60 03            [24]  707 	jz	00107$
                                    708 ;	DSM-51-CLOCK.c:177: keyboard_handler();
                                    709 ;	DSM-51-CLOCK.c:180: }
      000208 02 00 D3         [24]  710 	ljmp	_keyboard_handler
      00020B                        711 00107$:
      00020B 22               [24]  712 	ret
                                    713 ;------------------------------------------------------------
                                    714 ;Allocation info for local variables in function 'update_seconds'
                                    715 ;------------------------------------------------------------
                                    716 ;	DSM-51-CLOCK.c:187: void update_seconds() {
                                    717 ;	-----------------------------------------
                                    718 ;	 function update_seconds
                                    719 ;	-----------------------------------------
      00020C                        720 _update_seconds:
                                    721 ;	DSM-51-CLOCK.c:189: if(CLOCK_ARRAY[0] == 10) {
      00020C 74 0A            [12]  722 	mov	a,#0x0a
      00020E B5 0A 09         [24]  723 	cjne	a,_CLOCK_ARRAY,00102$
                                    724 ;	DSM-51-CLOCK.c:190: CLOCK_ARRAY[0] = 0;
      000211 75 0A 00         [24]  725 	mov	_CLOCK_ARRAY,#0x00
                                    726 ;	DSM-51-CLOCK.c:191: CLOCK_ARRAY[1]++;
      000214 E5 0B            [12]  727 	mov	a,(_CLOCK_ARRAY + 0x0001)
      000216 FF               [12]  728 	mov	r7,a
      000217 04               [12]  729 	inc	a
      000218 F5 0B            [12]  730 	mov	(_CLOCK_ARRAY + 0x0001),a
      00021A                        731 00102$:
                                    732 ;	DSM-51-CLOCK.c:194: if(CLOCK_ARRAY[1] == 6) {
      00021A 74 06            [12]  733 	mov	a,#0x06
      00021C B5 0B 09         [24]  734 	cjne	a,(_CLOCK_ARRAY + 0x0001),00105$
                                    735 ;	DSM-51-CLOCK.c:195: CLOCK_ARRAY[1] = 0;
      00021F 75 0B 00         [24]  736 	mov	(_CLOCK_ARRAY + 0x0001),#0x00
                                    737 ;	DSM-51-CLOCK.c:196: CLOCK_ARRAY[2]++;
      000222 E5 0C            [12]  738 	mov	a,(_CLOCK_ARRAY + 0x0002)
      000224 FF               [12]  739 	mov	r7,a
      000225 04               [12]  740 	inc	a
      000226 F5 0C            [12]  741 	mov	(_CLOCK_ARRAY + 0x0002),a
      000228                        742 00105$:
                                    743 ;	DSM-51-CLOCK.c:198: }
      000228 22               [24]  744 	ret
                                    745 ;------------------------------------------------------------
                                    746 ;Allocation info for local variables in function 'update_minutes'
                                    747 ;------------------------------------------------------------
                                    748 ;	DSM-51-CLOCK.c:201: void update_minutes() {
                                    749 ;	-----------------------------------------
                                    750 ;	 function update_minutes
                                    751 ;	-----------------------------------------
      000229                        752 _update_minutes:
                                    753 ;	DSM-51-CLOCK.c:203: if(CLOCK_ARRAY[2] == 10) {
      000229 74 0A            [12]  754 	mov	a,#0x0a
      00022B B5 0C 09         [24]  755 	cjne	a,(_CLOCK_ARRAY + 0x0002),00102$
                                    756 ;	DSM-51-CLOCK.c:204: CLOCK_ARRAY[2] = 0;
      00022E 75 0C 00         [24]  757 	mov	(_CLOCK_ARRAY + 0x0002),#0x00
                                    758 ;	DSM-51-CLOCK.c:205: CLOCK_ARRAY[3]++;
      000231 E5 0D            [12]  759 	mov	a,(_CLOCK_ARRAY + 0x0003)
      000233 FF               [12]  760 	mov	r7,a
      000234 04               [12]  761 	inc	a
      000235 F5 0D            [12]  762 	mov	(_CLOCK_ARRAY + 0x0003),a
      000237                        763 00102$:
                                    764 ;	DSM-51-CLOCK.c:208: if(CLOCK_ARRAY[3] == 6) {
      000237 74 06            [12]  765 	mov	a,#0x06
      000239 B5 0D 09         [24]  766 	cjne	a,(_CLOCK_ARRAY + 0x0003),00105$
                                    767 ;	DSM-51-CLOCK.c:209: CLOCK_ARRAY[3] = 0;
      00023C 75 0D 00         [24]  768 	mov	(_CLOCK_ARRAY + 0x0003),#0x00
                                    769 ;	DSM-51-CLOCK.c:210: CLOCK_ARRAY[4]++;
      00023F E5 0E            [12]  770 	mov	a,(_CLOCK_ARRAY + 0x0004)
      000241 FF               [12]  771 	mov	r7,a
      000242 04               [12]  772 	inc	a
      000243 F5 0E            [12]  773 	mov	(_CLOCK_ARRAY + 0x0004),a
      000245                        774 00105$:
                                    775 ;	DSM-51-CLOCK.c:212: }
      000245 22               [24]  776 	ret
                                    777 ;------------------------------------------------------------
                                    778 ;Allocation info for local variables in function 'update_hours'
                                    779 ;------------------------------------------------------------
                                    780 ;	DSM-51-CLOCK.c:215: void update_hours() {
                                    781 ;	-----------------------------------------
                                    782 ;	 function update_hours
                                    783 ;	-----------------------------------------
      000246                        784 _update_hours:
                                    785 ;	DSM-51-CLOCK.c:217: if(CLOCK_ARRAY[4] == 10) {
      000246 74 0A            [12]  786 	mov	a,#0x0a
      000248 B5 0E 09         [24]  787 	cjne	a,(_CLOCK_ARRAY + 0x0004),00102$
                                    788 ;	DSM-51-CLOCK.c:218: CLOCK_ARRAY[4] = 0;
      00024B 75 0E 00         [24]  789 	mov	(_CLOCK_ARRAY + 0x0004),#0x00
                                    790 ;	DSM-51-CLOCK.c:219: CLOCK_ARRAY[5]++;
      00024E E5 0F            [12]  791 	mov	a,(_CLOCK_ARRAY + 0x0005)
      000250 FF               [12]  792 	mov	r7,a
      000251 04               [12]  793 	inc	a
      000252 F5 0F            [12]  794 	mov	(_CLOCK_ARRAY + 0x0005),a
      000254                        795 00102$:
                                    796 ;	DSM-51-CLOCK.c:222: if(((CLOCK_ARRAY[5] == 2) && (CLOCK_ARRAY[4] >= 4)) || (CLOCK_ARRAY[5] >= 3)) {
      000254 AF 0F            [24]  797 	mov	r7,(_CLOCK_ARRAY + 0x0005)
      000256 BF 02 06         [24]  798 	cjne	r7,#0x02,00106$
      000259 74 FC            [12]  799 	mov	a,#0x100 - 0x04
      00025B 25 0E            [12]  800 	add	a,(_CLOCK_ARRAY + 0x0004)
      00025D 40 05            [24]  801 	jc	00103$
      00025F                        802 00106$:
      00025F BF 03 00         [24]  803 	cjne	r7,#0x03,00122$
      000262                        804 00122$:
      000262 40 12            [24]  805 	jc	00107$
      000264                        806 00103$:
                                    807 ;	DSM-51-CLOCK.c:223: CLOCK_ARRAY[0] = 0;
      000264 75 0A 00         [24]  808 	mov	_CLOCK_ARRAY,#0x00
                                    809 ;	DSM-51-CLOCK.c:224: CLOCK_ARRAY[1] = 0;
      000267 75 0B 00         [24]  810 	mov	(_CLOCK_ARRAY + 0x0001),#0x00
                                    811 ;	DSM-51-CLOCK.c:225: CLOCK_ARRAY[2] = 0;
      00026A 75 0C 00         [24]  812 	mov	(_CLOCK_ARRAY + 0x0002),#0x00
                                    813 ;	DSM-51-CLOCK.c:226: CLOCK_ARRAY[3] = 0;
      00026D 75 0D 00         [24]  814 	mov	(_CLOCK_ARRAY + 0x0003),#0x00
                                    815 ;	DSM-51-CLOCK.c:227: CLOCK_ARRAY[4] = 0;
      000270 75 0E 00         [24]  816 	mov	(_CLOCK_ARRAY + 0x0004),#0x00
                                    817 ;	DSM-51-CLOCK.c:228: CLOCK_ARRAY[5] = 0;
      000273 75 0F 00         [24]  818 	mov	(_CLOCK_ARRAY + 0x0005),#0x00
      000276                        819 00107$:
                                    820 ;	DSM-51-CLOCK.c:230: }
      000276 22               [24]  821 	ret
                                    822 ;------------------------------------------------------------
                                    823 ;Allocation info for local variables in function 'update_time'
                                    824 ;------------------------------------------------------------
                                    825 ;	DSM-51-CLOCK.c:233: void update_time() {
                                    826 ;	-----------------------------------------
                                    827 ;	 function update_time
                                    828 ;	-----------------------------------------
      000277                        829 _update_time:
                                    830 ;	DSM-51-CLOCK.c:234: if(SECOND_PASSED_FLAG == 1) {
                                    831 ;	DSM-51-CLOCK.c:235: SECOND_PASSED_FLAG = 0;
                                    832 ;	assignBit
      000277 10 00 01         [24]  833 	jbc	_SECOND_PASSED_FLAG,00109$
      00027A 22               [24]  834 	ret
      00027B                        835 00109$:
                                    836 ;	DSM-51-CLOCK.c:236: CLOCK_ARRAY[0]++;
      00027B E5 0A            [12]  837 	mov	a,_CLOCK_ARRAY
      00027D 04               [12]  838 	inc	a
      00027E F5 0A            [12]  839 	mov	_CLOCK_ARRAY,a
                                    840 ;	DSM-51-CLOCK.c:237: update_seconds();
      000280 12 02 0C         [24]  841 	lcall	_update_seconds
                                    842 ;	DSM-51-CLOCK.c:238: update_minutes();
      000283 12 02 29         [24]  843 	lcall	_update_minutes
                                    844 ;	DSM-51-CLOCK.c:239: update_hours();
                                    845 ;	DSM-51-CLOCK.c:241: }
      000286 02 02 46         [24]  846 	ljmp	_update_hours
                                    847 ;------------------------------------------------------------
                                    848 ;Allocation info for local variables in function 't0_interrupt'
                                    849 ;------------------------------------------------------------
                                    850 ;	DSM-51-CLOCK.c:244: void t0_interrupt() __interrupt(1) {
                                    851 ;	-----------------------------------------
                                    852 ;	 function t0_interrupt
                                    853 ;	-----------------------------------------
      000289                        854 _t0_interrupt:
      000289 C0 E0            [24]  855 	push	acc
      00028B C0 D0            [24]  856 	push	psw
                                    857 ;	DSM-51-CLOCK.c:245: TH0 = 228;                      // USTAW TH0
      00028D 75 8C E4         [24]  858 	mov	_TH0,#0xe4
                                    859 ;	DSM-51-CLOCK.c:246: TL0 = 124;                      // USTAW TL0
      000290 75 8A 7C         [24]  860 	mov	_TL0,#0x7c
                                    861 ;	DSM-51-CLOCK.c:247: INTERRUPT_T0_FLAG = 1;          // SYGNALIZUJ PRZERWANIE
                                    862 ;	assignBit
      000293 D2 01            [12]  863 	setb	_INTERRUPT_T0_FLAG
                                    864 ;	DSM-51-CLOCK.c:248: T0_INTERRUPTS_COUNTER++;        // ZAKTUALIZUJ LICZNIK PRZERWAŃ T0
      000295 05 08            [12]  865 	inc	_T0_INTERRUPTS_COUNTER
      000297 E4               [12]  866 	clr	a
      000298 B5 08 02         [24]  867 	cjne	a,_T0_INTERRUPTS_COUNTER,00109$
      00029B 05 09            [12]  868 	inc	(_T0_INTERRUPTS_COUNTER + 1)
      00029D                        869 00109$:
                                    870 ;	DSM-51-CLOCK.c:250: if(T0_INTERRUPTS_COUNTER >= 1024) {
      00029D C3               [12]  871 	clr	c
      00029E E5 09            [12]  872 	mov	a,(_T0_INTERRUPTS_COUNTER + 1)
      0002A0 64 80            [12]  873 	xrl	a,#0x80
      0002A2 94 84            [12]  874 	subb	a,#0x84
      0002A4 40 08            [24]  875 	jc	00103$
                                    876 ;	DSM-51-CLOCK.c:251: SECOND_PASSED_FLAG = TRUE;
                                    877 ;	assignBit
      0002A6 D2 00            [12]  878 	setb	_SECOND_PASSED_FLAG
                                    879 ;	DSM-51-CLOCK.c:252: T0_INTERRUPTS_COUNTER -= 1024;
      0002A8 E5 09            [12]  880 	mov	a,(_T0_INTERRUPTS_COUNTER + 1)
      0002AA 24 FC            [12]  881 	add	a,#0xfc
      0002AC F5 09            [12]  882 	mov	(_T0_INTERRUPTS_COUNTER + 1),a
      0002AE                        883 00103$:
                                    884 ;	DSM-51-CLOCK.c:254: }
      0002AE D0 D0            [24]  885 	pop	psw
      0002B0 D0 E0            [24]  886 	pop	acc
      0002B2 32               [24]  887 	reti
                                    888 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    889 ;	eliminated unneeded push/pop dpl
                                    890 ;	eliminated unneeded push/pop dph
                                    891 ;	eliminated unneeded push/pop b
                                    892 ;------------------------------------------------------------
                                    893 ;Allocation info for local variables in function 'initialize'
                                    894 ;------------------------------------------------------------
                                    895 ;	DSM-51-CLOCK.c:261: void initialize() {
                                    896 ;	-----------------------------------------
                                    897 ;	 function initialize
                                    898 ;	-----------------------------------------
      0002B3                        899 _initialize:
                                    900 ;	DSM-51-CLOCK.c:263: T0_INTERRUPTS_COUNTER = FALSE;
      0002B3 E4               [12]  901 	clr	a
      0002B4 F5 08            [12]  902 	mov	_T0_INTERRUPTS_COUNTER,a
      0002B6 F5 09            [12]  903 	mov	(_T0_INTERRUPTS_COUNTER + 1),a
                                    904 ;	DSM-51-CLOCK.c:264: SECOND_PASSED_FLAG = FALSE;
                                    905 ;	assignBit
      0002B8 C2 00            [12]  906 	clr	_SECOND_PASSED_FLAG
                                    907 ;	DSM-51-CLOCK.c:265: INTERRUPT_T0_FLAG = FALSE;
                                    908 ;	assignBit
      0002BA C2 01            [12]  909 	clr	_INTERRUPT_T0_FLAG
                                    910 ;	DSM-51-CLOCK.c:268: ACTIVE_KEYBOARD_DISPLAY_INDEX = 0;
      0002BC 75 1B 00         [24]  911 	mov	_ACTIVE_KEYBOARD_DISPLAY_INDEX,#0x00
                                    912 ;	DSM-51-CLOCK.c:269: ACTIVE_KEYBOARD_DISPLAY_BIT = 0b00000001;
      0002BF 75 1A 01         [24]  913 	mov	_ACTIVE_KEYBOARD_DISPLAY_BIT,#0x01
                                    914 ;	DSM-51-CLOCK.c:272: ACTIVE_DISPLAY_INDEX = 0;
      0002C2 75 14 00         [24]  915 	mov	_ACTIVE_DISPLAY_INDEX,#0x00
                                    916 ;	DSM-51-CLOCK.c:273: ACTIVE_DISPLAY_BIT = 0b00000001;
      0002C5 75 15 01         [24]  917 	mov	_ACTIVE_DISPLAY_BIT,#0x01
                                    918 ;	DSM-51-CLOCK.c:276: TH0 = 228;
      0002C8 75 8C E4         [24]  919 	mov	_TH0,#0xe4
                                    920 ;	DSM-51-CLOCK.c:277: TH1 = 250;
      0002CB 75 8D FA         [24]  921 	mov	_TH1,#0xfa
                                    922 ;	DSM-51-CLOCK.c:278: TL0 = 124;
      0002CE 75 8A 7C         [24]  923 	mov	_TL0,#0x7c
                                    924 ;	DSM-51-CLOCK.c:279: TL1 = 250;
      0002D1 75 8B FA         [24]  925 	mov	_TL1,#0xfa
                                    926 ;	DSM-51-CLOCK.c:282: TF1 = FALSE;
                                    927 ;	assignBit
      0002D4 C2 8F            [12]  928 	clr	_TF1
                                    929 ;	DSM-51-CLOCK.c:283: RI = FALSE;
                                    930 ;	assignBit
      0002D6 C2 98            [12]  931 	clr	_RI
                                    932 ;	DSM-51-CLOCK.c:284: TI = FALSE;
                                    933 ;	assignBit
      0002D8 C2 99            [12]  934 	clr	_TI
                                    935 ;	DSM-51-CLOCK.c:287: ET0 = TRUE;
                                    936 ;	assignBit
      0002DA D2 A9            [12]  937 	setb	_ET0
                                    938 ;	DSM-51-CLOCK.c:288: ES = TRUE;
                                    939 ;	assignBit
      0002DC D2 AC            [12]  940 	setb	_ES
                                    941 ;	DSM-51-CLOCK.c:289: EA = TRUE;
                                    942 ;	assignBit
      0002DE D2 AF            [12]  943 	setb	_EA
                                    944 ;	DSM-51-CLOCK.c:290: TR0 = TRUE;
                                    945 ;	assignBit
      0002E0 D2 8C            [12]  946 	setb	_TR0
                                    947 ;	DSM-51-CLOCK.c:291: TR1 = TRUE;
                                    948 ;	assignBit
      0002E2 D2 8E            [12]  949 	setb	_TR1
                                    950 ;	DSM-51-CLOCK.c:292: }
      0002E4 22               [24]  951 	ret
                                    952 ;------------------------------------------------------------
                                    953 ;Allocation info for local variables in function 'clock'
                                    954 ;------------------------------------------------------------
                                    955 ;	DSM-51-CLOCK.c:299: void clock() {
                                    956 ;	-----------------------------------------
                                    957 ;	 function clock
                                    958 ;	-----------------------------------------
      0002E5                        959 _clock:
                                    960 ;	DSM-51-CLOCK.c:301: if(INTERRUPT_T0_FLAG == 1) {
                                    961 ;	DSM-51-CLOCK.c:302: INTERRUPT_T0_FLAG = 0;      // USTAW FLAGĘ PRZERWANIA NA 0
                                    962 ;	assignBit
      0002E5 10 01 01         [24]  963 	jbc	_INTERRUPT_T0_FLAG,00109$
      0002E8 22               [24]  964 	ret
      0002E9                        965 00109$:
                                    966 ;	DSM-51-CLOCK.c:303: update_time();              // OBSŁUŻ LICZNIK CZASU
      0002E9 12 02 77         [24]  967 	lcall	_update_time
                                    968 ;	DSM-51-CLOCK.c:304: keyboard();                 // OBSŁUŻ KLAWIATURĘ
      0002EC 12 01 E8         [24]  969 	lcall	_keyboard
                                    970 ;	DSM-51-CLOCK.c:305: display();                  // OBSŁUŻ WYŚWIETLACZ
                                    971 ;	DSM-51-CLOCK.c:307: }
      0002EF 02 00 B0         [24]  972 	ljmp	_display
                                    973 ;------------------------------------------------------------
                                    974 ;Allocation info for local variables in function 'main'
                                    975 ;------------------------------------------------------------
                                    976 ;	DSM-51-CLOCK.c:313: void main() {
                                    977 ;	-----------------------------------------
                                    978 ;	 function main
                                    979 ;	-----------------------------------------
      0002F2                        980 _main:
                                    981 ;	DSM-51-CLOCK.c:315: initialize();
      0002F2 12 02 B3         [24]  982 	lcall	_initialize
                                    983 ;	DSM-51-CLOCK.c:318: while(TRUE) {
      0002F5                        984 00102$:
                                    985 ;	DSM-51-CLOCK.c:319: clock();
      0002F5 12 02 E5         [24]  986 	lcall	_clock
                                    987 ;	DSM-51-CLOCK.c:321: }
      0002F8 80 FB            [24]  988 	sjmp	00102$
                                    989 	.area CSEG    (CODE)
                                    990 	.area CONST   (CODE)
      0002FE                        991 _DISPLAY_PATTERNS:
      0002FE 3F                     992 	.db #0x3f	; 63
      0002FF 06                     993 	.db #0x06	; 6
      000300 5B                     994 	.db #0x5b	; 91
      000301 4F                     995 	.db #0x4f	; 79	'O'
      000302 66                     996 	.db #0x66	; 102	'f'
      000303 6D                     997 	.db #0x6d	; 109	'm'
      000304 7D                     998 	.db #0x7d	; 125
      000305 07                     999 	.db #0x07	; 7
      000306 7F                    1000 	.db #0x7f	; 127
      000307 6F                    1001 	.db #0x6f	; 111	'o'
                                   1002 	.area XINIT   (CODE)
                                   1003 	.area CABS    (ABS,CODE)
