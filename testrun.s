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
;// --------------------------------------------------------------------

;// DEFINE THE PLAYER POSITIONS ON THE LEFT MOST
;// 7 SEGEMENT DIGIT DISPLAY.

top	DEFW	&0001	;// Display: 0000_0001
mid	DEFW	&0002	;// Display: 0100_0000
bot	DEFW	&0003	;// Display: 0000_1000
nul	DEFW	&0000	;// Display: 1000_0000

;// ---------------------------
;// PROGRAM RUNTIME BEGINS HERE
;// START
;// ---------------------------

start	ORG	0000	;// BEGIN AT RESET ADDRESS

	JMP	m_flush















stop	STP
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

m_all	;// SET ALL DISPLAYS TO THE VALUE IN ACC
	STA	&FF5	;// display 0
	STA	&FF6	;// display 1
	STA	&FF7	;// display 2
	STA	&FF8	;// display 3
	STA	&FF9	;// display 4
	STA	&FFA	;// display 5


m_flush	;// SET ALL DISPLAYS TO nul
	LDA	nul
	JMP	m_all
;// END m_flush


m_dat	;// SET ALL DISPLAYS TO top
	LDA	top
	JMP	m_all
;// END m_dat


m_dam	;// SET ALL DISPLAYS TO mid
	LDA	mid
	JMP	m_all
;// END m_dam


m_dab	;// SET ALL DISPLAYS TO bot
	LDA	bot
	JMP	m_all
;// END m_dab


;// ---------------------
;// KILL ANY ROUGE METHOD
kill	STP
