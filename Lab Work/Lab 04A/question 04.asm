INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804


.data

	inventory DWORD 50


.code 

main PROC

	mov eax,inventory
	sub eax,7
	add eax,15

	mov inventory,eax

	Call WriteInt
	Call Crlf
	

	
exit 

main ENDP
END main
