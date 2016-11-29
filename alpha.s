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

menu						;// LOOP FOR USER START (C)
			LDA	ir1		;// CHECK INPUT KEYROW 1
			SUB	ksa		;// CHECK INPUT KEYROW 1 START
			JNE	menu	;// LOOP menu
			JGE	load	;// START LOADING TIME

load



skip						;// IF NO INPUT, DELAY AND SKIP


input						;// LOOP FOR USER INPUT



halt
			LDA	one		;// SET ACC TO ONE
			STA stp		;// SET STOP SIGNAL TO ONE

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

			LDA	stp			;//	LOAD STOP SIGNAL
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

;// 	|-------------------------------------|
;// 	| PROGRAM MEMORY ALOCATION            |
;//		|-------------------------------------|

;//		| DISPLAY POSITIONS                   |

top		DEFW	&0001	;//	DISPLAY: 0000_0001
mid		DEFW	&0002	;//	DISPLAY: 0100_0000
bot		DEFW	&0003	;// DISPLAY: 0000_1000

;//		|	BOARD COMPONENTS OUTPUT							|

dp0		DEFW	&FF5	;// DISPLAY 0
dp1		DEFW	&FF6	;// DISPLAY 1
dp2		DEFW	&FF7	;// DISPLAY 2
dp3		DEFW	&FF8	;// DISPLAY 3
dp4		DEFW	&FF9	;// DISPLAY 4
dp5		DEFW	&FFA	;// DISPLAY 5

dbg		DEFW	&FFE	;//	BAR GRAPH

;//		| BOARD COMPONENTS INPUTS							|

isw		DEFW	&FEE	;// SWITCHES

ir1		DEFW	&FEF	;// ROW 1
ir4		DEFW	&FF2	;// ROW 4

;//		| DECIMALS														|

nul		DEFW	&0000	;// CONSTANT ZERO VALUE
one		DEFW	&0001	;// CONSTANT ONE  VALUE

;//		| SIGNALS															|

stp		DEFW	&0000	;// PROGRAM STOP SIGNAL

;//		| KEYROWS															|

krt		DEFW	&0080	;// KEYROW 4, RESET
kst		DEFW	&0002	;// KEYROW 1, AC
ksa		DEFW	&0004	;// KEYROW 1, C
ksf		DEFW	&0040	;// KEYROW 4, SHIFT

;//		|	SWITCHES														|

lmv		DEFW	&0001	;// SWITCH 1
rmv		DEFW	&0002	;//	SWITCH 2
mmv		DEFW	&0003	;//	SWITCH 1 & SWITCH 2

;//		| DELAYS															|
dld	DEFW	&FFFF	;//	MAX LOAD TIME
dco	DEFW	&FFF0	;// WAIT FOR F LOOPS

;//		|-------------------------------------|
;//		| SOURCE CODE STOPS HERE              |
;// 	|-------------------------------------|
