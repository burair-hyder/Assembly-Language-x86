INCLUDE  Irvine32.inc


.data

	Lmsg BYTE "Largest Number: ",0
	Smsg BYTE "Smallest Number: ",0
	largest DWORD -999
	smallest DWORD 999
	msg BYTE "Enter 5 Numbers: ",0
.code
main PROC
	mov ecx,5
	mov edx,OFFSET msg
	Call WriteString
l1:
	Call ReadInt
	push eax
loop l1

mov ecx,5

l2:
	pop eax
	cmp eax,largest
	jge Greater
	TO:
	cmp eax,smallest
	jle Small
	Cont:
loop l2
jmp exitt

	

Greater:
	mov largest,eax
	jmp TO

Small:
	mov smallest,eax
	jmp Cont

exitt:
	mov edx,OFFSET Lmsg
	Call WriteString
	mov eax,largest
	Call WriteDec
	Call Crlf
	
	mov edx,OFFSET Smsg 
	Call WriteString
	mov eax,smallest
	Call WriteDec
	Call Crlf

exit
main ENDP
END main	
