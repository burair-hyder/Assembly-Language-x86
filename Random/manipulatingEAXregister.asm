INCLUDE Irvine32.inc


.data

	AXvar WORD ?
	AHvar BYTE ?
	ALvar BYTE ?

.code

main PROC

	mov eax,12345678h
	 
	Call DumpRegs
	mov ax,0ABCDh
	mov AXvar,ax
	mov AHvar,ah
	mov ALvar,al


	 
	 
	Call DumpRegs
	movzx eax,AXvar
	call Writehex
	call Crlf
	movzx eax,AHvar
	call Writehex
	call Crlf
	movzx eax,ALvar
	call Writehex
	call Crlf


exit 

 main ENDP
END main
