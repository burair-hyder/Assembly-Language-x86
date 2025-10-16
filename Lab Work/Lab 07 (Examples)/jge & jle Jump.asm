INCLUDE Irvine32.inc
;SYED MUHAMMAD BURAIR HYDER 24K-0804
.data
A DWORD 50
B DWORD 50
msgGreaterEqual BYTE "A >= B",0
msgLesserEqual  BYTE "A <= B",0


.code
main PROC
    mov eax, A
    mov ebx, B
    cmp eax, ebx

    jge greaterEqual
    jle lesserEqual

greaterEqual:
    mov edx, OFFSET msgGreaterEqual
    call WriteString
    jmp done

lesserEqual:
    mov edx, OFFSET msgLesserEqual
    call WriteString
    jmp done

done:
    call Crlf
    exit
main ENDP
END main
