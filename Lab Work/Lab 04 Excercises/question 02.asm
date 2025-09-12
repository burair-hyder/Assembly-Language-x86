INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804

COUNT=5
LIMIT EQU 10

.data 
	result DWORD ?

.code 

main PROC 


	mov ax,count
	add ax,LIMIT
	inc ax

	movzx eax,ax

	mov result , eax

	call WriteInt

exit 

main ENDP 
END main



