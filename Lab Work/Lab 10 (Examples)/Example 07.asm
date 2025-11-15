INCLUDE Irvine32.inc
;SYED MUAHMMAD BURAIR HYDER 24K-0804
.code

main PROC
	Call LocalProc
		exit
main ENDP


LocalProc PROC
	LOCAL temp: DWORD 
	mov temp,5
	mov eax,temp

	ret

LocalProc ENDP

END main

; This program demonstrates the use of a local variable within a procedure.
