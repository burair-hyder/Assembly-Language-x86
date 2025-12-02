INCLUDE IRVINE32.INC 

.data
	ENCRYPT_ARRAY SBYTE 12,25,8,32,19,44,7,28,15,50 ; 1 WEIGHTAGE
	DECRYPT_ARRAY SBYTE 10 dup (?)
	pmsg BYTE "Enter a decrpytion key: ",0
	spacer byte ' '
	emsg BYTE "Encrypted Array: ",0
	dmsg BYTE "Decrypted Array: ",0
	decryptkey DWORD ?
.code
	
main proc 
	mov edx,oFFSET pmsg
	Call WriteString     ; 1 weigtage
	Call Readint
	mov decryptkey,eax


	mov ecx,lengthof ENCRYPT_ARRAY
	mov esi,0
	mov eax,0
	mov edx,offset emsg
	Call WriteString
	l1:
		mov al,ENCRYPT_ARRAY[esi]
		Call Writeint
		rol al,4    ; 2 weightage
		sar al,3
		mov DECRYPT_ARRAY[esi],al   ; 2 weightage  
		add esi,TYPE DECRYPT_ARRAY
	loop l1


	mov ecx,lengthof DECRYPT_ARRAY
	mov esi,0
	Call crlf
	mov edx,offset dmsg
	call Writestring
	l2:
		movsx eax,DECRYPT_ARRAY[esi]
		call Writeint
		movzx eax,spacer   ; 2 weigtage
		Call writechar
		add esi,TYPE DECRYPT_ARRAY
	loop l2


exit 
main endp
end main
