INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data

	A DWORD ?
	B DWORD ?
	Cval DWORD ?
	msg BYTE "Enter Three numbers: ",0
	msg1 BYTE "The Largest Number(Signed) is: ",0
	msg2 BYTE "The Largest Number(UnSigned) is: ",0
.code
main PROC	
	mov edx , OFFSET msg
	Call WriteString
	Call Crlf
	Call ReadInt
	mov A,eax
	Call ReadInt
	mov B,eax
	Call ReadInt
	mov Cval,eax

	mov eax,A
	cmp eax,B
	jae check2nd
	mov eax,B
	jmp check2nd



	check2nd:
		cmp eax,Cval
		jae print
		mov eax,Cval


	print:
		mov edx,OFFSET msg2
		Call WriteString
		Call Writedec
		Call Crlf




	mov eax,A
	cmp eax,B
	jge checks2nd
	mov eax,B
	jmp checks2nd



	checks2nd:
		cmp eax,Cval
		jge printt
		mov eax,Cval


	printt:
		mov edx,OFFSET msg1
		Call WriteString
		Call WriteInt
		Call Crlf



	
exit 

main ENDP
END main
