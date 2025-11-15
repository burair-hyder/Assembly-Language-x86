INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.code 

main PROC 

	Call MySub
	exit

main ENDP

MySub PROC
	push ebp
	mov ebp, esp
	sub esp, 8    
	
	mov DWORD PTR [ebp-4],10
	mov DWORD PTR [ebp-8],20

	mov esp, ebp  ; DISCARD LOCAL VARIABLES
	pop ebp
	ret
	MySub ENDP

END main	

  
