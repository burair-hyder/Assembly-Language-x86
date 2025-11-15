INCLUDE Irvine32.inc
.data
	array DWORD  20 DUP(?)
	minm BYTE "Min Value is  :",0
	maxm BYTE "Max Value is: ",0
	prompt BYTE "Array Values are: ",0
	cout = 20
	min  DWORD ?
	max DWORD ?
	
		
.code

main PROC 
	
	; populate the array

	Call Randomize

	mov ecx,20
	mov esi,0
	FillArray:
		mov eax,100
		Call RandomRange
		mov array[esi],eax
		add esi,TYPE array
	loop FillArray
	push OFFSET array
	push cout
	call MinMaxArray
	mov ecx,20
	mov esi,0
	mov edx,OFFSET prompt
	Call WriteString 
	Call Crlf
	printarray:
		mov eax,array[esi]
		Call Writedec
		Call Crlf
		add esi,TYPE array
	loop printarray
	mov edx,OFFSET minm
	Call WriteString
	mov eax,min
	Call WriteInt
	call Crlf
	mov edx,OFFSET maxm
	Call WriteString
	mov eax,max
	Call WriteInt
	call Crlf

exit
main ENDP

MinMaxArray PROC
	
	push ebp
	mov ebp,esp

	mov ecx,[ebp+8];
	mov esi,[ebp+12];
	
	mov eax,DWORD  PTR [esi]
	mov min,eax
	mov max,eax
	add esi,TYPE array
	dec ecx

	L1:
		mov eax,DWORD PTR [esi]
		cmp eax,min
		jl Update

		cmp eax,max
		jg Updatemax

		cont:
		add esi,TYPE array

	loop L1
	jmp rett

	Update:
		mov eax,[esi]
		mov min,eax
		jmp cont

	Updatemax:
		mov eax,[esi]
		mov max,eax
		jmp cont

rett:
pop ebp
ret 
MinMaxArray ENDP
END main
