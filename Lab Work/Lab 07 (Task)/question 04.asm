INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data

	A DWORD ?
	B DWORD ?
	msg BYTE "Enter Two numbers: ",0
	msgT BYTE "Condition True",0
	msgF BYTE "Condition False",0
.code
main PROC	
	mov edx , OFFSET msg
	Call WriteString
	Call ReadInt
	mov A,eax
	Call ReadInt
	mov B,eax

	mov eax,A
	cmp eax,B
	jg ConditionCheck
	jmp printFF

	ConditionCheck:
		cmp eax,100
		jl printT
		jmp printFF

	printT:
		mov edx,OFFSET msgT
		Call WriteString
		jmp exitt

	printFF:
		mov edx,OFFSET msgF
		Call WriteString
		jmp exitt

exitt:

	
exit 

main ENDP
END main
