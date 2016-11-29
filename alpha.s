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
			LDA	&FEF	;// CHECK INPUT KEYROW 1
			SUB	ksa		;// CHECK INPUT KEYROW 1 START
			JNE	menu	;// LOOP menu
			JGE	load	;// START LOADING TIME

load



skip						;// IF NO INPUT, DELAY AND SKIP


input						;// LOOP FOR USER INPUT



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

lmv		DEFW	&0001	;// SWITCH 1
rmv		DEFW	&0002	;//	SWITCH 2
mmv		DEFW	&0003	;//	SWITCH 1 & SWITCH 2

;//		| DELAYS															|
dld	DEFW	&FFFF	;//	MAX LOAD TIME
dco	DEFW	&FFF0	;// WAIT FOR F LOOPS

;//		|-------------------------------------|
;//		| SOURCE CODE STOPS HERE              |
;// 	|-------------------------------------|
