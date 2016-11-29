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

start						;// START PROGRAM RUNTIME



;// 	|-------------------------------------|
;// 	| PROGRAM RUNTIME STOPS HERE          |
;// 	|-------------------------------------|

;// 	|-------------------------------------|
;// 	| PROGRAM METHODS                     |
;//		|-------------------------------------|


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

dgb		DEFW	&FFE	;//	BAR GRAPH

;//		| BOARD COMPONENTS INPUTS							|

isw		DEFW	&FEE	;// SWITCHES

ir1		DEFW	&FEF	;// ROW 1
ir4		DEFW	&FF2	;// ROW 4

;//		| DECIMALS														|

nul		DEFW	&0000	;// CONSTANT ZERO VALUE
one		DEFW	&0001	;// CONSTANT ONE  VALUE

;//		| SIGNALS															|

sstp	DEFW	&0000	;// PROGRAM STOP SIGNAL

;//		| KEYROWS															|

krst	DEFW	&0080	;// KEYROW 4, RESET
kstp	DEFW	&0002	;// KEYROW 1, AC
ksar	DEFW	&0004	;// KEYROW 1, C
ksft	DEFW	&0040	;// KEYROW 4, SHIFT

;//		|	SWITCHES														|

lmov	DEFW	&0001	;// SWITCH 1
rmov	DEFW	&0002	;//	SWITCH 2
mmov	DEFW	&0003	;//	SWITCH 1 & SWITCH 2

;//		| DELAYS															|
dlod	DEFW	&FFFF	;//	MAX LOAD TIME
dcon	DEFW	&FFF0	;// WAIT FOR F LOOPS

;//		|-------------------------------------|
;//		| SOURCE CODE STOPS HERE              |
;// 	|-------------------------------------|
