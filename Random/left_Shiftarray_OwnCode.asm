INCLUDE  Irvine32.inc
; ammar kamran 24k-0732

.data

	Warray WORD 10,20,30,40,50,60,70,80,90,100
	startp WORD ?
	length1 DWORD ?
	Darray WORD 10 DUP(?)
	stringh BYTE "h ",0

.code

main PROC 
	mov esi, OFFSET Warray
	mov ax,[esi]
	mov startp,ax ; stored first value in startp varaible
	

	mov ecx,LENGTHOF Warray
	mov length1,ecx

	dec ecx
	

	add esi,2; now esi points to 2nd value of Warray

	mov edi,OFFSET Darray ; edi points to destination array
	 
	cld  ; clear the direction flag
	 
	rep movsw  ; EDI =ESI untill ecx is zero

	
	movzx eax,startp  

	
	mov [edi],eax ; store last element

	
	mov ecx,length1
	mov edi, OFFSET Darray   ; reset edi to point to start of dest array

	mov ebx,0 ; counter


	
	L1:
	
	mov ax,[edi+ebx]
	movzx eax,ax
	Call Writedec
	Call Crlf
	mov edx,OFFSET stringh
	Call WriteString
	

	add ebx,2

	LOOP l1

	call DumpRegs

exit 
main ENDP

END main
