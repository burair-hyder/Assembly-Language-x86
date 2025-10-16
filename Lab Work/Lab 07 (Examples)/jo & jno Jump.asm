INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
	val1 BYTE 127
	msg1 BYTE "Overflow was Found",0
	msg2 BYTE "No Overflow",0
.code 
main PROC
	mov al,val1
	add al,1
	jo Overflow
	jno notOverflow

Overflow:
		mov edx,OFFSET msg1
		Call WriteString
		Call exitt
notOverflow:
		mov edx,OFFSET msg2
		Call WriteString
		Call exitt
exitt:

exit 
main ENDP
END main

