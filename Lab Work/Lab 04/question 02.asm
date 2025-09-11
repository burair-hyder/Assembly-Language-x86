INCLUDE Irvine32.inc

;SYED MUHAMMAD BURAIR HYDER
;24K-0804

.data
	
	var1 SBYTE -50
	var2 BYTE 200

.code 

main PROC

	movzx eax,var2
	movsx ebx,var1

	Call DumpRegs





exit

main ENDP 
END main

