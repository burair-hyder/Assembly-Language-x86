INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data

.code

main PROC 

mov ax,0ffffh
inc ax
call DumpRegs

exit 
main ENDP

END main
