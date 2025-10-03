INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	msg3 BYTE "Hello How Are You ?",0
	value DWORD 150
	Chr BYTE '*'

.code
main PROC
		
	mov eax,value
	Call WriteBin
	Call Crlf

	mov eax,value
	Call WriteDec
	Call Crlf

	mov eax,value
	Call WriteInt
	Call Crlf

	mov eax,value
	Call WriteHex
	Call Crlf

	movzx eax,Chr
	Call WriteChar
	Call Crlf

	mov edx,OFFSET msg3
	Call WriteString
	Call Crlf
	
exit
main ENDP 
END main
