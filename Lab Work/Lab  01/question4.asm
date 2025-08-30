;SYED MUHAMMAD BURAIR HYDER
;24K-0804


INCLUDE irvine32.inc

.data

	var1 DWORD 11010110b
	var2 DWORD 09C4h
	var3 DWORD 220
	var4 DWORD 18
	var5 DWORD 1011110b
	var6 DWORD 0Dh
	var7 DWORD 12

	total DWORD ?

.code

Main2 PROC


	mov eax,var1
	sub eax,var2
	add eax,var3
	add eax,var4
	add eax,var5
	sub eax,var6
	add eax,var7

	mov total,eax

	call WriteInt


Main2 ENDP


END Main2



