Include Irvine32.inc

.data
	arr SDWORD 20 DUP (?)
	len = 20
	avg DWORD 0
	sum DWORD 0
	OLmsg BYTE "Odd Numbers that are Less than Avg",0
	amsg BYTE "Average: ",0
	smsg BYTE "SUM: ",0
	imsg BYTE "ENter 20 Numbers: ",0
	spaceer BYTE ' '

.code
main proc 
	mov edx,OFFSeT imsg
	Call writestring
	call Crlf
	mov ecx,len
	mov esi,0
	l1:
		Call Readint
		mov arr[esi],eax
		add esi,TYPE arr

	loop l1

	mov ecx,len
	mov esi,0

	sumloop:

		mov eax,arr[esi]
		add sum,eax
		add esi,TYPE arr
	loop sumloop


	
	mov edx,0
	mov eax,sum
	mov ebx,len
	cdq 
	idiv ebx
	mov avg,eax

	mov eax,sum
	mov edx,OFFSET smsg
	Call WriteString
	Call Writeint
	Call crlf

	mov eax,avg
	mov edx,oFFSET amsg
	call WriteString 
	Call WriteInt
	Call Crlf


	mov ecx,len
	mov esi,0
	mov edx,0
	
	mov edx,OFFSET OLmsg
	Call WRiteString
	call Crlf
	mov edx,0

	oddloop:
		mov ebx,2
		mov eax,arr[esi]
		div ebx
		cmp edx,0
		je SKIP

		mov eax,arr[esi]
		cmp eax,avg
		jl Dis
		
		jmp skip

		Dis:
			Call WriteInt
			movzx eax,spaceer
			Call WRitechar


		SKIP:
			add esi,TYPE arr
	loop oddloop




COMMENT ?
	mov ecx,20
	mov esi,0

	printer:

		mov eax,arr[esi]
		Call Writeint
		Call Crlf
		add esi,TYPE arr
	loop printer
		?
		

exit 
main endp
end main
