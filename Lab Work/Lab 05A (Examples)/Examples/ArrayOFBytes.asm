INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804


.data
	arrayB BYTE 10h, 20h, 30h
.code

main PROC 
	mov esi, OFFSET arrayB 
	mov al, [esi] 
	movzx eax,al
	Call WriteHex
	Call Crlf

	inc esi 
	mov al, [esi]
	movzx eax,al
	Call WriteHex
	Call Crlf

exit 
main ENDP

END main
