INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804


.data
	Warray WORD 1000h, 2000h, 3000h

.code

main PROC 


	mov esi, OFFSET Warray 
	mov ax, [esi]
	movzx eax,ax
	Call WriteHex
	Call Crlf

	add esi, 2 
	mov ax, [esi]
	movzx eax,ax
	Call WriteHex
	Call Crlf

exit 
main ENDP

END main
