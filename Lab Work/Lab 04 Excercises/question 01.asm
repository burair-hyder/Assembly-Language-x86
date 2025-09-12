INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804

.data


	num1 BYTE 25
	num2 WORD 1200h
	num3 DWORD ?


.code 

main PROC
		mov al,num1

		mov ax,num2

		movzx eax,ax  ; only moving ax since al got overwritten already 
		mov num3,eax


		call writeint


exit 
main ENDP 
END main

		
