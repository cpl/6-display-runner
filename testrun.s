;// |-------------------------------------|
;// |6 DISPLAY RUNNER - A MU0 GAME        |
;// |by Alexandru-Paul Copil, mbaxaac3    |
;// |(thee-engineer)                      |
;// |                                     |
;// |LICENSE: MIT                         |
;// |                                     |
;// |STARTED ON : 28/11/2016              |
;// |LAST EDIT  : XX/11/2016              |
;// |                                     |
;// |-------------------------------------|


;// |-------------------------------|
;// | PROGRAM RUNTIME BEGINS HERE   |
;// | START                         |
;// |-------------------------------|


start ORG 0000          ;// RESET MEMORY ADRESS

        JMP m_reset     ;// FULL SYSTEM RESET

init		                ;// START RUNTIME

menu	                  ;// BEGIN MENU

        LDA	&FEF        ;// CHECK ROW1
        SUB	kstart      ;// CHECK start
        JNE	menu        ;// CHECK NOT ZERO
        JGE	load        ;// GO TO LOADING


load                    ;// BEGIN LOADING

        LDA	dload       ;// LOAD LOADING DELAY
l1      SUB	one	        ;// SUB ONE FROM DELAY
	      JNE	l1	        ;// CHECK IF END OF DELAY
        LDA	dcount	    ;// LOAD COUNT
        ADD	one	        ;// ADD TO COUNTS
        STA	dcount	    ;// STORE NEW COUNT
        JNE	load	      ;// IF NOT ZERO
        JMP	skip	      ;// IF ZERO

skip                    ;// IF NO INPUT, DELAY AND SKIP


input                   ;// TAKE INPUT FROM THE BOARD

        LDA	&FF2        ;// CHECK ROW4
        SUB	kreset      ;// CHECK reset
        JNE	s1	        ;// CHECK NOT ZERO
        JGE	m_reset     ;// FLUSH BOARD
s1

	      LDA	&FEE	      ;// CHECK SWITCHES
	      SUB	mms	        ;// CHECK both switchs
	      JNE	s2	        ;// CHECK NON ZERO
        JGE	m_pmm       ;// MOVE mid
s2

        LDA	&FEE        ;// CHECK SWITCHES
        SUB	rms	        ;// CHECK right switch
        JNE	s3	        ;// CHECK NON ZERO
        JGE	m_pmb       ;// MOVE bot
s3

	      LDA	&FEE				;// CHECK SWITCHES
	      SUB	lms	      	;// CHECK left switch
	      JNE	s4	     		;// CHECK NON ZERO
	      JGE	m_pmt	    	;// MOVE top
s4

	      LDA	&FEF	    	;// CHECK ROW1
	      SUB	kstop	    	;// CHECK stop
	      JNE	s5					;// CHECK NON ZERO
	      JGE	stop	    	;// STOP stop
s5


	;// FORCE PLAYER LOCATION TO THE MIDDLE
	;// IF NO CONTROL IS PRESSED

	      LDA	&FEE	    ;// CHECK SWITCHES
	      JNE	skip	    ;// CHECK NON ZERO
	      JMP	m_pmm			;// MOVE player TO mid


        ;// STOP THE GAME IF THE PLAYER REMOVES
        ;// CONTROL OF BOTH BUTTONS
        ;
        ;LDA	&FEE	;// CHECK SWITCHES
        ;JNE	skip	;// CHECK NON ZERO
        ;STP		;// STOP IF NOTHING
        ;
        ;// EXPERIMENTAL FEAUTRE


	      JMP	skip
;// LOOP HERE FOR INPUTS


stop
        LDA	s_stop
        SUB	one
	      STA	s_stop
	      JMP	m_reset

;// -------------------------
;// PROGRAM RUNTIME ENDS HERE
;// STOP
;// -------------------------

;// ----------------------------------
;// UTILITY METHODS GO BELOW THIS LINE
;// ----------------------------------


;// DEFINITONS:
;// m - method
;// d - digits
;//   a - all
;//     t - top
;//     m - mid
;//     b - bot


STP
m_reset	          			;// FULL SYSTEM RESET
        LDA	nul
        STA	&FF5				;// display 0
        STA	&FF6				;// display 1
        STA	&FF7				;// display 2
        STA	&FF8				;// display 3
        STA	&FF9				;// display 4
        STA	&FFA				;// display 5
        STA	&FFE				;// bar graph

	      LDA	s_stop			;// CHECK FOR STOP SIGNAL
	      JNE	init				;// NO SIGNAL, GO TO init

	      STP							;// STOP THE PROGRAM

STP
m_all										;// SET ALL DISPLAYS TO THE VALUE IN ACC
				STA	&FF5				;// display 0
				STA	&FF6				;// display 1
				STA	&FF7				;// display 2
				STA	&FF8				;// display 3
				STA	&FF9				;// display 4
				STA	&FFA				;// display 5

				JMP	skip				;// RESET BACK TO input, WAIT FOR skip

STP
m_flush									;// SET ALL DISPLAYS TO nul
				LDA	nul
				JMP	m_all


STP
m_dat										;// SET ALL DISPLAYS TO top
				LDA	top
				JMP	m_all


STP
m_dam										;// SET ALL DISPLAYS TO mid
				LDA	mid
				JMP	m_all


STP
m_dab										;// SET ALL DISPLAYS TO bot
				LDA	bot
				JMP	m_all


STP
m_pmt										;// SET player TO top
				LDA	top
				STA	&FFA
				JMP	skip


STP
m_pmm										;// SET player TO mid
				LDA	mid
				STA	&FFA
				JMP	skip


STP
m_pmb										;// SET player TO bot
				LDA	bot
				STA	&FFA
				JMP	skip


STP
m_pmn										;// SET player TO nul
				LDA	nul
				STA	&FFA
				JMP	skip


;// |---------------------|
;// |KILL ANY ROUGE METHOD|
;// |---------------------|
kill	STP




;// |-------------------------|
;// | MEMORY ALOCATION        |
;// |-------------------------|

;// DEFINE THE PLAYER POSITIONS ON THE LEFT MOST
;// 7 SEGEMENT DIGIT DISPLAY.
;// CAN BE REUSED FOR OTHER PURPOSES TOO

top	    DEFW	&0001	;// Display: 0000_0001
mid	    DEFW	&0002	;// Display: 0100_0000
bot	    DEFW	&0003	;// Display: 0000_1000
nul	    DEFW	&0000	;// Display: 1000_0000

;// UTILITY BUTTONS

kreset	DEFW	&0080	;// KeyRow4: reset
kshift	DEFW	&0040	;// KeyRow4: shift
kstop	  DEFW	&0002	;// KeyRow1: AC
kstart	DEFW	&0004	;// KeyRow1: C

;// MOVEMENT KEYS

lms	    DEFW	&0001	;// Switch1: up
rms	    DEFW	&0002	;// Switch2: down
mms	    DEFW	&0003	;// Switch1 & Switch2: mid

;// DELAYS
dload	  DEFW	&FFFF	;// INITIAL LOAD TIME DELAY
dcount	DEFW	&FFF0	;// NUMBER OF LOADS (FFFF-)

;// DECIMALS
zero	  DEFW	&0	;// NUMBER ZERO IN DECIMAL
one	    DEFW	&1	;// NUMBER ONE IN DECIMAL

;// SIGNALS
s_stop	DEFW	&1	;// INITAL TO 0, STOP SIGNAL
