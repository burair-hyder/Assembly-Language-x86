INCLUDE Irvine32.inc

.data
	var1 DWORD  ?
	var2 DWORD  ?
	var3 DWORD  ?
	result DWORD ?
	msg BYTE "Enter three integers: ",0
	msg2 BYTE "The product is: ",0

.code
main PROC
	mov edx,OFFSET msg
	Call WriteString
	Call Crlf
	Call ReadInt
	mov var1,eax
	Call ReadInt
	mov var2,eax
	Call ReadInt
	mov var3,eax
	push var3
	push var2
	push var1

	Call ThreeProd
	mov edx,OFFSET msg2
	Call WriteString

	mov eax,result
	Call WriteInt
	Call Crlf
exit 
main ENDP

ThreeProd PROC

	push ebp
	mov ebp,esp
	mov eax,[ebp+8]   ; Load var1
	mov ebx,[ebp+12]  ; Load var2
	mov ecx,[ebp+16]  ; Load var3
	imul eax,ebx
	imul eax,ecx
	mov result,eax
	pop ebp

	ret 12
	ThreeProd ENDP
END main
