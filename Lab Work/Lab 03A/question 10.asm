INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804

.data
	
	destmsg BYTE 100 DUP(?)
	sourcemsg BYTE "COMPUTER ORGANIZATION AND ASSEMBLY LANGUAGE LAB ",0
	
.code 
main PROC

	mov esi,OFFSET sourcemsg ; store base address of Source message
	mov edi , OFFSEt destmsg ; Store base address of Destination message

	mov ecx,LENGTHOF sourcemsg ; ecx contains the number of bytes in SourceMessage

 	cld  ; clears direction flag, ensures the the pointer moves to right,ESI++,EDI++
 	rep movsb ; rep is used to rep ecx times 
			  ;movsb is used to copy one byte from ESI TO EDI

	mov edx,OFFSET destmsg
	Call WriteString



	
exit 

main ENDP
END main
