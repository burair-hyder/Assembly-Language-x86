INCLUDE Irvine32.inc

.data
	OrgArray WORD 3 DUP (?)
	SwapArray WORD 3  DUP(?)
	DoubleArray DWORD 3 DUP (?)
	orgmsg BYTE "Original Array:",0
	swapmsg BYTE "Swapped Array:",0
	dubmsg BYTE "Double Array:",0
	Temp BYTE ?
	Low1 BYTE ?
	High1 BYTE ?
	counter DWORD 0
.code
main PROC
	mov ecx,3
	mov esi,0

	inputloop:
		Call Readhex
		mov OrgArray[esi],ax;
		add esi,TYPE OrgArray
	loop inputloop



	mov esi,0
	mov ecx,3
	swaploop:
		mov ax,OrgArray[esi];
		mov bl,al
		mov al,ah
		mov ah,bl
		mov  SwapArray[esi],ax
		add esi,TYPE OrgArray
	loop swaploop

	mov esi,0
	mov ecx,3
	mov ebx,0
	DoubleLoop:

		movzx eax,SwapArray[esi];
		imul eax,eax,2
		mov  DoubleArray[ebx],eax
		add esi, TYPE SwapArray
		add ebx,TYPE DoubleArray
	loop DoubleLoop


	mov edx,OFFSET orgmsg
	Call WriteString
	Call Crlf
	mov ecx,3
	mov esi,0
	outputloop:
		mov ax, OrgArray[esi]
		add esi,TYPE OrgArray
		movzx eax,ax
		Call WriteDec
		Call Crlf
	loop outputloop


	mov edx,OFFSET swapmsg
	Call WriteString
	Call Crlf
	mov ecx,3
	mov esi,0
	outputloop1:
		mov ax, SwapArray[esi]
		add esi,TYPE SwapArray
		movzx eax,ax
		Call WriteDec
		Call Crlf
	loop outputloop1



	mov edx,OFFSET dubmsg
	Call WriteString
	Call Crlf
	mov ecx,3
	mov esi,0
	outputloop2:
		mov eax, DoubleArray[esi]
		add esi,TYPE DoubleArray

		Call WriteDec
		Call Crlf
	loop outputloop2
		



exit 
main ENDP 
END main
