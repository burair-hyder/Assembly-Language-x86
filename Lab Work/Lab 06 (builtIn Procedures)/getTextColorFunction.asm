INCLUDE Irvine32.inc

.data
msg1 BYTE "Foreground color code: ",0
msg2 BYTE "Background color code: ",0

.code
main PROC
    call GetTextColor     ; AL=foreground, AH=background

    ; Foreground
    mov edx, OFFSET msg1
    call WriteString
    movzx eax, al         ; move AL into EAX
    call WriteDec
    call Crlf

    ; Background
    mov edx, OFFSET msg2
    call WriteString
    movzx eax, ah         ; move AH into EAX
    call WriteDec
    call Crlf

   
    exit
main ENDP
END main
