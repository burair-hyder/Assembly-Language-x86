INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	myDouble DWORD 12345678h
	myBYTE BYTE ?

.code

main PROC 

	mov eax,TYPE myDouble
	call Writeint
	call Crlf

	mov eax,TYPE myBYTE
	call Writeint
	call Crlf

exit 
main ENDP

END main
