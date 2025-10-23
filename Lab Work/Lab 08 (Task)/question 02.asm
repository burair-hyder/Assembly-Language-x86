INCLUDE Irvine32.inc

.data
	arr DWORD 5 DUP(?)
	Imsg BYTE "Enter 5 numbers: ",0
	Omsg BYTE "Reversed Order: ",0
	space BYTE " ",0
.code


main PROC
	mov edx,OFFSET Imsg
	Call WriteString
	mov ecx,5
l1:

	Call ReadInt
	push eax

loop l1
	Call Crlf

	mov ecx,5
	mov esi,0

l2:
	pop eax
	mov arr[esi],eax
	add esi,TYPE arr

loop l2
	
	mov esi,0
	mov ecx,5

	

	mov edx,OFFSET Omsg
	Call WriteString
printer:
	mov eax,arr[esi]
	Call WriteDec
	mov edx, OFFSET space
	call WriteString
	add esi,TYPE arr
loop printer
Call Crlf
exit 
main ENDP
END main
