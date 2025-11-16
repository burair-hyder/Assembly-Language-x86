INCLUDE IRVINE32.INC


.data
	prompt BYTE "Enter a 3 Digit Number: ",0
	var1 DWORD ?
	temp dword ?
	digit DWORD ?
	sum DWORD ?
	msg BYTE "ArmStrong Number",0
	msg2 BYTE "Not Armstrong Number",0
.code

main PROC 

	mov sum,0
	mov edx,OFFSET prompt
	Call WriteString 
	
	Call Readint
	mov var1,eax
	mov temp,eax
	mov ebx,10

	L1:
		cmp eax,0
		je DONE

		mov edx,0
		div ebx

		; edx will contain the remainer which is the last digit

		mov digit,edx
		mov ecx,digit
		imul ecx,ecx
		imul ecx,digit

		add sum,ecx
		jmp  L1


		DONE:
			mov eax,var1
			cmp eax,sum
			je ARM

			mov edx,OFFSET msg2
			Call Crlf
			Call WriteString
			Call Crlf
			jmp extt



			ARM:
				Call Crlf
				mov edx,OFFSET msg
				Call WriteString 
				Call Crlf
				jmp extt

extt:

exit 
main ENDP 
END main


	
