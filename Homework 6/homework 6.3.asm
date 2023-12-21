.386
.model flat,stdcall
.stack 0496
ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc

.DATA
prompt BYTE "Please input a value: ", 0
spacing BYTE ", ", 0
String1 BYTE "The target value is, ", 0
String2 BYTE "and is located at index: ", 0
String3 BYTE "Value not found, ", 0


.code
main proc
mov ecx, 6

inputValues:
	mov edx, offset prompt
	call WriteString
	call readInt
	mov ebx, eax
	push ebx
loop inputValues

mov eax, 5 ;target value
call search

main endp

search proc
mov ecx, 6
mov edx, OFFSET String1
call WriteString
call WriteInt

outputloop:
pop ebx
cmp ebx, eax
je intFound
loop outputloop

locLoop:
	mov eax, 0
	mov edx, OFFSET String3
	call WriteString
	call WriteInt
	ret

intFound:
	mov edx, OFFSET spacing
	call WriteString
	mov edx, OFFSET String2
	call WriteString
	mov eax, ecx
	call WriteDec
	ret

search endp
end main
