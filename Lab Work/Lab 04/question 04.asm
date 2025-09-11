INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804

.data


	Xval DWORD 25
	YvAL DWORD 15
	Zval DWORD 40
	Rval DWORD ?


.code

main PROC
	;-(Xval+Yval-Zval)


	mov eax,xval
	add eax,Yval
	sub eax,Zval

	neg eax
	
	mov Rval,eax

	Call WriteInt




exit 
main ENDP 
END main

