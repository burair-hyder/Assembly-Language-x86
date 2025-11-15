INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data

	var1 DWORD 5
	var2 DWORD 6

	y_param EQU [ebp+12]
	x_param EQU [ebp+8]

.code 

main PROC 

	push var2
	push var1

	Call AddTwo
	Call WriteInt
	Call Crlf
	exit 

main ENDP

AddTwo PROC
	push ebp
	mov ebp, esp
	mov eax, x_param
	add eax, y_param
	pop ebp

	ret  
	AddTwo ENDP

END main
