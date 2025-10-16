INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
	val1 BYTE 11101111b
	msg1 BYTE "Even Numbers of 1's",0
	msg2 BYTE "Odd Numbers of 1's",0
.code 
main PROC
	mov al,val1
	test al,al
	jp Parity
	jnp notParity

Parity:
		mov edx,OFFSET msg1
		Call WriteString
		Call exitt
notParity:
		mov edx,OFFSET msg2
		Call WriteString
		Call exitt
exitt:

exit 
main ENDP
END main

