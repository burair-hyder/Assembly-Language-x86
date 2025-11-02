INCLUDE Irvine32.inc

.data
	Arr1 DWORD 7 DUP(?)
	
	msg BYTE  "Enter marks of 7 students : ",0
	pmsg BYTE "Passed Students: ",0
	fmsg BYTE "Failed Students: ",0
	pcount DWORD 0
	fcount DWORD 0
.code
main PROC 
	mov ecx,7
	mov esi,0
	mov edx,OFFSET msg
	call WriteString
	call crlf
	l1:
	Call ReadInt
	mov Arr1[esi],eax
	add esi,TYPE Arr1
	loop l1


	mov ecx,7
	mov esi,0

	Call GradingSytem


	mov edx,OFFSET pmsg
	Call WriteString
	mov eax,pcount
	call WriteInt
	call crlf

	mov edx,OFFSET fmsg
	Call WriteString
	mov eax,fcount
	call WriteInt



exit 
main ENDP

GradingSytem PROC
	checkloop:

		mov eax,Arr1[esi]
		add esi,TYPE Arr1
		cmp eax,50
		jge CallPas
		jmp CallFail

		CallPas:
			call PassCount
			jmp cont

		CallFail:
			call FailCount

		cont:
	loop checkloop
	
	ret
GradingSytem ENDP


PassCount Proc
	inc pcount
	ret

PassCount ENDP


FailCount Proc
	inc fcount
	ret
FailCount ENDP			

END main
