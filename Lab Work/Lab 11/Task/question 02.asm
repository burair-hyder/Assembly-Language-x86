INCLUDE Irvine32.inc 

.data
	prompt BYTE "Enter A string To search for '#' in it: ",0
	str1 BYTE 20 DUP (?)
	msg2 BYTE "'#' Not Found in String",0
	msg BYTE "'#' Found at Index: ",0
	counter =20
	tofindd BYTE '#'

.code

Scan_String PROTO src:PTR BYTE , tofind:BYTE,cout:DWORD

main PROC 
	mov edx,OFFSET prompt
	Call WriteString
	mov ecx,20
	mov edx,OFFSET str1
	Call ReadString

	Invoke Scan_String , OFFSET str1,tofindd ,counter

	cmp edi,-1
	je NotF
	mov edx,OFFSET msg
	Call WriteString
	mov eax,edi
	Call WriteDec
	jmp exitt

	NotF:
		mov edx,OFFSET msg2
		Call WriteString
exitt:

exit
main ENDP

Scan_String PROC  src:PTR  BYTE , tofind:BYTE,cout:DWORD
	
	mov ecx,cout
	mov edi,src
	mov al,tofind

	repne scasb 
	
	JNZ notfound
	dec edi
	sub edi,src
	jmp rett
	notfound:
		mov edi,-1
	rett:
	ret
Scan_String ENDP

END main	




