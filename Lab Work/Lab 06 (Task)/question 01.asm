INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data

	msg1 BYTE "WELCOME!",0
	msg2 BYTE "YOU SHOULD NOT SEE THIS MESSAGE",0
	msg3 BYTE "GOODBYEE!",0

.code

main PROC
	mov edx , OFFSET msg1
	Call WriteString
	Call Crlf
	jmp goodbye

	; The following statements will be skipped

	mov edx,OFFSET msg2
	Call WriteString
	Call Crlf

	goodbye:
	mov edx,OFFSET msg3
	Call WriteString
	Call Crlf


exit

main ENDP 
END main
