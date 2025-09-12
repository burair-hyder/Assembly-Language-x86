INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804

.data

	value SBYTE -10

.code 

main PROC

	movzx eax,value

	movsx ebx,value

	Call DumpRegs
	Call Crlf

	
exit 

main ENDP
END main
