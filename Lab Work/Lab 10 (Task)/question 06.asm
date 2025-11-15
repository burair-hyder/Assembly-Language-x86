INCLUDE Irvine32.inc 
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
	var1 DWORD ?
	res DWORD 1
	msg BYTE "Enter Number: ",0
	omsg BYTE "Factorial is: ",0
.code
main PROC
	mov edx,OFFSET msg
	Call WriteString
	Call Readint
	mov var1,eax
	mov ecx,1
	Call Fact

	mov eax,res
	mov edx,OFFSET omsg
	Call WriteString
	Call WriteDec

exit
main ENDP

Fact PROC
	
	mov ecx,var1
	whileCalc:
			cmp ecx,1
			jle endWhile

			mov eax,res
			imul eax,ecx
			mov res,eax
			dec ecx
			jmp whileCalc

	endWhile:
		ret
		
Fact ENDP
END main

