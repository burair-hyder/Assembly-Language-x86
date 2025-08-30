;SYED MUHAMMAD BURAIR HYDER
;24K-0804
INCLUDE Irvine32.inc

.data

	var1 DWORD 4C2h
	var2 DWORD 72o
	var3 DWORD 55d
	var4 DWORD 11101011b
	var5 DWORD 180
	total DWORD ?


.code

main1 PROC
	
	mov ebx,10

	mov eax,var1
	sub eax,ebx
	add eax,var2
	add eax,var3
	sub eax,var4
	add eax,var5

	mov total,eax
	mov eax,total
	call WriteInt

main1 ENDP
END main1

	
