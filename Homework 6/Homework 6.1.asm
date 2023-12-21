INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 0496
ExitProcess proto,dwExitCode:dword

.data 
numPrompt BYTE "Enter 0, 1, or 2: ", 0
tigerString BYTE "War Eagle", 0
blueColor = blue + (black * 16)
orangeColor = yellow + (black * 16)
redColor = red + (black * 16)


.code
main proc

call InputIntColor

call displayTiger

main endp


InputIntColor proc
mov edx, OFFSET numPrompt
call WriteString
call readInt
mov bl, al

InputIntColor endp

displayTiger proc
mov al, 0
cmp bl, al
je setColorBlue

mov al, 1
cmp bl, al
je setColorOrange

mov al, 2
cmp bl, al
je setColorRed


;set color to blue
setColorBlue: 
	mov eax, blueColor
	call setTextColor
	mov edx, OFFSET tigerString
	call WriteString
	jmp tigerEnd

; set color to orange
setColorOrange:
	mov eax, orangeColor
	call setTextColor
	mov edx, OFFSET tigerString
	call WriteString
	jmp tigerEnd

;set color to red
	setColorRed:
	mov eax, redColor
	call setTextColor
	mov edx, OFFSET tigerString
	call WriteString
	jmp tigerEnd


tigerEnd:
	displayTiger endp

exit
end main
