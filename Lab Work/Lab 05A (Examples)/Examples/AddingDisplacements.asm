INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804


.data
	arrayB WORD 20, 40, 60, 80


.code

main PROC 

	mov esi, OFFSET arrayB
	mov ax, [esi] 
	movzx eax,ax
	Call Writeint

	
	mov ax, [esi+2] 
	movzx eax,ax
	Call Writeint


	mov ax, [esi+4]
	movzx eax,ax
	Call Writeint

	mov ax, [esi+6]
	movzx eax,ax
	Call Writeint


exit 
main ENDP

END main
