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
			LDA	&FEF	;// CHECK INPUT KEYROW 1
			SUB	ksa		;// CHECK INPUT KEYROW 1 START
			JNE	menu	;// LOOP menu
			JGE	load	;// START LOADING TIME

;// 	|-------------------------------------|
;// 	| PASS LOADING TIME						        |
;// 	|-------------------------------------|

load						;// START WAITING TIME
			LDA	dly		;// LOAD DELAY TIME
ld		ADD one		;// COUNT UP
			STA	&FFE	;// LOAD BAR GRAPH
			JGE	ld		;// LOOP

;// 	|-------------------------------------|
;// 	| SKIP LOADING TIME						        |
;// 	|-------------------------------------|

skip						;// IF NO INPUT, DELAY AND SKIP


;// 	|-------------------------------------|
;// 	| SCAN FOR USER INPUT					        |
;// 	|-------------------------------------|

input						;// LOOP FOR USER INPUT

			LDA	&FF2  ;// CHECK KEYROW 4
			SUB	krt	  ;// CHECK RESET
			JNE	s1	  ;// CHECK NOT ZERO
			JGE	mrst  ;// RESET BOARD
s1

			LDA	&FEE	;// CHECK SWITCHES
			SUB	mmv	  ;// CHECK SWITCH 1,2
			JNE	s2	  ;// CHECK NON ZERO
			JGE	mmid  ;// MOVE mid
s2

			LDA	&FEE  ;// CHECK SWITCHES
			SUB	bmv	  ;// CHECK SWITCH 2
			JNE	s3	  ;// CHECK NON ZERO
			JGE	mbot  ;// MOVE bot
s3

			LDA	&FEE  ;// CHECK SWITCHES
			SUB	tmv	  ;// CHECK FOR SWITCH 1
			JNE	s4	  ;// CHECK NON ZERO
			JGE	mtop	;// MOVE top
s4

			LDA	&FEF	;// CHECK KEYROW 1
			SUB	kst		;// CHECK FOR AC
			JNE	s5		;// CHECK NON ZERO
			JGE	halt	;// CALL HALT
s5


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

			STA	&FF5		;// RESET DISPLAY 0
			STA	&FF6		;// RESET DISPLAY 1
			STA	&FF7		;// RESET DISPLAY 2
			STA	&FF8		;// RESET DISPLAY 3
			STA	&FF9		;// RESET DISPLAY 4
			STA	&FFA		;// RESET DISPLAY 5

			STA	&FFE			;// RESET BAR GRAPH

			LDA	hlt			;//	LOAD STOP SIGNAL
			JNE	runt		;//	START THE PROGRAM

			STP					;// STOP THE PROGRAM

STP
mlal							;// SET ALL DISPLAYS TO ACC
			STA	&FF5		;// SET DISPLAY 0
			STA	&FF6		;// SET DISPLAY 1
			STA &FF7		;// SET DISPLAY 2
			STA	&FF8		;// SET DISPLAY 3
			STA	&FF9		;// SET DISPLAY 4
			STA	&FFA		;// SET DISPLAY 5
			STA	&FFE		;// SET BAR GRAPH

STP
mtop							;// MOVE PLAYER TO TOP
			LDA	top			;// LOAD TOP POSITION
			STA	&FFA		;// SET DISPLAY TO POS
			JMP	skip

STP
mmid							;// MOVE PLAYER TO MIDDLE
			LDA	mid			;// LOAD MIDDLE POSITION
			STA	&FFA		;// SET DISPLAY TO POS
			JMP	skip

STP
mbot							;// MOVE PLAYER TO BOTTOM
			LDA	bot			;// LOAD BOTTOM POSITION
			STA	&FFA		;// SET DISPLAY TO POS
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
dly		DEFW	&000F	;//	START LOAD TIME
dlc		DEFW	&FFF0	;// WAIT FOR F LOOPS

;// 	|-------------------------------------|
;// 	| COMPILER DEFINED CONSTANTS          |
;//		|-------------------------------------|

dp0		EQU		&FF5	;// CONSTANT DISPLAY 0
dp1		EQU		&FF6	;// CONSTANT DISPLAY 0
dp2		EQU		&FF7	;// CONSTANT DISPLAY 0
dp3		EQU		&FF8	;// CONSTANT DISPLAY 0
dp4		EQU		&FF9	;// CONSTANT DISPLAY 0
dp5		EQU		&FFA	;// CONSTANT DISPLAY 0

dbg		EQU		&FFE	;// CONSTANT BAR GRAPH

;//		|-------------------------------------|
;//		| SOURCE CODE STOPS HERE              |
;// 	|-------------------------------------|
