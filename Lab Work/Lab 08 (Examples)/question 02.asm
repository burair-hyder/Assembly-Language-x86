INCLUDE Irvine32.inc
.data
num1 WORD 15
num2 WORD 25
msg1 BYTE "Initial Numbers: ", 0
msg2 BYTE "Sum after POP (A + B): ", 0
msg3 BYTE "Final Result after PUSH & POP: ", 0
space BYTE " ", 0

.code
main PROC
    call CrLf
    mov edx, OFFSET msg1
    call WriteString
    call CrLf
    movzx eax, num1
    call WriteDec
    mov edx, OFFSET space
    call WriteString
    movzx eax, num2
    call WriteDec
    call CrLf

    mov ax, num1
    push ax
    mov ax, num2
    push ax

    pop bx
    pop ax
    add ax, bx

    call CrLf
    mov edx, OFFSET msg2
    call WriteString
    movzx eax, ax
    call WriteDec
    call CrLf

    push ax
    pop bx

    call CrLf
    mov edx, OFFSET msg3
    call WriteString
    movzx eax, bx
    call WriteDec
    call CrLf

    exit
main ENDP
END main
