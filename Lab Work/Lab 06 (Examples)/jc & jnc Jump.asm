INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
	val1 WORD 0FFFFh
	msg1 BYTE "Carry was Found",0
	msg2 BYTE "No Carry",0

.code 
main PROC
	mov ax,val1
	add ax,1
	jc Carry
	jnc notCarry

Carry:
		mov edx,OFFSET msg1
		Call WriteString
		Call exitt
notCarry:
		mov edx,OFFSET msg2
		Call WriteString
		Call exitt

exitt:

exit 
main ENDP
END main

