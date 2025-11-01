INCLUDE irvine32.inc


.data

	array WORD 10,60,20,33,72,89,45,65,72,18
	sample WORD 50
	arraysize WORD LENGTHOF array
	sum WORD 0
	msg BYTE "The sum is: ",0

.code

main PROC
	mov esi,0
	mov cx,0
	while1:
		mov ax,arraysize
		cmp cx,ax
		jz exitt


		mov ax,array[esi]
		cmp ax,sample
		jnc skipit

		mov ax,array[esi]
		add sum,ax

		skipit:
		add esi,2
		inc cx
		jmp while1



exitt:   
	mov edx,OFFSET msg
	Call WriteString 
	movzx eax,sum
	Call WriteInt
	Call Crlf
		

exit
main ENDP
END main
