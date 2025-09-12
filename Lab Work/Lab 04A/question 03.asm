INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804


.data

	dayTemp DWORD 30
	nightTemp DWORD 18
	diff DWORD ?


.code 

main PROC
	

	mov eax,dayTemp
	sub eax,nightTemp

	mov diff,eax

	Call WriteInt
	Call Crlf

	mov eax,nightTemp
	inc eax
	inc eax
	mov nightTemp , eax

	Call WriteInt
	Call Crlf





	
exit 

main ENDP
END main
