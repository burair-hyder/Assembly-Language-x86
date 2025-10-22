INCLUDE Irvine32.inc
.data
var1 DWORD 5
var2 DWORD 6
msg1 BYTE "The sum calculated in AddTwo is: ", 0
msg2 BYTE "Values printed inside AddTwo1:", 0

.code
main PROC
    call AddTwo
    call CrLf
    exit
main ENDP

AddTwo PROC
    mov eax, var1
    mov ebx, var2
    add eax, var2

    mov edx, OFFSET msg1
    call WriteString
    call WriteInt
    call CrLf

    call AddTwo1
    ret
AddTwo ENDP

AddTwo1 PROC
    mov ecx, var1
    mov edx, var2

    mov ebx, OFFSET msg2
    call WriteString
    call CrLf

    mov eax, ecx
    call WriteInt
    call CrLf

    mov eax, edx
    call WriteInt
    call CrLf

    ret
AddTwo1 ENDP
END main
