INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
A DWORD 10
B DWORD 20
msgGreater BYTE "A > B",0
msgLesser  BYTE "A < B",0
newline BYTE 0Dh,0Ah,0

.code
main PROC
    mov eax, A
    mov ebx, B
    cmp eax, ebx

    jg greaterLabel
    jl lesserLabel

greaterLabel:
    mov edx, OFFSET msgGreater
    call WriteString
    jmp done

lesserLabel:
    mov edx, OFFSET msgLesser
    call WriteString
    jmp done

done:
    call Crlf
    exit
main ENDP
END main
