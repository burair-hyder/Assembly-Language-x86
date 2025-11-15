INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
    msg1   BYTE "Enter first number: ",0
    msg2   BYTE "Enter second number: ",0
    msgGCD BYTE "GCD is: ",0
    msgESP BYTE "ESP = ",0

.code

main PROC
    call TakeInput
    exit
main ENDP


TakeInput PROC
    push ebp
    mov  ebp, esp

    mov edx, OFFSET msgESP
    call WriteString
    mov eax, esp
    call WriteHex
    call Crlf

    mov edx, OFFSET msg1
    call WriteString
    call ReadInt
    mov esi, eax

    mov edx, OFFSET msg2
    call WriteString
    call ReadInt
    mov edi, eax

    push edi
    push esi
    call GCD

    push eax
    call Display

    mov esp, ebp
    pop ebp
    ret
TakeInput ENDP


GCD PROC
    push ebp
    mov  ebp, esp

    mov edx, OFFSET msgESP
    call WriteString
    mov eax, esp
    call WriteHex
    call Crlf

    mov eax, [ebp+8]
    mov ebx, [ebp+12]

gcd_loop:
    cmp ebx, 0
    je  gcd_done

    xor edx, edx
    div ebx
    mov eax, ebx
    mov ebx, edx
    jmp gcd_loop

gcd_done:
    mov esp, ebp
    pop ebp
    ret 8
GCD ENDP


Display PROC
    push ebp
    mov  ebp, esp

    mov edx, OFFSET msgESP
    call WriteString
    mov eax, esp
    call WriteHex
    call Crlf

    mov edx, OFFSET msgGCD
    call WriteString

    mov eax, [ebp+8]
    call WriteInt
    call Crlf

    mov esp, ebp
    pop ebp
    ret 4
Display ENDP


END main
