INCLUDE Irvine32.inc 

.data
	array DWORD 1,2,3,4,5
	val DWORD  10
	len DWORD ?
.code 
LOADER PROTO  ptr1:PTR DWORD , multi:DWORD, lenn : DWORD
main PROC 
	mov len,LENGTHOF array
	Invoke LOADER, offset array,val,len

	mov esi,0
	mov ecx,len
	L2:
	mov eax,array[esi]
	Call WriteDec
	add esi,TYPE array
	Call Crlf
	loop L2


exit 
main ENDP 

LOADER PROC ptr1:PTR DWORD , multi:DWORD , lenn:DWORD 
	mov esi,ptr1
	mov edi,esi
	mov ecx,lenn
	mov eax,0
	L1:
	lodsd
	mul multi
	stosd
	loop L1

ret
	
LOADER ENDP


END main

