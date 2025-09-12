INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804


.data

	num1 WORD 1234h
	num2 WORD 5678h

	

.code 

main PROC

	mov ax,num1
	mov bx,num2

	xchg ax,bx

	mov num1,ax
	mov num2,bx

	

	
exit 

main ENDP
END main
