;SYED MUHAMMAD BURAIR HYDER
;24K-0804

INCLUDE irvine32.inc


.data

	var1 DWORD 101110b
	var2 DWORD 050Ah
	var3 DWORD 67d
	var4 DWORD 1010001b
	var5 DWORD 0Fh
	total DWORD ?


.code 

main1 PROC

	mov eax,var1
	add eax,var2
	add eax,var3
	add eax,var4
	add eax,var5
	mov total,eax


	call WriteInt

main1 ENDP
END main1


	
