INCLUDE Irvine32.inc

.data
	array DWORD 10 DUP (?)
	 smsg BYTE "Sorted Array:",0
	 nmsg BYTE "UnSorted Array:",0
	count =10
	space BYTE ' '
	counter DWORD ?

.code
main PROC
	;populate array

	mov ecx,count
	mov esi,0
	Call Randomize
	fillloop:
		mov eax,100
		Call RandomRange
		mov array[esi],eax
		add esi,TYPE array
	loop fillloop

	mov edx,OFFSET nmsg
	Call WriteString
	Call Crlf
	mov ecx,count
	mov esi,OFFSET array

	unsortprint:
		mov eax,[esi]
		call WriteDec
		
		movzx eax,space
		Call WriteChar
		add esi,TYPE array
	loop unsortprint
	Call Crlf
	
	push OFFSET array
	push count
	Call BubbleSort

mov ecx,count
mov esi,OFFSET array
mov edx,OFFSET smsg
Call WriteString 
Call Crlf

printLoop:
    mov eax,[esi]
    call WriteDec
    movzx eax,space
		Call WriteChar
    add esi,TYPE array

    loop printLoop
	Call Crlf
	

exit 
main ENDP

BubbleSort PROC
			push ebp
			mov ebp,esp

			mov ecx,[ebp+8]
			mov counter,ecx
			mov esi,[ebp+12]
			
			outerloop1:
					mov counter,ecx

					mov esi,[ebp+12]
					mov ecx,[ebp+8]
					dec ecx
					innerloop1:
						mov eax,DWORD PTR[esi]
						mov ebx,DWORD PTR [esi+4]
						cmp eax,ebx
						jng nSwap
						xchg eax,ebx
						mov DWORD PTR[esi],eax
						mov DWORD PTR[esi+4],ebx
				
						nSwap:
						add esi,TYPE array

					loop innerloop1
						mov ecx,counter

			loop outerloop1
	pop ebp
	ret 8 	
BubbleSort ENDP
END main
