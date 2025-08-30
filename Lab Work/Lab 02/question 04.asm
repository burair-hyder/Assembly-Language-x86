;SYED MUHAMMAD BURAIR HYDER
;24K-0804

INCLUDE Irvine32.inc

.data 
	total DWORD ?


.code 

main6 PROC
	mov ecx ,10
	mov ebx,15

	sub ebx,ecx


	mov ecx,101011010110b
	add ecx,3Ah
	sub ecx,64o
	add ecx,ebx
	add ecx,5

	mov total,ecx

	mov eax,total
	
	call WriteInt


main6 ENDP
END main6

