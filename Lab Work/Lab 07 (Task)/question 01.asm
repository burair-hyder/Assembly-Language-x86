INCLUDE Irvine32.inc
; SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
msgAnd BYTE "After AND (al): ", 0
msgOr  BYTE "After OR  (bl): ", 0
msgXor BYTE "After XOR (cl): ", 0
msgOn  BYTE "Bit 0 is ON", 0
msgOff BYTE "Bit 0 is OFF", 0
A BYTE 10101101b
B BYTE 11001010b
Cval BYTE 11110000b
.code
main PROC
    mov al, A
    mov bl, B
    mov cl, Cval
    and al, 55h
    mov A,al
    mov edx, OFFSET msgAnd
    call WriteString
    movzx eax, al
    call WriteBin
    call Crlf
    or bl,55h
    mov B,bl
    mov edx,OFFSET msgOr
    call WriteString
    movzx eax,bl
    call WriteBin
    call Crlf

    xor cl,0FFh
    mov Cval,cl
    mov edx,OFFSET msgXor
    call WriteString
    movzx eax,cl
    call WriteBin
    call Crlf
 
    test al,1
    jnz bitOn
    jmp bitOff
bitOn:
    mov edx,OFFSET msgOn
    call WriteString
    jmp exitt
bitOff:
    mov edx,OFFSET msgOff
    call WriteString
exitt:
    call Crlf
  
exit
main ENDP
END main
