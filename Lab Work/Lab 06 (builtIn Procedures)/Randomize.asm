INCLUDE Irvine32.inc

.code
main PROC
    call Randomize        ; seed random generator
    mov  eax, 100         ; range = 0–99
    call RandomRange      ; eax = random number < 100
    call WriteDec         ; print it
    call Crlf
    exit
main ENDP
END main

