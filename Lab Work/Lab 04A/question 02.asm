INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804


.data

	balance DWORD 5000
	credit DWORD 1200
	debit DWORD 2000

.code 

main PROC
	

	mov eax,balance
	add eax,credit
	sub eax,debit 

	mov balance,eax

	Call WriteInt
	Call Crlf

	
exit 

main ENDP
END main
