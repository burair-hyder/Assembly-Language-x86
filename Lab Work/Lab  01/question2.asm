;SYED MUHAMMAD BURAIR HYDER
; 24K-0804

INCLUDE irvine32.inc

.data

	var1 DWORD 95
	var2 DWORD 31
	var3 DWORD 240
	var4 DWORD 125
	total DWORD ?


.code

main PROC

	mov eax,var1
	sub eax,var2
	add eax,var3
	sub eax,var4
	mov total,eax

	call WriteInt


main ENDP
END main
