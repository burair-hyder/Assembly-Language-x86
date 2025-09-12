INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804


.data

	valA SBYTE -15
	valB BYTE 25
	valC WORD ?

.code 

main PROC

	mov al,valA
	add al,valB
	sub al,5

	movzx ax,al
	mov valC,ax



	movzx eax,valC  ; for printing purpose
	call WriteInt

exit 

main ENDP
END main
