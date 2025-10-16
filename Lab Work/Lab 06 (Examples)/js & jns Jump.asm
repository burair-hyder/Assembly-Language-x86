INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
	val1 BYTE 125
	msg1 BYTE "Signed was Found",0
	msg2 BYTE "Not Signed",0
.code 
main PROC
	mov al,val1
	sub al,126
	js Signed
	jns notSigned

Signed:
		mov edx,OFFSET msg1
		Call WriteString
		Call exitt
notSigned:
		mov edx,OFFSET msg2
		Call WriteString
		Call exitt
exitt:

exit 
main ENDP
END main

