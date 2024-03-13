//Y = 256
//X = 512
//-256 (half off, half on)
//255 (half on, half off)
//-1 (on)
//0 (off)
//NEXT ROW: 512/16 = 32 registers per ROW
//NEXT COLUMN: 256/16 = 16 registers per COLUMN

//4 rows per pixel, 4 columns per pixel

//@SCREEN //A = 16384

@16512
D=A
@temploc	//A = 16
M=D			//temploc = 16512

@i
M=0

//First rectangle of C
(LOOP)  //while i - 20 < 0 (JGE)
@20
D=A		//D = 20
@i
D=M-D		//D = i - 20
@ENDLOOP
D;JGE

@255
D=A
@temploc
A=M			//A=16512
M=D			//Half on, half off

//update temploc by 32
@32
D=A		
@temploc
M=M+D		//temploc = temploc + 32

@i
M=M+1

@LOOP
0;JMP

(ENDLOOP)

//Upper start of C

@16384
D=A				//D = 16384
@temploc2 		//A = 18
M=D				//M = 16384

@k
M=0

(LOOPY)
@4
D=A
@k
D=M-D
@ENDLOOPY
D;JGE

@256
D=A
@0
D=M-D			//D = -256    //THIS IS SO STUPID HOW YOU CANT DO -256
@temploc2	
A=M
M=D

@32
D=A
@temploc2
M=M+D	

@k
M=M+1

@LOOPY
0;JMP

(ENDLOOPY)

//Lower Start of C

@17152
D=A
@temploc2
M=D

@k
M=0

(LOOOP)
@4
D=A
@k
D=M-D
@ENDLOOOP
D;JGE

@256
D=A
@0
D=M-D
@temploc2
A=M
M=D

@32
D=A
@temploc2
M=M+D

@k
M=M+1

@LOOOP
0;JMP

(ENDLOOOP)

//Continuation of upper and lower part of C

@16385
D=A
@temploc4
M=D

@j
M=0

(LOOP4)
@4
D=A
@j
D=M-D
@ENDLOOP4
D;JGE

@255
D=A
@temploc4
A=M
M=D

@32
D=A
@temploc4
M=M+D

@j
M=M+1

@LOOP4
0;JMP

(ENDLOOP4)

@17153
D=A
@temploc5
M=D

@j
M=0

(LOOP5)
@4
D=A
@j
D=M-D
@ENDLOOP5
D;JGE

@255
D=A
@temploc5
A=M
M=D

@32
D=A
@temploc5
M=M+D

@j
M=M+1

@LOOP5
0;JMP

(ENDLOOP5)



//BEGINNING OF S

@16386
D=A
@temploc6
M=D

@j
M=0

(LOOP6)
@16
D=A
@j
D=M-D
@ENDLOOP6
D;JGE

@256
D=A
@0
D=M-D
@temploc6
A=M
M=D

@32
D=A
@temploc6
M=M+D

@j
M=M+1

@LOOP6
0;JMP

(ENDLOOP6)

@16387
D=A
@TEMPLOC7
M=D

@J
M=0

(LOOP7)
@4
D=A
@J
D=M-D
@ENDLOOP7
D;JGE

@TEMPLOC7
A=M
M=-1

@32
D=A
@TEMPLOC7
M=M+D

@J
M=M+1

@LOOP7
0;JMP

(ENDLOOP7)

//Im so close to figuring out how to better loop these pieces.... its quite unintuitive

@16771
D=A
@TEMPLOC8
M=D

@J
M=0

(LOOP8)
@4
D=A
@J
D=M-D
@ENDLOOP8
D;JGE

@TEMPLOC8
A=M
M=-1

@32
D=A
@TEMPLOC8
M=M+D

@J
M=M+1

@LOOP8
0;JMP

(ENDLOOP8)

@16899
D=A
@TEMPLOC9
M=D

@Z
M=0

(LOOP9)
@12
D=A
@Z
D=M-D
@ENDLOOP9
D;JGE

@256
D=A
@0
D=M-D
@TEMPLOC9
A=M
M=D

@32
D=A
@TEMPLOC9
M=M+D

@Z
M=M+1

@LOOP9
0;JMP

(ENDLOOP9)


 @17155
 D=A
 @LOC1
 M=D
 
 @J
 M=0
 
 (LLOOP1)
 @4
 D=A
 @J
 D=M-D
 @ENDLLOOP1
 D;JGE
 
 @LOC1
 A=M
 M=-1
 
 @32
 D=A
 @LOC1
 M=M+D
 
 @J
 M=M+1
 
 @LLOOP1
 0;JMP
 
 (ENDLLOOP1)


@17154
D=A
@LOC2
M=D

@J
M=0

(LLOOP2)
@4
D=A
@J
D=M-D
@ENDLLOOP2
D;JGE

@256
D=A
@0
D=M-D
@LOC2
A=M
M=D

@32
D=A
@LOC2
M=M+D

@J
M=M+1

@LLOOP2
0;JMP

(ENDLLOOP2)




//START OF FIRST 2

@16389
D=A
@POS
M=D

@P
M=0

(TWOLOOP)
@4
D=A
@P
D=M-D
@ENDTWOLOOP
D;JGE


@POS
A=M
M=-1

@32
D=A
@POS
M=M+D

@P
M=M+1

@TWOLOOP
0;JMP

(ENDTWOLOOP)

@16773
D=A
@POS1
M=D

@P2
M=0

(TWOLOOPAGAIN)
@4
D=A
@P2
D=M-D
@ENDTWOLOOPAGAIN
D;JGE

@POS1
A=M
M=-1

@32
D=A
@POS1
M=M+D

@P2
M=M+1

@TWOLOOPAGAIN
0;JMP

(ENDTWOLOOPAGAIN)

@17157
D=A
@POS2
M=D

@P3
M=0

(ANOTHERLOOP)
@4
D=A
@P3
D=M-D
@ENDANOTHERLOOP
D;JGE

@POS2
A=M
M=-1

@32
D=A
@POS2
M=M+D

@P3
M=M+1

@ANOTHERLOOP
0;JMP

(ENDANOTHERLOOP)

@16390
D=A
@TVR	//TWO VERTICAL RIGHT 
M=D

@C
M=0

(jesusChristISimplyDontSeeHowToDoThisEasier)     //Partially true, I see that in the declaration above TWO VERTICAL RIGHT there is something you can do, but I dont know what that something is
@16
D=A
@C
D=M-D
@ENDEASY
D;JGE

@255
D=A
@TVR
A=M
M=D

@32
D=A
@TVR
M=M+D

@C
M=M+1

@jesusChristISimplyDontSeeHowToDoThisEasier
0;JMP

(ENDEASY)


@16901
D=A
@TVL		//TWO VERTICAL LEFT
M=D

@E
M=0

(WHENWILLITEND)
@8
D=A
@E
D=M-D
@ITWILLENDNOW
D;JGE

@255
D=A
@TVL
A=M
M=D

@32
D=A
@TVL
M=M+D

@E
M=M+1

@WHENWILLITEND
0;JMP

(ITWILLENDNOW)




//START OF SECOND 2

@16392
D=A
@POSa
M=D

@Pa
M=0

(TWOLOOPa)
@4
D=A
@Pa
D=M-D
@ENDTWOLOOPa
D;JGE


@POSa
A=M
M=-1

@32
D=A
@POSa
M=M+D

@Pa
M=M+1

@TWOLOOPa
0;JMP

(ENDTWOLOOPa)

@16776
D=A
@POS1b
M=D

@P2b
M=0

(TWOLOOPAGAINb)
@4
D=A
@P2b
D=M-D
@ENDTWOLOOPAGAINb
D;JGE

@POS1b
A=M
M=-1

@32
D=A
@POS1b
M=M+D

@P2b
M=M+1

@TWOLOOPAGAINb
0;JMP

(ENDTWOLOOPAGAINb)

@17160
D=A
@POS2c
M=D

@P3c
M=0

(ANOTHERLOOPc)
@4
D=A
@P3c
D=M-D
@ENDANOTHERLOOPc
D;JGE

@POS2c
A=M
M=-1

@32
D=A
@POS2c
M=M+D

@P3c
M=M+1

@ANOTHERLOOPc
0;JMP

(ENDANOTHERLOOPc)

@16393
D=A
@TVRd	//TWO VERTICAL RIGHT 
M=D

@Cd
M=0

(jesusChristISimplyDontSeeHowToDoThisEasierd)     //Partially true, I see that in the declaration above TWO VERTICAL RIGHT there is something you can do, but I dont know what that something is
@16
D=A
@Cd
D=M-D
@ENDEASYd
D;JGE

@255
D=A
@TVRd
A=M
M=D

@32
D=A
@TVRd
M=M+D

@Cd
M=M+1

@jesusChristISimplyDontSeeHowToDoThisEasierd
0;JMP

(ENDEASYd)


@16904
D=A
@TVLe		//TWO VERTICAL LEFT
M=D

@Ee
M=0

(WHENWILLITENDe)
@8
D=A
@Ee
D=M-D
@ITWILLENDNOWe
D;JGE

@255
D=A
@TVLe
A=M
M=D

@32
D=A
@TVLe
M=M+D

@Ee
M=M+1

@WHENWILLITENDe
0;JMP

(ITWILLENDNOWe)


//this is fine

@16395
D=A
@ZEROLEFT
M=D

@K
M=0

(ZEROLOOP)
@28
D=A
@K
D=M-D

@ENDZERO
D;JGE

@255
D=A
@ZEROLEFT
A=M
M=D

@32
D=A
@ZEROLEFT
M=M+D

@K
M=M+1

@ZEROLOOP
0;JMP

(ENDZERO)



@16396
D=A
@ZEROLEFTA
M=D

@KA
M=0

(ZEROLOOPA)
@28
D=A
@KA
D=M-D

@ENDZEROA
D;JGE

@255
D=A
@ZEROLEFTA
A=M
M=D

@32
D=A
@ZEROLEFTA
M=M+D

@KA
M=M+1

@ZEROLOOPA
0;JMP

(ENDZEROA)

@16395
D=A
@TOPZERO
M=D

@P
M=0

(ALMOST)
@4
D=A
@P
D=M-D
@ENDALMOST
D;JGE

@TOPZERO
A=M
M=-1

@32
D=A
@TOPZERO
M=M+D

@P
M=M+1

@ALMOST
0;JMP

(ENDALMOST)

@17163
D=A
@BOTZERO
M=D

@DONE
M=0

(ITS)
@4
D=A
@DONE
D=M-D
@JOEVER
D;JGE

@BOTZERO
A=M
M=-1

@32
D=A
@BOTZERO
M=M+D

@DONE
M=M+1

@ITS
0;JMP

(JOEVER)

(END)
@END
0;JMP