
INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	msg BYTE "My First Box!",0
	msg1 BYTE "Are you in Delusion?",0
.code
	
main PROC
	mov ebx,OFFSET msg
	mov edx,OFFSET msg1
	
	Call msgBoxAsk

	Call WriteInt ; prints 6 if yess, 7 is ans was no 


exit 
main ENDP
END main
