INCLUDE Irvine32.inc
.data
msg1 BYTE "Example: Stack and Nested Loops", 0
msg2 BYTE "Final value of EBX after nested loops: ", 0

.code
main PROC
    mov ebx, 5
    mov ecx, 5
L1:
    push ecx
    mov ecx, 10
L2:
    inc ebx
    loop L2

    pop ecx
    loop L1

    call CrLf
    mov edx, OFFSET msg1
    call WriteString
    call CrLf
    mov edx, OFFSET msg2
    call WriteString
    mov eax, ebx
    call WriteDec
    call CrLf

    exit
main ENDP
END main
