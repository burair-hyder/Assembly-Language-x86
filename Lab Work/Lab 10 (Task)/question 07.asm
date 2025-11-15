INCLUDE Irvine32.inc 

.data
	NOTP BYTE "Not All 4 Numbers were Prime.",0
	AllP BYTE "All Numbers were Prime.",0
	msg BYTE "Enter 4 integers: ",0
	Lmsg BYTE "Largest Prime:",0
	array DWORD 4 DUP(?)
	Lprime DWORD ?
	check DWORD 0
.code 
main proc 

	mov edx,OFFSET msg
	Call WriteString
	Call Crlf
	mov ecx,4
	mov esi,0
	inputloop:
		Call Readint
		mov array[esi],eax
		add esi,TYPE array
	loop inputloop
	 
	push array[0]
	Call Checkprime
	push array[4]
	Call Checkprime
	push array[8]
	Call Checkprime
	push array[12]
	Call Checkprime

	mov eax,check
	cmp eax,0
	je label1
	jmp exitt
	label1:
		mov edx,OFFSET AllP
		Call WriteString
		Call Crlf
		push OFFSET array
		Call LargestPrime
		mov edx,OFFSET Lmsg
		Call WriteString
		mov eax,Lprime
		Call WriteDec
		jmp ext

exitt:
mov edx,OFFSET NOTP
Call WriteString
Call Crlf
ext:
exit 
main ENDP
Checkprime Proc
		push ebp
		mov ebp,esp

		mov ebx,[ebp+8]
		dec ebx
	
		whileloop:
			mov edx,0
			mov eax,[ebp+8]
			cmp ebx,1
			jle endwhile

			div ebx
			cmp edx,0
			je prime
			dec ebx
		jmp whileloop

	prime:
		mov check,1
		jmp endwhile

	endwhile:
		pop ebp
		ret 4
Checkprime ENDP 
LargestPrime PROC
			push ebp
			mov ebp,esp
			mov esi,[ebp+8]
			mov ecx,4
			mov edx,0
			looplargest:
				cmp DWORD PTR [esi],edx
				jg Update

				cont:
					add esi,TYPE array
			loop looplargest
			mov Lprime,edx
			pop ebp
			ret 4
			Update:
				mov edx,DWORD PTR [esi]
				jmp cont
LargestPrime ENDP
			
END main

		
