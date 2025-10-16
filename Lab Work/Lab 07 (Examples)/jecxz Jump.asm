INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
	val1 DWORD 200
	val2 DWORD 200
	msg1 BYTE "ECX is zero",0
	msg2 BYTE "ECX is Not zero",0
.code 
main PROC
	mov ecx,val1
	sub ecx,val2
	jecxz zero
	jmp notzero
zero:
		mov edx,OFFSET msg1
		Call WriteString
		Call exitt
notzero:
		mov edx,OFFSET msg2
		Call WriteString
		Call exitt
exitt:

exit 
main ENDP
END main

