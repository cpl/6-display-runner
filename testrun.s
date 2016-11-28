;// --------------------------------------------------------------------
;// 6 DISPLAY RUNNER - A MU0 GAME
;// by Alexandru-Paul Copil, mbaxaac3
;// (thee-engineer)
;//
;// LICENSE: MIT
;//
;// STARTED ON : 28/11/2016
;// LAST EDIT  : XX/11/2016


;// SPECIFICATIONS & INSTRUCTIONS
;//
;// THE GIVEN GAME USES A SPECIAL SEVEN-SEGMENT-DECODER
;// THAT TAKES A INPUT 0..3, EACH SIGNAL MARKING A
;// POSITION ON THE DISPLAY:
;//	0 - null state
;//	1 - bottom segment
;//	2 - middle segment
;//	3 - top    segment
;//	4 - null state


;// BOARD DISPLAY MEMORY LOCATIONS:
;// START	END
;// FF5		FFA
;// RIGHT	LEFT

;// LEFT MOST DISPLAY IS THE PLAYER
;// FFA - PLAYER

;// --------------------------------------------------------------------


;// ---------------------------
;// PROGRAM RUNTIME BEGINS HERE
;// START
;// ---------------------------

start	ORG	0000


;// IF NO INPUT, DELAY AND SKIP
skip

;// TAKE INPUT FROM THE BOARD
input


	LDA	&FF2	;// CHECK ROW4
	SUB	kreset	;// CHECK reset
	JNE	s1	;// CHECK NOT ZERO
	JGE	m_flush	;// FLUSH BOARD
s1
	
	LDA	&FEE	;// CHECK SWITCHES
	SUB	mms	;// CHECK both switchs
	JNE	s2	;// CHECK NON ZERO
	JGE	m_pmm	;// MOVE mid
s2

	LDA	&FEE	;// CHECK SWITCHES
	SUB	rms	;// CHECK right switch
	JNE	s3	;// CHECK NON ZERO
	JGE	m_pmb	;// MOVE bot
s3

	LDA	&FEE	;// CHECK SWITCHES
	SUB	lms	;// CHECK left switch
	JNE	s4	;// CHECK NON ZERO
	JGE	m_pmt	;// MOVE top
s4

	LDA	&FEF	;// CHECK ROW1
	SUB	kstop	;// CHECK stop
	JNE	s5	;// CHECK NON ZERO
	JGE	stop	;// STOP stop
s5
	

	JMP	skip
;// LOOP HERE FOR INPUTS


stop	STP
;// -------------------------
;// PROGRAM RUNTIME ENDS HERE
;// STOP
;// -------------------------

;// -------------------------
;// MEMORY ALOCATION
;// -------------------------

;// DEFINE THE PLAYER POSITIONS ON THE LEFT MOST
;// 7 SEGEMENT DIGIT DISPLAY.
;// CAN BE REUSED FOR OTHER PURPOSES TOO


top	DEFW	&0001	;// Display: 0000_0001
mid	DEFW	&0002	;// Display: 0100_0000
bot	DEFW	&0003	;// Display: 0000_1000
nul	DEFW	&0000	;// Display: 1000_0000

;// UTILITY BUTTONS

kreset	DEFW	&0080	;// KeyRow4: reset
kshift	DEFW	&0040	;// KeyRow4: shift
kstop	DEFW	&0002	;// KeyRow1: AC

;// MOVEMENT KEYS

lms	DEFW	&0001	;// Switch1: up
rms	DEFW	&0002	;// Switch2: down
mms	DEFW	&0003	;// Switch1 & Switch2: mid

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
m_all	;// SET ALL DISPLAYS TO THE VALUE IN ACC
	STA	&FF5	;// display 0
	STA	&FF6	;// display 1
	STA	&FF7	;// display 2
	STA	&FF8	;// display 3
	STA	&FF9	;// display 4
	STA	&FFA	;// display 5
	
	JMP	input	;// RESET BACK TO input

STP
m_flush	;// SET ALL DISPLAYS TO nul
	LDA	nul
	JMP	m_all
;// END m_flush


STP
m_dat	;// SET ALL DISPLAYS TO top
	LDA	top
	JMP	m_all
;// END m_dat


STP
m_dam	;// SET ALL DISPLAYS TO mid
	LDA	mid
	JMP	m_all
;// END m_dam


STP
m_dab	;// SET ALL DISPLAYS TO bot
	LDA	bot
	JMP	m_all
;// END m_dab


STP
m_pmt	;// SET player TO top
	LDA	top
	STA	&FFA
	JMP	input
;// END m_dpt


STP
m_pmm	;// SET player TO mid
	LDA	mid
	STA	&FFA
	JMP	input
;// END m_dpm


STP
m_pmb	;// SET player TO bot
	LDA	bot
	STA	&FFA
	JMP	input
;// END m_dpb


STP
m_pmn	;// SET player TO nul
	LDA	nul
	STA	&FFA
	JMP	input
;// END m_dpn


;// ---------------------
;// KILL ANY ROUGE METHOD
kill	STP
