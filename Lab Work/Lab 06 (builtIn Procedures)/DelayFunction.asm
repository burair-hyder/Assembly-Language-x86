INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	value DWORD 150
	DELAYED BYTE "Incrementing....",0
.code
main PROC

	mov eax,value
	Call Writedec
	Call Crlf

	mov edx,OFFSET DELAYED
	Call WriteString
	Call Crlf

	mov eax,3000  
	; prints the incremented value after 3 seconds
	Call Delay
	
	inc value
	mov eax,value
	Call Writedec

	

exit
main ENDP 
END main
