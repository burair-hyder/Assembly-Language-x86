INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.code
main PROC

mov ecx,5
mov eax,0
call CalSum

l1:
	Call Writedec
	Call Crlf
	exit

main ENDP

CalSum PROC 

cmp ecx,0
jz L2
add eax,ecx
dec ecx

call CalSum

L2:
	ret
	CalSum ENDP

END main
