;SYED MUHAMMAD BURAIR HYDER
;24K-0804

INCLUDE Irvine32.inc

.data

 var1 DWORD 3
 var2 DWORD 012h
 var3 DWORD 45o
 var4 DWORD 89d
 total DWORD ?


.code

main PROC

	mov eax,10 ; assigning random values to eax,ebx & ecx register
	mov ebx,15
	mov ecx,20

	mov edx,eax
	add edx,var1
	add edx,ebx
	sub edx,ecx
	add edx,var2
	sub edx,var3
	add edx,var4

	mov total,edx
	mov eax,total ; moving total to eax for printing purpose
	call WriteInt

main ENDP

END main
