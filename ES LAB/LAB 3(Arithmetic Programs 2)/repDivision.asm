	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=DIVIDEND
	LDR R0,[R0]
	LDR R6,=DST
	LDR R1,=DIVISOR
	LDR R1,[R1]
	MOV R5,#0
UP CMP R0,R1
	BLO EXIT
	SUB R0,R1
	ADD R5,#1
	B UP
EXIT
	STR R5,[R6],#4
	STR R0,[R6]
STOP B STOP
DIVIDEND DCD 0X00000012
DIVISOR DCD 0X00000004
	AREA mydata,DATA,READWRITE
DST DCD 0
END

	