INCLUDE Irvine32.inc

.data
	Val SBYTE ?
	msg BYTE "Enter A Number: ",0
	Nmsg BYTE "The value was Negative",0
	Pmsg BYTE "The value was Positive",0
	Zmsg BYTE "The value was Zero",0

.code

main PROC

	mov edx,OFFSET msg
	call WriteString
	Call readInt
	mov Val,al

	cmp al,0
	je Zero
	jg Pos
	
	mov edx,OFFSet Nmsg
	Call WriteString
	call Crlf
	jmp exitt

Pos:
	mov edx,OFFSET Pmsg
	Call WriteString
	Call Crlf
	jmp exitt

Zero:
	mov edx, OFFSEt Zmsg
	Call WriteString
	Call Crlf

exitt:
exit
main ENDP
END main


