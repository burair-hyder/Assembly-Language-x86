INCLUDE Irvine32.inc 

.data
	prompt BYTE "Enter A string To search for '#' in it: ",0
	str1 BYTE 20 DUP (?)
	msg2 BYTE "'#' Not Found in String",0
	msg BYTE "'#' Found at Index: ",0
	counter =20
	tofindd BYTE '#'

.code


main PROC 
	mov edx,OFFSET prompt
	Call WriteString
	mov ecx,20
	mov edx,OFFSET str1
	Call ReadString

	Call Scan_String


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

Scan_String PROC  
	
	mov ecx,counter
	mov edi,OFFSET str1
	mov al,tofindd

	repne scasb 
	
	JNZ notfound
	dec edi
	sub edi,OFFSET str1
	jmp rett
	notfound:
		mov edi,-1
	rett:
	ret
Scan_String ENDP

END main	




