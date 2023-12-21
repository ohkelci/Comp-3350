.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

include Irvine32.inc

.data
    inputString byte 100 dup(0) ; Reserve space for the input string
    userPrompt byte "Enter a string: ",0
    stringPrompt byte "The string has ",0
    amount byte " characters.",0

.code
main proc
    ; Prompt for input
    mov edx, offset userPrompt
    call WriteString

    ; Read the string
    mov edx, offset inputString
    mov ecx, sizeof inputString
    call ReadString

    mov edx, offset stringPrompt
    call WriteString

    mov edx, offset inputString
    call StrLength 
    call WriteDec

    ; Display the final part of the answer
    mov edx, offset amount
    call WriteString
    call crlf

    exit
main endp

end main


