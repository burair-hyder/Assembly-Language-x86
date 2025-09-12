INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804



.data
	result DWORD ?
	
.code 
main PROC

	SecondsINday=24*60*60

	mov eax, SecondsINday
	mov result,eax

	Call WriteInt
	Call Crlf
	
exit 

main ENDP
END main
