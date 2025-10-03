INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	msg BYTE "Cursor Moved.",0
.code
	
main PROC

	mov dh,10  ; rows 
	mov dl,5  ; columns
	Call Gotoxy

	
	mov edx,OFFSET msg
	Call WriteString

exit 
main ENDP
END main
