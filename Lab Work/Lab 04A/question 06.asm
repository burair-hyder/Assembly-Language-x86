INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804

.data

	value DWORD 10

.code 
main PROC

	mov eax,value
	inc eax
	inc eax
	inc eax
	dec eax
	dec eax

	mov value,eax

	Call WriteInt
	Call Crlf

exit 

main ENDP
END main
