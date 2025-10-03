
INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	msg BYTE "HELLO WORLD",0
	msg1 BYTE "PRESS ENTER TO CONT",0
	msg2 BYTE "ok BYe",0
.code
	
	
main PROC
	mov edx,OFFSET msg
	Call WriteString 
	Call Crlf
	mov edx,OFFSET msg1
	Call WriteString 
	Call Crlf
	
	Call WaitMsg
	Call Crlf

	mov edx,OFFSET msg2
	Call WriteString 
	Call Crlf
	

exit 
main ENDP
END main
