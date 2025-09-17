INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	
	myBYTE BYTE 10,20,30
	array1 WORD 30 DUP(?),0,0
	array2 WORD 5 DUP(3 DUP(?))
	array3 DWORD 1,2,3,4
	mymessage BYTE "12345678",0

.code

main PROC 

	mov eax,SIZEOF myBYTE
	call Writeint
	call Crlf
	mov eax,SIZEOF array1
	call Writeint
	call Crlf
	mov eax,SIZEOF array2
	call Writeint
	call Crlf
	mov eax,SIZEOF array3
	call Writeint
	call Crlf
	mov eax,SIZEOF mymessage
	call Writeint
	call Crlf

exit 
main ENDP

END main
