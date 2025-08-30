;SYED MUHAMMAD BURAIR HYDER
;24K-0804

INCLUDE Irvine32.inc


.data

	var1 DWORD 6F1h
	var2 DWORD 92d
	var3 DWORD 47o
	var4 DWORD 11011001b
	var5 DWORD 6Ch
	total DWORD ?

.code 

main2 PROC

	mov eax,10

	mov ebx,var1
	sub ebx,eax
	add ebx,var2
	add ebx,var3
	sub ebx,var4
	add ebx,var5

	mov total,ebx

	mov eax,total ;moving to eax for printing purpose

	call WriteInt

main2 ENDP
END main2


	
