.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

INCLUDE Irvine32.inc

.DATA
userPrompt BYTE "Please input a character to search for: ", 0
myString BYTE "Summer is pleasant in Auburn", 0

charFound BYTE "Character found: ", 0
index BYTE "Index within the string: ", 0


.code
main proc
    mov edx, offset userPrompt
    call WriteString
    call ReadChar
    call CrLf

    mov esi, offset myString 
    mov edi, 0               

searchLoop:

    mov dl, [esi]            
    cmp dl, al             
    je characterIsFound

    inc edi                
    inc esi                 
    loop searchLoop

characterIsFound:
    mov edx, offset charFound
    call WriteString
    mov dl, al        
    call WriteChar
    call Crlf

    mov edx, offset index
    call WriteString
    mov eax, edi      
    call WriteDec

    jmp exitLoop


exitLoop:
    call ExitProcess

main endp

end main
