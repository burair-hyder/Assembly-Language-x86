INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data

.code

main PROC 

mov al,0fh
add al,0f1h
call DumpRegs

exit 
main ENDP

END main
