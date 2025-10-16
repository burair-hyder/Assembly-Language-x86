INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
	val1 DWORD 600
	val2 DWORD 1900

	msg1 BYTE "val1 was greater equal to val2",0
	msg2 BYTE "val2 was greater equal to val1",0
.code 
main PROC
	mov eax,val1
	mov ebx,val2
	cmp eax,ebx
	jae valone
	jbe valtwo


valone:
		mov edx,OFFSET msg1
		Call WriteString
		Call exitt
valtwo:
		mov edx,OFFSET msg2
		Call WriteString
		Call exitt
exitt:

exit 
main ENDP
END main

