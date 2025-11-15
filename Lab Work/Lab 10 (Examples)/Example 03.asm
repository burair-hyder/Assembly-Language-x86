INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
	
	count =10
	arr WORD count DUP(0)
.code

main PROC 

	push OFFSET arr
	push count

	Call ArrayFill

	mov ecx, count
	mov esi,0
	L3:
		movzx eax,arr[esi]
		add esi,TYPE WORD
		call WriteDec
		call Crlf
		loop L3
	exit 

main ENDP

ArrayFill PROC 
	push ebp
	mov ebp, esp
	pushad
	mov ecx, [ebp + 8] ; count
	mov esi, [ebp+12] ; arr OFFSET
	call Randomize
	cmp ecx,0
	je L2

	L1:
		mov eax,100h
		Call RandomRange
		mov [esi],ax
		add esi,TYPE WORD
		loop L1
	L2:
		popad ;// restore all registers
		pop ebp
		ret 8

ArrayFill ENDP
END main
