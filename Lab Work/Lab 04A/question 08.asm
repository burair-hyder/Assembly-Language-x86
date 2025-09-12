INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804

.data
	
.code 
main PROC
	
	mov ax,10
	mov bx,20

	xchg ax,bx

	;for priting of values
	movzx eax,ax
	movzx ebx,bx
	Call DumpRegs

exit 

main ENDP
END main
