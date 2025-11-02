INCLUDE Irvine32.inc

.data
	arr1 DWORD 10 DUP(?)
	avg DWORD ?
	avg2 DWORD ?
	enpavg  DWORD ?
	sum DWORD ?
	abovecount DWORD ?
	belowcount DWORD ?
	msg BYTE "Enter a number: ",0

	smsg BYTE "Sum of readings: ",0
	amsg BYTE "Average Reading: ",0
	bcmsg BYTE "Readings below average: ",0
	acmsg BYTE "Readings above average: ",0
	encrpt BYTE "Encrypted Result (ROR): ",0
	scaled BYTE "Scaled average(SHL): ",0


.code
main PROC
	mov ecx,10
	mov esi,0

	input:
		mov edx,OFFSET msg
		call WriteString
		call ReadInt
		mov arr1[esi],eax
		add esi,TYPE arr1
	loop input

	
	Call calculateAvg
	Call abovecounter

	mov eax,avg
	mov avg2,eax
	shl avg2,1  ; multiply avg by 2

	mov eax,avg2
	ror ax,1  
	movzx eax,ax
	mov enpavg,eax

	mov edx,OFFSET smsg
	Call WriteString
	mov eax,sum
	Call WriteInt
	Call Crlf

	mov edx,OFFSET amsg
	Call WriteString
	mov eax,avg
	Call WriteInt
	Call Crlf
	
	mov edx,OFFSET acmsg
	Call WriteString
	mov eax,abovecount
	Call WriteInt
	Call Crlf

	
	mov edx,OFFSET bcmsg
	Call WriteString
	mov eax,belowcount
	Call WriteInt
	Call Crlf

	mov edx,OFFSET scaled
	Call WriteString
	mov eax,avg2
	Call WriteInt
	Call Crlf

	mov edx,OFFSET encrpt
	Call WriteString
	mov eax,enpavg
	Call Writebin
	Call Crlf




	

	

	


exit
main ENDP



calculateSum PROC USES esi ecx eax
	mov esi,0
	mov ecx,10
	mov sum,0
	mov eax,0
	sumLoop:
		add eax,arr1[esi]
		add esi,TYPE arr1
	loop sumLoop
	mov sum,eax
	

	ret
calculateSum ENDP


calculateAvg PROC uses eax ecx
	mov eax,0
	mov edx,0
	mov ecx,10

	Call calculateSum
	mov eax,sum
	div ecx
	mov avg,eax
	ret
calculateAvg ENDP


abovecounter PROC
	mov esi,0
	mov ecx,10

	l1:
	mov eax,arr1[esi]
	cmp eax,avg
	jg abovecountInc
	jmp belowcountInc

	continueLoop:
	add esi,TYPE arr1
	loop l1
	ret

abovecountInc:
	inc abovecount
	jmp continueLoop

belowcountInc:
	inc belowcount
	jmp continueloop

abovecounter ENDP
END main
