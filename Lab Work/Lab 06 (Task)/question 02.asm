INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	value DWORD 5
	counter DWORD 11

.code

main PROC
	mov eax,0
	mov eax,value
	mov ecx,counter

	printer:
		Call WriteInt
		Call Crlf
		inc eax
	loop printer
	

exit

main ENDP 
END main
