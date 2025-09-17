INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804


.data
	arrayB DWORD 20, 40, 60, 80


.code

main PROC 

	mov esi, 0
	mov eax, arrayB[esi * TYPE arrayB] 
	Call WriteInt
	Call Crlf

	mov esi, 1
	mov eax, arrayB[esi * TYPE arrayB] 
	Call WriteInt
	Call Crlf

	mov esi, 2
	mov eax, arrayB[esi * TYPE arrayB]
	Call WriteInt


exit 
main ENDP

END main
