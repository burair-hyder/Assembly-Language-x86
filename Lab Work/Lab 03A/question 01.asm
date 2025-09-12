INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804

.data
	aVal DWORD 10h
	bVal DWORD 12h
	cVal DWORD 20h
	dVal DWORD 25h

.code 


main PROC

	mov ecx,aVal
	add ecx,bVal

	mov eax,aVal
	sub eax,bVal

	sub ecx,eax
	add ecx,cVal
	add ecx,dVal

	mov ebx,ecx

	Call DumpRegs

exit 

main ENDP
END main
