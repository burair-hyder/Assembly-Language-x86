INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804

.data
	
	msg BYTE 200 DUP("NUCES ")


.code 
main PROC

	mov edx,OFFSET msg
	Call WriteString

exit 

main ENDP
END main
