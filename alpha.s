;// 	|-------------------------------------|
;// 	|  6 DISPLAY RUNNER - A MU0 GAME      |
;// 	|  by Alexandru-Paul Copil, mbaxaac3  |
;// 	|  (thee-engineer)                    |
;// 	|                                     |
;// 	|  LICENSE: MIT                       |
;// 	|                                     |
;// 	|  STARTED ON : 28/11/2016            |
;// 	|  LAST EDIT  : XX/11/2016            |
;// 	|                                     |
;// 	|-------------------------------------|


;//		|-------------------------------------|
;//		| SOURCE CODE BEGINS BELOW            |
;// 	|-------------------------------------|

;// 	|-------------------------------------|
;// 	| PROGRAM RUNTIME BEGINS BELOW        |
;// 	|-------------------------------------|

init	ORG	0000	;// RESET MEMORY ADRESS

			JMP	mrst	;// RESET BOARD COMPONENTS

runt						;// START PROGRAM RUNTIME

;// 	|-------------------------------------|
;// 	| WAIT FOR START INPUT (C)		        |
;// 	|-------------------------------------|

menu						;// LOOP FOR USER START (C)
			LDA	kr1		;// CHECK INPUT KEYROW 1
			SUB	ksa		;// CHECK INPUT KEYROW 1 START
			JNE	menu	;// LOOP menu
			JGE	load	;// START LOADING TIME

;// 	|-------------------------------------|
;// 	| PASS LOADING TIME						        |
;// 	|-------------------------------------|

load						;// START WAITING TIME

			LDA dlc		;// LOAD GLOBAL COUNT
			STA	tmp		;// STORE LOCAL COUNT
ldc
			LDA	dly		;// LOAD DELAY TIME
ldl0	SUB one		;// COUNT DOWN
			JNE	ldl0	;// LOOP
			LDA	tmp		;// LOAD DELAY COUNT
			SUB one		;// COUNT DOWN
			STA dbg		;// UPDATE GRAPH BAR
			STA	tmp		;// STORE COUNT
			JNE	ldc		;// DELAY MORE

;// 	|-------------------------------------|
;// 	| SKIP LOADING TIME						        |
;// 	|-------------------------------------|

skip						;// IF NO INPUT, DELAY AND SKIP

			LDA dlp		;// LOAD GLOBAL COUNT
			STA tmp		;// STORE LOCAL COUNT
ldp
			LDA	dly		;// LOAD DELAY TIME
ldl1	SUB one		;// COUNT DOWN
			JNE ldl1	;// LOOP
			LDA tmp		;// LOAD DELAY COUNT
			SUB one		;// COUNT DOWN
			STA	dbg		;// UPDATE GRAPH BAR
			STA	tmp		;// STORE COUNT
			JNE	ldp		;// DELAY MORE


;// 	|-------------------------------------|
;// 	| SCAN FOR USER INPUT					        |
;// 	|-------------------------------------|

input						;// LOOP FOR USER INPUT


			LDA	kr1		;// CHECK KEYROW 1
			SUB	kst		;// CHECK FOR AC
			JNE	s0		;// CHECK NON ZERO
			JGE	halt	;// CALL HALT
s0

			LDA	kr4	  ;// CHECK KEYROW 4
			SUB	krt	  ;// CHECK RESET
			JNE	s1	  ;// CHECK NOT ZERO
			JGE	mrst  ;// RESET BOARD
s1

			LDA	ksw		;// CHECK SWITCHES
			SUB	mmv	  ;// CHECK SWITCH 1,2
			JNE	s2	  ;// CHECK NON ZERO
			JGE	mmid  ;// MOVE mid
s2

			LDA	ksw	  ;// CHECK SWITCHES
			SUB	bmv	  ;// CHECK SWITCH 2
			JNE	s3	  ;// CHECK NON ZERO
			JGE	mbot  ;// MOVE bot
s3

			LDA	ksw  	;// CHECK SWITCHES
			SUB	tmv	  ;// CHECK FOR SWITCH 1
			JNE	s4	  ;// CHECK NON ZERO
			JGE	mtop	;// MOVE top
s4


			JMP	mmid	;// IF NOT INPUT, STAY MID

;// 	|-------------------------------------|
;// 	| HALT												        |
;// 	|-------------------------------------|

halt
			LDA	nul		;// SET ACC TO ONE
			STA hlt		;// SET STOP SIGNAL TO ONE

			JMP mrst	;// RESET THEN STOP

;// 	|-------------------------------------|
;// 	| PROGRAM RUNTIME STOPS HERE          |
;// 	|-------------------------------------|

;// 	|-------------------------------------|
;// 	| PROGRAM METHODS                     |
;//		|-------------------------------------|

STP
mrst							;// RESET/STOP THE PROGRAM
			LDA nul			;// LOAD NULL

			STA	dp0			;// RESET DISPLAY 0
			STA	dp1			;// RESET DISPLAY 1
			STA	dp2			;// RESET DISPLAY 2
			STA	dp3			;// RESET DISPLAY 3
			STA	dp4			;// RESET DISPLAY 4
			STA	dp5			;// RESET DISPLAY 5

			STA	dbg			;// RESET BAR GRAPH

			LDA	hlt			;//	LOAD STOP SIGNAL
			JNE	runt		;//	START THE PROGRAM

			STP					;// STOP THE PROGRAM

STP
mlal							;// SET ALL DISPLAYS TO ACC
			STA	dp0			;// SET DISPLAY 0
			STA	dp1			;// SET DISPLAY 1
			STA dp2			;// SET DISPLAY 2
			STA	dp3			;// SET DISPLAY 3
			STA	dp4			;// SET DISPLAY 4
			STA	dp5			;// SET DISPLAY 5
			STA	dbg			;// SET BAR GRAPH

STP
mtop							;// MOVE PLAYER TO TOP
			LDA	top			;// LOAD TOP POSITION
			STA	dp5			;// SET DISPLAY TO POS
			JMP	skip

STP
mmid							;// MOVE PLAYER TO MIDDLE
			LDA	mid			;// LOAD MIDDLE POSITION
			STA	dp5			;// SET DISPLAY TO POS
			JMP	skip

STP
mbot							;// MOVE PLAYER TO BOTTOM
			LDA	bot			;// LOAD BOTTOM POSITION
			STA	dp5			;// SET DISPLAY TO POS
			JMP	skip

;// 	|-------------------------------------|
;// 	| PROGRAM MEMORY ALOCATION            |
;//		|-------------------------------------|

;//		| DISPLAY POSITIONS                   |

top		DEFW	&0001	;//	DISPLAY: 0000_0001
mid		DEFW	&0002	;//	DISPLAY: 0100_0000
bot		DEFW	&0003	;// DISPLAY: 0000_1000

;//		| DECIMALS														|

nul		DEFW	&0000	;// CONSTANT ZERO VALUE
one		DEFW	&0001	;// CONSTANT ONE  VALUE

;//		| SIGNALS															|

hlt		DEFW	&0001	;// PROGRAM HALT SIGNAL

;//		| KEYROWS															|

krt		DEFW	&0080	;// KEYROW 4, RESET
kst		DEFW	&0002	;// KEYROW 1, AC
ksa		DEFW	&0004	;// KEYROW 1, C
ksf		DEFW	&0040	;// KEYROW 4, SHIFT

;//		|	SWITCHES														|

tmv		DEFW	&0001	;// SWITCH 1
bmv		DEFW	&0002	;//	SWITCH 2
mmv		DEFW	&0003	;//	SWITCH 1 & SWITCH 2

;//		| DELAYS															|
dly		DEFW	50000	;//	INNER DELAY TIME
dlc		DEFW	00016	;// WAIT FOR N SECONDS
dlp		DEFW	00003	;// WAIT FOR INPUT

;//		|	TEMPORARY STORAGE	VARIABLES					|
tmp		DEFW	&0000	;//	TEMPROARY VARIABLE

;// 	|-------------------------------------|
;// 	| COMPILER DEFINED CONSTANTS          |
;//		|-------------------------------------|

;//		|	OUTPUTS															|

dp0		EQU		&FF5	;// CONSTANT DISPLAY 0
dp1		EQU		&FF6	;// CONSTANT DISPLAY 0
dp2		EQU		&FF7	;// CONSTANT DISPLAY 0
dp3		EQU		&FF8	;// CONSTANT DISPLAY 0
dp4		EQU		&FF9	;// CONSTANT DISPLAY 0
dp5		EQU		&FFA	;// CONSTANT DISPLAY 0

dbg		EQU		&FFE	;// CONSTANT BAR GRAPH

;//		| INPUTS															|

kr1		EQU		&FEF	;// KEY ROW 1
kr4		EQU		&FF2	;// KEY ROW 4
ksw		EQU		&FEE	;// SWITCHES


;//		|-------------------------------------|
;//		| SOURCE CODE STOPS HERE              |
;// 	|-------------------------------------|
