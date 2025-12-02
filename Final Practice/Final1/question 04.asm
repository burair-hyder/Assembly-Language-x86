INCLUDE Irvine32.inc 

.data
	arr DWORD  4,2,8,3,1,5
	n DWORD ?
	key DWORD ?
	 skipeven BYTE "Skipping even number",0
	
.code 
main proc 
	mov n, lengthof arr
	
	mov ecx,n
	mov esi,4
	forloop:
		mov eax,arr[esi]


		mov key,eax
		mov edi,esi
		sub edi,4
		
		; IF CONDITION 
		mov edx,0
		mov eax,key
		mov ebx,2
		div ebx
		cmp edx,0
		JE ElseCase

		; if case

		; while loop

		whileloop:
			cmp edi,0
			jl OUTT
			mov eax,arr[edi]
			cmp eax,key
			jle OUTT


			mov eax,arr[edi]
			mov arr[edi+4],eax
			sub edi,4


		
		jmp whileloop

	
		OUTT:
			mov eax,key
			mov arr[edi+4],eax

			JMP SKIP





		
		; else case
		ElseCase:
			mov edx,offset skipeven
			Call WriteString
			mov eax,key
			Call Writeint
			Call crlf

		SKIP:


		add esi,TYPE arr
	loop forloop

	mov edi,0
	mov ecx,lengthof arr
	printer:
		mov eax,arr[edi]
		Call WriteInt
		add edi,TYPE arr
		Call crlf
	loop printer

exit 
main endp
end main
