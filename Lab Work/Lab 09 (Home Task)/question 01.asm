INCLUDE Irvine32.inc

.data
	Arr1 DWORD 5 DUP(?)
	Arr2 DWORD 5 DUP(?)
	msg BYTE  "Enter 5 integers for Arr1: ",0
	msg1 BYTE  "Enter 5 integers for Arr2: ",0
	omsg BYTE "Matching elements count: ",0
	counter DWORD 0
.code
main PROC 
	mov ecx,5
	mov esi,0
	mov edx,OFFSET msg
	call WriteString
	call crlf
	l1:
	Call ReadInt
	mov Arr1[esi],eax
	add esi,TYPE Arr1
	loop l1



	mov ecx,5
	mov esi,0
	mov edx,OFFSET msg1
	call WriteString
	call crlf
	l2:
	Call ReadInt
	mov Arr2[esi],eax
	add esi,TYPE Arr2
	loop l2

	mov ecx,5
	mov esi,0
	mov edi,0
	Nest1:
		push ecx

		mov ecx,5
		Nest2:
			mov eax,Arr1[esi]
			mov ebx,Arr2[edi]
			cmp eax,ebx
			jne skip
			inc counter

			skip:
				add edi,TYPE Arr2
		loop Nest2
		pop ecx
		add esi,TYPE Arr1
		mov edi,0
		loop Nest1


	mov edx,OFFSET omsg
	Call WriteString
	mov eax,counter
	Call WriteInt
		
			


exit 
main ENDP
END main
