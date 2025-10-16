INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
	val1 DWORD 10000
	val2 DWORD 6000

	msg1 BYTE "val1 was greater",0
	msg2 BYTE "val2 was greater",0
.code 
main PROC
	mov eax,val1
	mov ebx,val2
	cmp eax,ebx
	jnbe valone
	jnae valtwo


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

