;SYED MUHAMMAD BURAIR HYDER
;24K-0804

INCLUDE irvine32.inc


.data

	var1 DWORD 111b
	var2 DWORD 12
	var3 DWORD 1F3h
	var4 DWORD 745o

	total DWORD ?

.code 

Main3 PROC


	mov eax,var1
	sub eax,var2
	add eax,var3
	sub eax,var4

	mov total,eax

	Call WriteInt

Main3 ENDP
END Main3




