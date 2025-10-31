INCLUDE Irvine32.inc

.data
	
	num1 SWORD 5
	num2 SWORD 50
	result SDWORD ?
	msg1 BYTE "Enter a number: ",0

.code
main PROC
	mov edx,OFFSET msg1
	Call WriteString
	mov eax,0
	Call Readint
	mov num1,ax
	
	mov edx,OFFSET msg1
	Call WriteString
	mov ebx,0
	Call Readint
	mov num2,ax


	movsx ebx,num2
	movsx eax, num1
	imul eax,ebx


	mov result,eax
	Call WriteInt
	
exit
main ENDP
END main

