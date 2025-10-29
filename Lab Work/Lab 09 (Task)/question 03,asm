INCLUDE Irvine32.inc
.data

	enc BYTE ?
	msg BYTE "Enter	Binary: ", 0
	fiMsg BYTE "Encrypted: ", 0

.code
main PROC

		call ReadInt
		rol eax, 2
		shr eax, 1

		mov edx, OFFSET fiMsg
		call WriteString
		call WriteBin
	

main ENDP
end main
