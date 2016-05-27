[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_api_initmalloc
	EXTERN	_api_malloc
	EXTERN	_api_openwin
	EXTERN	_api_refreshwin
	EXTERN	_api_getkey
	EXTERN	_api_end
[FILE "color.c"]
[SECTION .data]
LC0:
	DB	"color",0x00
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	XOR	EDI,EDI
	PUSH	EBX
	SUB	ESP,32
	CALL	_api_initmalloc
	PUSH	23616
	CALL	_api_malloc
	MOV	DWORD [-16+EBP],EAX
	PUSH	LC0
	PUSH	-1
	PUSH	164
	PUSH	144
	PUSH	EAX
	CALL	_api_openwin
	ADD	ESP,24
	MOV	DWORD [-36+EBP],0
	MOV	DWORD [-20+EBP],EAX
L11:
	MOV	EAX,DWORD [-36+EBP]
	MOV	EDX,DWORD [-16+EBP]
	XOR	ESI,ESI
	LEA	EAX,DWORD [4040+EDX+EAX*1]
	MOV	DWORD [-44+EBP],EAX
L10:
	LEA	EDX,DWORD [ESI+ESI*1]
	MOV	EBX,43
	MOV	EAX,EDX
	MOV	DWORD [-24+EBP],EDX
	CDQ
	IDIV	EBX
	LEA	ECX,DWORD [EDI+EDI*1]
	MOV	DWORD [-28+EBP],EAX
	MOV	EAX,ECX
	INC	ESI
	CDQ
	IDIV	EBX
	IMUL	EAX,EAX,6
	ADD	EAX,DWORD [-28+EBP]
	MOV	EBX,DWORD [-44+EBP]
	ADD	EAX,16
	MOV	BYTE [EBX],AL
	INC	EBX
	MOV	DWORD [-44+EBP],EBX
	CMP	ESI,127
	JLE	L10
	INC	EDI
	ADD	DWORD [-36+EBP],144
	CMP	EDI,127
	JLE	L11
	PUSH	156
	PUSH	136
	PUSH	28
	PUSH	8
	PUSH	DWORD [-20+EBP]
	CALL	_api_refreshwin
	PUSH	1
	CALL	_api_getkey
	ADD	ESP,24
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_api_end