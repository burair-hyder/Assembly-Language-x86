INCLUDE Irvine32.inc
.data
num1 DWORD 6
num2 DWORD 5
product DWORD ?
msg BYTE "Product = ", 0

.code
main PROC
    mov eax, 0        
    mov ebx, num1      
    mov ecx, num2       
multiply_loop:
    test ecx, 1         
    jz skip_add
    add eax, ebx        
skip_add:
    shl ebx, 1          
    shr ecx, 1          
    cmp ecx, 0
    jne multiply_loop
    mov product, eax
    mov edx, OFFSET msg
    call WriteString
    mov eax, product
    call WriteDec
    call Crlf
    exit
main ENDP
END main
