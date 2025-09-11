INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804



.data

	num1 WORD 1234h
	num2 WORD 5678h

.code


main PROC
	
	;SWAPPING
	mov ax,num1
	xchg ax,num2 ; ax=5678h  num2=1234h
	mov num1,ax



	;SHOWING SWAP PRINTING BOTH VALUES VIA EAX
	movzx eax,num1
	Call DumpRegs
	Call crlf
	movzx eax,num2
	Call DumpRegs
	Call crlf


	
exit
main ENDP 
END main
