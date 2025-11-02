INCLUDE Irvine32.inc

.data

	value BYTE ?
	msg BYTE "Enter a value (0-255): ",0


.code
main PROC 
	mov edx,OFFSET msg
	Call WriteString 

	Call ReadInt
	mov value,al
	
	rol al,2

	shr al,1

	mov value,al
	movzx eax,value
	call Writebin

exit
main ENDP
END main
