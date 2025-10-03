INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	msg3 BYTE "Enter. ",0
	msg1 BYTE "Input: ",0
	msg2 BYTE "Output: ",0
	msg BYTE 20 DUP (?)
	value DWORD 150
	Chr BYTE ?

.code
main PROC

		; input char
	mov edx,OFFSET msg1
	Call WriteString
	Call ReadChar
	mov Chr,al
	mov edx,OFFSET msg2
	Call WriteString
	movzx eax,Chr
	Call WriteChar
	Call Crlf
	
	;input dec
	mov edx,OFFSET msg1
	Call WriteString
	Call ReadDec
	mov edx,OFFSET msg2
	Call WriteString
	Call WriteDec
	Call Crlf

	;input hex
	mov edx,OFFSET msg1
	Call WriteString
	Call ReadHex
	mov edx,OFFSET msg2
	Call WriteString
	Call WriteHex
	Call Crlf

	;input int
	mov edx,OFFSET msg1
	Call WriteString
	Call ReadInt
	mov edx,OFFSET msg2
	Call WriteString
	Call WriteInt
	Call Crlf

	;input string
	mov edx,OFFSET msg1
	Call WriteString
	mov edx,OFFSET msg
	mov ecx,20
	Call ReadString
	mov edx,OFFSET msg2
	Call WriteString
	mov edx,OFFSET msg
	Call WriteString
exit
main ENDP 
END main
