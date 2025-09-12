INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804


.data

	var1 DWORD 45
	var2 DWORD 35
	sum DWORD ?
	diff DWORD ?	

.code 

main PROC
	

	mov eax,var1
	add eax,var2

	mov sum,eax

	mov ebx,var1
	sub ebx,var2

	mov diff,ebx

	;for printing
	mov eax,sum
	Call WriteInt
	Call Crlf

	mov eax,diff
	Call WriteInt
	Call Crlf
exit 

main ENDP
END main
