INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	bVal BYTE ?
	wVal WORD ?
	dval DWORD ?
.code

main PROC 

	mov esi,OFFSET bVal
	mov eax,esi
	Call Writeint
	Call Crlf

	mov esi,OFFSET wVal
	mov eax,esi
	Call Writeint
	Call Crlf

	mov esi,OFFSET dVal
	mov eax,esi
	Call Writeint
	Call Crlf



exit 
main ENDP

END main
