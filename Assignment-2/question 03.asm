INCLUDE Irvine32.inc

.data
	
	numarr DWORD 10, 20, 30, 40, 0
	count DWORD ?
	sum DWORD 0
	i DWORD 0



.code
main PROC

	
	mov eax,LENGTHOF numarr ; Get the length of the array
	mov count,eax         ; Store length in count
	
	mov sum,0
	mov ebx,0
	mov esi,0



	
	l1:

		cmp ebx,count ; Compare index with count
		jge exitt

		cmp numarr[esi],0
		jg addd
		dec sum

		cont:
		add esi,TYPE numarr
		inc ebx
		
		jmp l1 

addd:
	mov eax,sum
	add eax, numarr[esi]
	mov sum,eax
	jmp cont

exitt:
	
	mov eax,sum
	Call WriteInt
	Call Crlf


exit
main ENDP
END main
