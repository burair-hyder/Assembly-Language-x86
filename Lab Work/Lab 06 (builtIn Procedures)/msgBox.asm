
INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	msg BYTE "My First Box!",0
	msg1 BYTE "hello world",0
.code
	
main PROC
	mov ebx,OFFSET msg
	mov edx,OFFSET msg1
	
	Call msgBox


exit 
main ENDP
END main
