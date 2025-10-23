INCLUDE  Irvine32.inc


.data

  vow DWORD 0
  cons DWORD 0
  pre BYTE "Original String: ",0
  prompt BYTE "Enter a string: ",0
  msg BYTE 20 DUP(?)
  Vmsg BYTE "Number of vowels in the string: ",0
  Cmsg BYTE "Number of consonants in the string: ",0

.code
main PROC
  mov edx,OFFSET prompt
  Call WriteString
  mov edx,OFFSET msg
  mov ecx,LENGTHOF msg
  Call ReadString

  mov ecx,eax ; eax stores number of characters read using readstring

  mov esi,0
  l1:
    mov al,msg[esi]
    inc esi
    cmp al,' '
    je cont
    cmp al,'a'
    je VOWELS
    cmp al,'e'
    je VOWELS
    cmp al,'i'
    je VOWELS
    cmp al,'o'
    je VOWELS
    cmp al,'u'
    je VOWELS

    jmp CONSONANTS

cont:
    
    loop l1
    mov edx,OFFSET pre
    Call WriteString
    mov edx,OFFSET msg
    Call WriteString
    Call Crlf
    
    
    mov edx,OFFSET Vmsg
    Call WriteString
    mov eax,vow
    Call Writedec
    Call Crlf
    
    mov edx,OFFSET Cmsg
    Call WriteString
    mov eax,cons
    Call Writedec
    Call Crlf
    jmp exitt


VOWELS:
    inc vow
    jmp cont

CONSONANTS:
    inc cons
    jmp cont

exitt:

exit
main ENDP
END main 
