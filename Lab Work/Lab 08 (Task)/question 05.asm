INCLUDE Irvine32.inc

.data
	msg BYTE "Enter a Number: ",0
	Omsg BYTE "Factorial: ",0
.code
main PROC


	mov edx,OFFSET msg
	Call WriteString
	Call ReadInt
	Call Factorial

exit

main ENDP


Factorial PROC


	cmp eax,0
	je handlezero
	mov ecx,eax
mov ebx,1
mov eax,1
l1:
	mul ebx
	inc ebx
	
loop l1

	mov edx,OFFSET Omsg
	Call WriteString
	Call WriteDec
	ret	
	
handlezero:
	mov eax,1
	mov edx,OFFSET Omsg
	Call WriteString
	Call WriteInt
	ret

	


Factorial ENDP


END main
