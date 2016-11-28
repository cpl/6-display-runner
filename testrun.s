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


;// DEFINE THE PLAYER POSITIONS ON THE LEFT MOST
;// 7 SEGEMENT DIGIT DISPLAY.

top	DEFW	&0008;// Display: 0000_0001
mid	DEFW	&0007;// Display: 0100_0000
bot	DEFW	&0006;// Display: 0000_1000


;// PROGRAM RUNTIME BEGINS HERE
;// START

	LDA	0000	;// BEGIN ACC AT 0






	LDA	&9999	;// END ACC AT 9999
stop	STP
;// PROGRAM RUNTIME ENDS HERE
;// STOP
