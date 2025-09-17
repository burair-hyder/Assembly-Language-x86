INCLUDE  Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER
;24K-0804
.data

.code

main PROC 

mov eax,0
add eax,10100001b
call DumpRegs

exit 
main ENDP

END main
