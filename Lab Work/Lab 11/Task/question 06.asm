INCLUDE Irvine32.inc 

.data
	target BYTE "AAEBDCFBBC",0
	freqTable BYTE 256 DUP (0)
	len DWORD ?
	dash BYTE ' - '

.code
Get_Frequencies PROTO target:PTR BYTE,  freqTable:PTR BYTE, len1:DWORD

main PROC 
	mov ecx,256
	mov esi,0
	mov len,lengthof target
	l2:
		mov freqTable[esi],0
		inc esi
	loop l2
	Invoke Get_Frequencies , ADDR target , ADDR freqTable, len
	
	mov ecx,256
	mov esi,0
	mov eax,0
	l3:
		mov al, freqTable[esi]
		cmp al,0
		je DONT
		mov eax,esi
		Call WriteChar
		movzx eax,dash
		Call WriteChar
		movzx eax,freqTable[esi]
		Call WriteDec
		Call Crlf
		DONT:
		inc esi
	loop l3

exit 
main ENDP

Get_Frequencies PROC  tar: PTR BYTE,Freq:PTR BYTE, len1 : DWORD

	mov ecx,len1
	
	dec ecx
	mov esi,tar
	mov eax,0
	mov edi,Freq
	l1:
	movzx eax,BYTE PTR [esi]
	inc esi
	push edi
	add edi,eax
	add BYTE PTR [edi],1

	pop edi
	loop l1

ret
Get_Frequencies ENDP 

END main


