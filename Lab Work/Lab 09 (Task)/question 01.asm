 INCLUDE irvine32.inc


.data

	marks DWORD 7 DUP(?)
	great DWORD 0
	less DWORd 0
	gmsg BYTE "Passed Students:",0
	lmsg BYTE "failed Students: ",0
.code

main proc
mov esi,0
mov ecx,7
l1:
	call readint
	mov marks[esi],eax
	add esi,TYPE marks
loop l1
mov ecx,7
mov esi,0
l2:

	mov eax,marks[esi]
	add esi,TYPE marks
	cmp eax,50
	jge greater
	add less,1

	con:
loop l2
jmp cont

greater:
	add great,1
	jmp con

cont:
	mov edx,OFFSET gmsg
	Call WriteString
	mov eax,great
	call Writedec
	call crlf
	mov edx,OFFSET lmsg
	Call WriteString
	mov eax,less
	call WRitedec



exit 
main endp
end main
