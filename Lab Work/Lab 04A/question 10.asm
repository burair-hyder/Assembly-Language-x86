INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804

.data
	A DWORD 0FF10h
	B DWORD 0E10Bh

.code 
main PROC

	mov eax,A
	xchg eax,B
	mov A,eax

	; for printing purpose
	mov eax,A
	Call WriteHex
	Call Crlf

	mov eax,B
	Call WriteHex
	Call Crlf

exit 

main ENDP
END main
