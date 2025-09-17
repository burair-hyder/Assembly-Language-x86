INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data

	byteVal BYTE 10h
.code

main PROC
	mov esi, OFFSET byteVal 
	mov al, [esi]
	movzx eax,al
	call Writehex
exit 
main ENDP

END main
