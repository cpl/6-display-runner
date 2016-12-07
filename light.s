init	ORG	0000	
			JMP	mrst	
runt						
menu						
			LDA	kr1		
			SUB	ksa		
			JNE	menu	
			JGE	load	
load						
			LDA	dlc		
			STA	tmp		
			LDA	dly		
ldl0	SUB	one		
			JNE	ldl0	
			LDA	tmp		
			SUB	one		
			STA	tmp		
			LDA	tbg		
			STA	dbg		
			ADD tbg		
			STA tbg		
			JNE	ldc		
			JMP input	
skip						
			JMP	shift	
s5							
			LDA	dlp		
			STA	tmp		
			LDA	dly		
ldl1	SUB	one		
			JNE	ldl1	
			LDA	tmp		
			SUB	one		
			STA	tmp		
			JNE	ldp		
input						
			LDA	kr1		
			SUB	kst		
			JNE	s0		
			JGE	halt	
			LDA	kr4		
			SUB	krt		
			JNE	s1		
			JGE	mrst	
			LDA	dp5		
			JNE s9		
			JMP s6		
			SUB	dp4		
			JNE	s6		
			JGE	mrst	
			LDA	ksw		
			SUB	mmv		
			JNE	s2		
			JGE	mmid	
			LDA	ksw		
			SUB	bmv		
			JNE	s3		
			JGE	mbot	
			LDA	ksw		
			SUB	tmv		
			JNE	s4		
			JGE	mtop	
			LDA kr4		
			SUB ksf		
			JNE s7		
			LDA mid		
			STA dp0		
			
			JMP	mmid	
			LDA	nul		
			STA hlt		
			JMP mrst	
mrst							
			LDA nul			
			STA	dp0			
			STA	dp1			
			STA	dp2			
			STA	dp3			
			STA	dp4			
			STA	dp5			
			LDA fff			
			STA	dbg			
			LDA	spr			
			STA	bzz			
			LDA	hlt			
			JNE	runt		
			LDA	sht			
			STA	bzz			
			LDA nul			
			STA	dbg			
			STP					
mlal							
			STA	dp0			
			STA	dp1			
			STA dp2			
			STA	dp3			
			STA	dp4			
			STA	dp5			
			STA	dbg			
			JMP skip		
mtop							
			LDA	top			
			STA	dp5			
			LDA sdu			
			STA	bzz			
mmid							
			LDA	mid			
			STA	dp5			
			LDA smd			
			STA	bzz			
mbot							
			LDA	bot			
			STA	dp5			
			LDA sdd			
			STA	bzz			
shift							
			LDA	dp3			
			LDA	dp2			
			LDA	dp1			
			LDA	dp0			
			LDA nul			
			JMP mcemp		
nem		JMP	s5			
mcemp							
			LDA	dp0			
			JNE nem			
			LDA	dp1			
			JNE nem			
			
			
			LDA	dp3			
			JNE nem			
			
			
			JMP	sequence	
mhit							
			LDA php			
			SUB one			
			STA php			
			STA	dbg			
			JNE skip		
			JGE	mrst		
top		DEFW	&0001	
mid		DEFW	&0002	
bot		DEFW	&0003	
fff		DEFW	&FF		
php		DEFW	0b00001000	
nul		DEFW	&0000	
one		DEFW	&0001	
six		DEFW	&0006	
hlt		DEFW	&0001	
krt		DEFW	&0080	
kst		DEFW	&0002	
ksa		DEFW	&0004	
ksf		DEFW	&0040	
tmv		DEFW	&0001	
bmv		DEFW	&0002	
mmv		DEFW	&0003	
dly		DEFW	50001	
dlc		DEFW	00007	
dlp		DEFW	00003	
tbg		DEFW	&0001	
tmp		DEFW	&0000	
sqc		DEFW	&0000	
sma		DEFW	&0006	
jop		DEFW	&4000	
spr		DEFW	0b1000010001001000	
sht		DEFW	0b1000010000010001	
sdd		DEFW	0b1000001000010100	
sdu		DEFW	0b1000001001010110	
smd		DEFW	0b1000001000110110	
dp0		EQU		&FF5	
dp1		EQU		&FF6	
dp2		EQU		&FF7	
dp3		EQU		&FF8	
dp4		EQU		&FF9	
dp5		EQU		&FFA	
dbg		EQU		&FFE	
bzz		EQU		&FFD	
kr1		EQU		&FEF	
kr4		EQU		&FF2	
ksw		EQU		&FEE	
bzb		EQU		&FF3	
STP								
nsq								
			LDA 	sqc		
			ADD		one		
			STA 	sqc		
			SUB		sma		
			JNE		nem		
			LDA		nul		
			STA		sqc		
			JMP		nem		
sequence					
spc		LDA 	spc		
			ADD 	jop		
			ADD		sqc		
			ADD		six		
			STA 	jsq		
jsq		DEFW	jsq		
			JMP		nem		
STP								
