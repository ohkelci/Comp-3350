INCLUDE Irvine32.inc
.data
var1 dword 84672359
var2 dword 14673895

.code
main proc

mov eax, var1
sub eax, var2

call WriteDec

exit
main endp
end main
