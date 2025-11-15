INCLUDE Irvine32.inc 
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.code

main PROC
	call MakeArray
	exit 

main ENDP

MakeArray PROC
	push ebp
	mov ebp, esp
	sub esp, 32

	lea esi,[ebp-30]   ; lea calculates address and stores it in esi
	mov ecx,30

	L1:
	
		mov BYTE PTR [esi],'*'
		inc esi
	loop L1

	mov ecx,30
	lea esi,[ebp-30]
	printL:
		mov al, BYTE PTR [esi]
		inc esi
		Call WriteChar

	loop printL	
	add esp,32
	pop ebp

	ret
MakeArray ENDP
END main
