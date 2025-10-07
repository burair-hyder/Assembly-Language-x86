INCLUDE Irvine32.inc


.data
	
	N DWORD ?
	
	TempArray DWORD 100 DUP(?)
	DiffArray DWORD 100 DUP (?)
	Orgmsg BYTE "Original Array: ",0
	summsg BYTE "Total Sum: ",0
	nmsg BYTE "N is: ",0
	tmsg BYTE "Size of Each Element: ",0
	diffmsg BYTE  "Difference Array: ",0
	sum DWORD ?
	msgN BYTE "Enter Value for N:" ,0

.code
main PROC
	mov edx,OFFSET msgN
	Call WriteString
	Call ReadInt
	mov N,eax

	mov ecx,N
	mov esi,0
	inputloop:
		Call ReadInt
		mov  TempArray[esi*TYPE TempArray] ,eax
		inc esi
	loop inputloop


	mov ecx,N
	mov esi,OFFSET TempArray
	mov eax,0
	sumloop:
		add eax,[esi]
		add esi,4
	loop sumloop
	mov sum,eax

	mov ecx,N
	mov esi,0
	diffloop:

		mov eax,TempArray[esi]
		sub eax,39
		mov DiffArray[esi],eax
		add esi,TYPE TempArray
	loop diffloop



	mov esi,0
	mov ecx,N
	mov edx,OFFSET Orgmsg
	Call WriteString
	Call Crlf
	outputloop1:
		mov eax,TempArray[esi*TYPE TempArray]
		Call WriteInt
		Call Crlf
		inc esi
	loop outputloop1


	mov edx,OFFSET summsg
	Call WriteString
	mov eax,sum
	Call WriteInt
	Call Crlf


	

	mov edx,OFFSET diffmsg
	Call WriteString
	Call Crlf
	mov esi,0
	mov ecx,N
	outputloop:
		mov eax,DiffArray[esi*TYPE DiffArray]
		Call WriteInt
		Call Crlf
		inc esi
	loop outputloop
	

	mov edx,OFFSET nmsg
	Call WriteString
	mov eax,N
	Call WriteInt
	Call Crlf

	mov edx,OFFSET tmsg
	Call WriteString
	mov eax,TYPE TempArray
	Call WriteInt
	Call Crlf

exit 
main ENDP 
END main
