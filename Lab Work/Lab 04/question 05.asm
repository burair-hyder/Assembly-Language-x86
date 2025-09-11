INCLUDE Irvine32.inc

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

