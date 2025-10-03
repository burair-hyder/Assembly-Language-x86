INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	msg BYTE "Hello World",0
	num DWORD 150

.code
main PROC
	
	mov eax,num
	inc num
	mov ebx,eax
	inc num
	mov ecx,ebx
	Call DumpRegs
	Call Crlf

	mov edx,OFFSET msg
	mov ecx,LENGTHOF msg
	mov ebx,TYPE msg
	Call DumpMem
	Call Crlf
exit
main ENDP 
END main
