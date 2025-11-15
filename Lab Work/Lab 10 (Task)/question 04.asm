INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data

	imsg BYTE "Enter a Number: ",0
	omsg BYTE "Squred Number: ",0
.code 
main PROC 

	Call LocalSquare
exit
main ENDP
LocalSquare Proc

	enter 4,0
	mov edx,OFFSET imsg
	Call WriteString
	Call ReadInt
	mov DWORD PTR [ebp-4],eax

	imul eax,eax
	mov DWORD PTR [ebp-4],eax

	mov edx,OFFSET omsg
	Call WriteString
	Call Writedec
	leave
	ret
LocalSquare ENDP
END main
