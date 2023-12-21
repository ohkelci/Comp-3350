INCLUDE Irvine32.inc

.code
main proc

mov ebx, 123
mov eax, 15
imul eax, ebx

call WriteDec

exit
main endp
end main
