INCLUDE Irvine32.inc

.data
FogArray SWORD -1, 87, 0CFh, 1234, -9, -256, 23
promptUser BYTE "Enter integer n: ", 0

.code
main proc

;user read/write prompt
	mov edx, OFFSET promptUser
	call WriteString
	call readInt
	mov ecx, eax

;printing n elements
	mov esi, OFFSET FogArray
	mov ecx, 7

oddLoop:
	movsx eax, WORD PTR [esi]
	test ax, 1
	jz skip
	call WriteInt ;odd number
	call Crlf
skip:	
	add esi, 2
	loop oddLoop


exit
main endp
end main
