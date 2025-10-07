INCLUDE Irvine32.inc

.data
	
	value DWORD 12345678h;
	msg BYTE "random:",0
	msg1  BYTE "Title done",0
	msg2  BYTE "Pagal ho kia?",0
	boundr DWORD 100
	arrayD DWORD 541212h , 15h ,15h
	



.code

main proc 
	mov ebx,OFFSET  msg1
	mov edx,OFFSET msg2
	Call MsgBoxAsk
	Call Writedec
	call crlf
	call getmaxXY
	movzx eax,ax
	movzx ebx,dx
	Call WriteDec
	mov eax,ebx
	Call WriteDec
	Call waitmsg
	Call writeint
	mov eax,3000
	Call Delay
	mov dh,20
	mov dl,20
	Call gotoxy
	Call waitmsg
	Call clrscr
	

	
	
exit 
main ENDP 
END main

