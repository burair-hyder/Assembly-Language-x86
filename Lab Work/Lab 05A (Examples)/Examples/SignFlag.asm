INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data

.code

main PROC 

mov al,15
sub al,97
call DumpRegs

exit 
main ENDP

END main
