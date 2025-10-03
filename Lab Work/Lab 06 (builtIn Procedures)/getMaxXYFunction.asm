INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	col BYTE "Columns: ",0
	row BYTE "Rows: ",0
	cols WORD ?
	rows WORD ?
.code
	
main PROC
	Call GetMaxXY
	mov cols,dx  ; dx has number of columns
	mov rows,ax  ; ax has number of rows

	mov edx,OFFSET col
	Call WriteString
	movzx eax,cols
	Call WriteDec
	Call Crlf

	mov edx,OFFSET row
	Call WriteString

	movzx eax,rows
	Call WriteDec
	Call Crlf


exit 
main ENDP
END main
