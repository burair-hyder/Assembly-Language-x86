INCLUDE Irvine32.inc 

.data
	str1 BYTE 20 DUP (?)
	str2 BYTE 20 DUP (?)
	len DWORD ?
	counter =20

.code 
RevS PROTO str1p: PTR BYTE, str2P : PTR BYTE ,lenn : DWORD
main PROC 
	mov ecx,counter
	mov edx,OFFSET str1
	Call ReadString 
	mov len,eax

	
	Invoke RevS, OFFSET str1,OFFSET str2,len

	mov  edx,OFFSET str2
	Call WriteString


exit
main ENDP
RevS PROC	 str1p: PTR BYTE, str2P : PTR BYTE ,lenn : DWORD

	mov esi,str2p
	mov edi,str1p
	mov ecx,lenn
	add edi,ecx
	dec edi
	
	l1:
		mov al,[edi]
		Call WriteChar
		Call Crlf
		mov [esi],al
		inc esi
		dec edi
	loop l1
	mov BYTE PTR[esi],0
	
	

ret 12
RevS ENDP
END main
