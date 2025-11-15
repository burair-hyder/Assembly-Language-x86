INCLUDE IRVINE32.inc 
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data

	var1 DWORD 5
	var2 DWORD 6

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
	mov ebp,esp

	mov eax,[ebp+8] ; var1
	add eax,[ebp+12] ;var1+ var2

	pop ebp  ; old val of ebp restored
	ret

AddTwo ENDP
END main
