INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data

	val DWORD 10
	msg BYTE "Final Value of EAX is: ",0
.code

main PROC
	mov eax,10
		
		cmp eax,0
		JGE whileloop

	whileloop:
		sub eax,3
		JGE whileloop
		jmp print

	print:
		mov edx,OFFSET msg
		Call WriteString
		Call WriteInt
		Call Crlf
exit 

main ENDP
END main
