INCLUDE Irvine32.inc

.data
	pos DWORD 0
	neg1 DWORD 0
	eq1 DWORD 0
	msg BYTE "Enter number ",0
	msg1 BYTE ": ",0

	Pmsg BYTE "Positive Numbers: ",0

	Nmsg BYTE "Negative Numbers: ",0
	
	Zmsg BYTE "Zeros: ",0

.code
main PROC
	mov ecx,5
	mov ebx,1
	
	L1:
	mov edx, OFFSET msg
	Call WriteString
	mov eax,ebx
	Call WriteDec
	inc ebx
	mov edx,OFFSET msg1
	Call WriteString
	
	Call Readint
	
	cmp eax,0
	jg Pos1
	je Eqq
	add neg1,1
	Cont:
	loop l1

	mov edx,OFFSET Pmsg
	Call WriteString
	mov eax,pos
	Call WriteDec
	Call Crlf

	mov edx,OFFSET Nmsg
	Call WriteString
	mov eax,neg1
	Call WriteDec
	Call Crlf

	mov edx,OFFSET Zmsg
	Call WriteString
	mov eax,eq1
	Call WriteDec 
	Call Crlf

	jmp exitt
	
	


Pos1:
	add pos,1
	jmp Cont
Eqq: 
	
	add eq1,1
	jmp Cont

exitt:
	

exit
main ENDP
END main
