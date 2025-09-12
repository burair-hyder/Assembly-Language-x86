INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804


P=3
.data

	result DWORD ?

.code 
main PROC

	mov eax,P
	imul eax,4

	mov result,eax
	Call WriteInt

exit 

main ENDP
END main
