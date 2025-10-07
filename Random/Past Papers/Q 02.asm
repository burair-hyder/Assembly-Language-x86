INCLUDE  Irvine32.inc

.data
	msginput BYTE "ENTER values A,B  D E F G H J",0
	A DWORD ?
	B DWORD ?
	D DWORD ?
	E DWORD ?
	F DWORD ?
	G DWORD ?
	H DWORD ?
	J DWORD ?
	X DWORD ?
	Y DWORD ?
	Z DWORD ?
	Result DWORD ?

	msgX BYTE "THE VALUE OF X= ",0
	msgY BYTE "THE VALUE OF Y= ",0
	msgZ BYTE "THE VALUE OF Z= ",0
	msgR BYTE "THE VALUE OF Result= ",0

.code

main proc 

	mov edx,OFFSET msginput
	Call WriteString
	Call crlf

	Call ReadInt
	
	mov A,eax
	Call ReadInt
	
	mov B,eax
	Call ReadInt
	
	mov D,eax
	Call ReadInt
	
	mov E,eax
	Call ReadInt
	
	mov F,eax
	Call ReadInt
	
	mov G,eax
	Call ReadInt
	
	mov H,eax
	Call ReadInt
	
	mov J,eax

	; cal X

	mov eax,A
	add eax,B
	add eax,D
	sub eax,F
	mov X,eax

	mov eax,D
	add eax,E
	sub eax,H
	add eax,G
	mov Y,eax

	mov eax,A
	add eax,F
	sub eax,J
	mov Z,eax

	mov eax,X
	add eax,Y
	add eax,Z
	sub eax,J
	mov Result,eax

	mov edx,OFFSET msgX
	Call WriteString
	mov eax,X
	Call Writedec
	Call Crlf

	mov edx,OFFSET msgY
	Call WriteString
	mov eax,Y
	Call Writedec
	Call Crlf

	mov edx,OFFSET msgZ
	Call WriteString
	mov eax,Z
	Call Writedec
	Call Crlf

	mov edx,OFFSET msgR
	Call WriteString
	mov eax,Result
	Call Writedec
	Call Crlf





exit 
main ENDP
END main
