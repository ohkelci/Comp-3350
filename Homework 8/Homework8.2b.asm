include Irvine32.inc

.data

value dword 0A73CD3E9h
lowValue BYTE ?
highValue BYTE ?
msg1 BYTE "DH", 0
msg2 BYTE "DL", 0

.code
main proc

mov eax, value
mov dh, 0
mov dl, 0

; setting DH
mov eax, value
shr eax, 12
and eax,0FFF0FF00h
mov highValue, al

mov edx, offset msg1
call WriteString
mov al, highValue
call WriteHex
call crlf

; setting Dl
mov eax, value
and eax, 0000000Fh
mov lowValue, al

mov edx, offset msg2
call WriteString
mov al, lowValue
call WriteHex
call crlf


exit
main endp
end main





