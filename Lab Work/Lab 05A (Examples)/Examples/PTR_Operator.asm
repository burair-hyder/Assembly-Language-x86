INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	myDouble DWORD 12345678h

.code

main PROC 

	mov ax,WORD PTR myDouble
	movzx eax,ax
	call Writehex
	call crlf

	mov ax,WORD PTR [myDouble+2]
	movzx eax,ax
	movzx eax,ax
	call Writehex
	call crlf

	mov eax,0
	mov ah,BYTE PTR myDouble
	
	
	call Writehex
	call crlf
exit 
main ENDP

END main
