INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data
	arrayb BYTE 10h,20h,30h,40h
	arrayW WORD 100h,200h,300h
.code

main PROC 

mov al,arrayb
movzx eax,al
call WriteHex;
call crlf

mov al,[arrayb+1]
movzx eax,al
call WriteHex;
call crlf


mov ax,arrayW
movzx eax,ax
call WriteHex;
call crlf

mov ax,[arrayW+2]
movzx eax,ax
call WriteHex;
call crlf


exit 
main ENDP

END main
