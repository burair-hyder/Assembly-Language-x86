INCLUDE Irvine32.inc


.data
	
	op1 DWORD 15
	op2 DWORD 20
	x DWORD 5
	y DWORD 12
	z DWORD 0

.code

main PROC

	mov eax,op2
	cmp op1,eax
	jle whileloop
	jmp exitt

	whileloop:

		mov eax,x
		cmp op1,eax
		jge con2
		sub z,10

		

		cont:

		dec op1

		mov ebx,op2
		cmp op1,ebx
		jle whileloop
		jmp exitt


con2:
	mov eax,y
	cmp op1,eax
	jle summ
	sub z,10
	jmp cont
	


summ:
	add z,10
	jmp cont





exitt:
	mov eax,z
	Call WriteInt
	Call Crlf
		
exit
main ENDP
END main
