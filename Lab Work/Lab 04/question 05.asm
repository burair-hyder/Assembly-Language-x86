INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804

MAX =100
MIN EQU 10

.data

	num1 DWORD MAX
	num2 DWORD MIN
	result DWORD ?
.code

main PROC

	mov eax,num1
	add eax,num2

	mov result,eax

	Call WriteInt

exit 

main ENDP
END main

