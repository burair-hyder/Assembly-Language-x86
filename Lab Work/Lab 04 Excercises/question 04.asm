INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804


.data

	
	x DWORD 12h
	y DWORD 14h
	z DWORD 5h
	w DWORD 10h
	finalResult DWORD ?

.code 

main PROC


	mov eax,x
	add eax,y

	mov ebx,z
	add ebx,w

	sub eax,ebx

	mov edx,eax

	mov finalResult,edx

	call WriteHex

	
exit 

main ENDP
END main
