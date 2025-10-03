
INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	
.code
	
main PROC

	
	mov eax,4; 4+ (16*0) . 4 is for red and 0 for black
	Call SetTextColor
	Call WriteInt

exit 
main ENDP
END main
