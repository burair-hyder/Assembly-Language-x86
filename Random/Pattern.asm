INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	start DWORD 0
	counter DWORD 5
	Chr BYTE '*'
.code
main PROC
	mov ebx,5
	mov ecx,counter
	movzx eax,Chr
	
	loopI:

		mov counter,ecx
		mov ecx,ebx

		loopJ:

			Call WriteChar

		loop loopJ

		Call Crlf
		dec ebx
		mov ecx,counter

	loop loopI


	mov ebx,2
	mov counter,4
	mov ecx,counter
	movzx eax,Chr
	
	loop1:

		mov counter,ecx
		mov ecx,ebx

		loop2:

			Call WriteChar

		loop loop2

		Call Crlf
		inc ebx
		mov ecx,counter

	loop loop1
	
exit
main ENDP 
END main
