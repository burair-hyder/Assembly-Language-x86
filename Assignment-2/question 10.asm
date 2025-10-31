INCLUDE irvine32.inc

.data

	; 26 == > 2^4 = 16
	; 2^3 = 8
	;2^1=2 
	; 26 =16+8+2
	; temp * 16   ==> shift left 4 
	; temp * 8 ==> shift left 3
	; temp * 2 ==> shift left 1
	
	result DWORD 0
	temp DWORD 2

.code
main proc
	mov eax,temp
	shl eax, 4
	mov result,eax

	mov eax,temp
	shl eax,3
	add result,eax
		
	mov eax,temp
	shl eax,1
	add result,eax

	mov eax,result
	Call WriteInt
	Call Crlf
	
exit
main endp
end main
