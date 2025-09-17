INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data

.code

main PROC 

mov al,72h
add al,0Eh
call DumpRegs

exit 
main ENDP

END main
