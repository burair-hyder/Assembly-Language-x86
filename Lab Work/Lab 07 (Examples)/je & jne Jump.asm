INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
	val1 DWORD 200
	val2 DWORD 400
	msg1 BYTE "Both Numbers are Equal",0
	msg2 BYTE "Both Numbers are not Equal",0
.code 
main PROC
	mov eax,val1
	mov ebx,val2
	cmp eax,ebx
	je Equal
	jne notEqual

Equal:
		mov edx,OFFSET msg1
		Call WriteString
		Call exitt
notEqual:
		mov edx,OFFSET msg2
		Call WriteString
		Call exitt
exitt:

exit 
main ENDP
END main

