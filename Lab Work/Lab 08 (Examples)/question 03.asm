INCLUDE Irvine32.inc
.data
versionHistory WORD 101, 102, 103, 104, 105
rollbackHistory WORD 5 DUP(?)
msg1 BYTE "Version History (Latest Last):", 0
msg2 BYTE "Rollback Order (After Using PUSH & POP):", 0
space BYTE " ", 0

.code
main PROC
    call CrLf
    mov edx, OFFSET msg1
    call WriteString
    call CrLf

; Display original version history
    mov ecx, LENGTHOF versionHistory
    mov esi, OFFSET versionHistory
display_original:
    movzx eax, WORD PTR [esi]
    call WriteDec
    mov edx, OFFSET space
    call WriteString
    add esi, TYPE versionHistory
    loop display_original

; Push all version numbers to stack
    mov ecx, LENGTHOF versionHistory
    mov esi, OFFSET versionHistory
push_versions:
    mov ax, [esi]
    push ax
    add esi, TYPE versionHistory
    loop push_versions

; Pop all version numbers in reverse order
    mov ecx, LENGTHOF rollbackHistory
    mov edi, OFFSET rollbackHistory
pop_versions:
    pop ax
    mov [edi], ax
    add edi, TYPE rollbackHistory
    loop pop_versions

    call CrLf
    mov edx, OFFSET msg2
    call WriteString
    call CrLf

; Display rollback array (reversed)
    mov ecx, LENGTHOF rollbackHistory
    mov esi, OFFSET rollbackHistory
display_rollback:
    movzx eax, WORD PTR [esi]
    call WriteDec
    mov edx, OFFSET space
    call WriteString
    add esi, TYPE rollbackHistory
    loop display_rollback

    call CrLf
    exit
main ENDP
END main
