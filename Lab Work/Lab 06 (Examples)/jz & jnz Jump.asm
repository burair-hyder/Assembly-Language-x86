INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
	val1 DWORD 200
	val2 DWORD 100
	msg1 BYTE "Both are Equal",0
	msg2 BYTE "Both are Not Equal",0

.code 
main PROC
	mov eax,val1
	mov ebx,val2
	cmp eax,ebx
	jz Zero
	jnz notZero


Zero:
		mov edx,OFFSET msg1
		Call WriteString
		Call exitt
notZero:
		mov edx,OFFSET msg2
		Call WriteString
		Call exitt

exitt:

exit 
main ENDP
END main

