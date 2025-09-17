INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804


.data
	arrayB BYTE 20, 40, 60, 80


.code

main PROC 

	mov esi, 0
	mov al, arrayB[esi] 
	movzx eax,al
	Call Writeint

	inc esi
	mov al, arrayB[esi] 
	movzx eax,al
	Call Writeint
	mov esi, 3
	mov al, [arrayB + esi] 
	; can also write like this:
	;mov al,arrayB[esi]
	movzx eax,al
	Call Writeint

exit 
main ENDP

END main
