INCLUDE Irvine32.inc

.data
	
	num1 DWORD 10
	num2 DWORD 20
	num3 DWORD ?
	num4 DWORD ?
	msg BYTE "Enter Number: ",0
	result DWORD 0

.code

main PROC

		mov edx,OFFSET msg
		Call WriteString	
		Call ReadInt
		mov num1,eax

		mov edx,OFFSET msg
		Call WriteString	
		Call ReadInt
		mov num2,eax

		mov edx,OFFSET msg
		Call WriteString	
		Call ReadInt
		mov num3,eax

		mov edx,OFFSET msg
		Call WriteString	
		Call ReadInt
		mov num4,eax


	
	mov ebx,num2
	cmp num1,ebx
	jg  con2
	cont:
		mov ebx,num4
		cmp num2,ebx	
		je Subb
		mov result,0
		jmp exitt


con2:
	mov ebx,num4
	cmp num3,ebx
	jne addd
	jmp cont


addd:
	mov eax,num1
	add eax,num3
	mov result,eax
	jmp exitt

Subb:
	mov eax,num2
	sub eax,num1
	mov result,eax
	jmp exitt


exitt: 	
	mov eax,result
	Call WriteDec
	Call Crlf


exit
main ENDP
end main
