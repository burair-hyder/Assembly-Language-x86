INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804


.data
	arrayD DWORD 12345h, 67897h, 29292h

.code

main PROC 


	mov esi, OFFSET arrayD 
	mov eax, [esi]

	Call WriteHex
	Call Crlf

	add esi, 4 
	mov eax, [esi]
	Call WriteHex
	Call Crlf

	add esi, 4 
	mov eax, [esi]

	Call WriteHex
	Call Crlf

exit 
main ENDP

END main
