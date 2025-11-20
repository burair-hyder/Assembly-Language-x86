INCLUDE Irvine32.inc 

.data
	str1 BYTE 20 DUP(?)
	len DWORD ?
	str2 BYTE 20 DUP(?)
	notsame BYTE "2 Strings were not same",0
	same1 BYTE "both string were same",0
	counter =20

.code
IsCompare PROTO  strp1:PTR BYTE , strp2:PTR BYTE , count:DWORD
main PROC
	mov ecx,counter
	mov edx,OFFSET Str1
	Call ReadString 
	mov len ,eax

	mov edx,OFFSET Str2
	call readString 
	
	INVOKE IsCompare , offset str1 , offset str2,len

	cmp eax,1
	JE SAME
	mov edx,OFFSET notsame
	Call WriteString
	jmp exitt

	SAME:
		mov edx,OFFSET same1
		call WriteString
exitt:
exit 
main ENDP 

IsCompare PROC ,  strp1:PTR BYTE , strp2:PTR BYTE , count:DWORD
	mov esi,strp1
	mov edi,strp2
	mov ecx,count

	repe cmpsb

	JZ same
		mov eax,-1
		jmp rett

	Same:
		mov eax,1
rett:
ret
IsCompare ENDP
END main

