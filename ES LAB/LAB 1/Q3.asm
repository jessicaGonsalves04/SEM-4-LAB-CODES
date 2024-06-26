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
	LDR R0,=SRC +4*(N-1)
	LDR R1,=SRC +4*(Shift+N-1)
	MOV R3,#10;COUNTER
BACK LDR R4,[R0],#-4
	STR R4,[R1],#-4
	SUB R3,#1
	CMP R3,#0
	BNE BACK
STOP B STOP
N EQU 10
Shift EQU 2
	AREA mydata,DATA,READWRITE
SRC DCD 0,0,0,0,0,0,0,0,0,0
	END