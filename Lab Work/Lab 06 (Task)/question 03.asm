INCLUDE Irvine32.inc 

.data
	start DWORD 0
	counter DWORD 5
	Chr BYTE '*'
.code


main PROC 

mov ebx,1
mov ecx,counter
movzx eax,Chr

loopI:
	mov counter,ecx
	mov ecx,ebx

	loopJ:
		Call WriteChar
	loop loopJ
	Call Crlf
	inc ebx
	mov ecx,counter

loop loopI



exit 
main ENDP
END main
