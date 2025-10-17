INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data

	counter DWORD 5;
	msg BYTE "Enter 5 valid numbers (1-N): ",0
	msg1 BYTE "Total Number of Valid inputs were: ",0

.code
	
	

main PROC
	mov ecx,counter
	mov ebx,0
	mov edx,OFFSET msg
	Call WriteString
	Call Crlf
	Loop1:
	Call ReadInt
	cmp eax,0
	jne Count1
	l1:
	loopnz Loop1
	jmp print


	Count1:
		inc ebx;	
		jmp l1

	print:
		mov edx,OFFSET msg1
		Call WriteString
		mov eax,ebx
		Call WriteInt
		Call Crlf
exit 

main ENDP
END main
