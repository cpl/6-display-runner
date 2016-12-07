;#pySEQ
car1
LDA bot
STA dp0
JMP nsq
car2
LDA bot
STA dp0
JMP nsq
car3
LDA bot
STA dp0
JMP nsq
car4
LDA top
STA dp0
JMP nsq
car5
LDA mid
STA dp0
JMP nsq
car6
LDA top
STA dp0
JMP nsq
;#pyEND

LDA stuff ;// THING
STA TEST
;// COMMENETS

;#pyLNK
JMP car1
JMP car2
JMP car3
JMP car4
JMP car5
JMP car6
;#pyEND
