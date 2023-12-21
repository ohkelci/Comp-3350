.386
.model flat,stdcall
.stack 0496
ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc

.DATA
PromptUser BYTE "Please enter a value: ", 0
stackValue DWORD 5 DUP (?)

.code
main proc
mov ecx, 5

inputLoop:
	mov edx, OFFSET promptUser
	call WriteString
	call readInt
	push eax
loop inputLoop

mov ecx, 5
mov esi, OFFSET stackValue

outputLoop:
	pop eax
	call WriteInt
	call Crlf
loop outputLoop


exit
main endp
end main
