.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:DWORD

include Irvine32.inc

.data
    agree byte "Agree", 0
    disagree byte "Disagree", 0
    noseDown byte ", Nose Down", 0
    sensor1Num dword 0
    sensor2Num dword 0
    sensorPrompt1 byte "Sensor 1: ",0
    sensorPrompt2 byte "Sensor 2: ",0

.code
main proc
    mov esi, 0
    mov ecx, 8

test_loop:
    ; input from Sensor 1
    mov edx, offset sensorPrompt1
    call WriteString
    call ReadInt
    mov [sensor1Num], eax

    ; input from Sensor 2
    mov edx, offset sensorPrompt2
    call WriteString
    call ReadInt
    mov [sensor2Num], eax

    mov eax, [sensor1Num]
    sub eax, [sensor2Num]
    cmp eax, 4
    jg disagree

    ; checks if values are more than 50, if not print "nose down"
    cmp dword ptr [sensor1Num], 50
    jl agreement
    cmp dword ptr [sensor2Num], 50
    jl agreement
    mov edx, offset noseDown
    call WriteString
    jmp agreement

disagree:
    mov edx, offset disagree
    call WriteString
    jmp done

agreement:
    mov edx, offset agree
    call WriteString

done:
    call Crlf
    inc esi
    loop test_loop

    invoke ExitProcess, 0
main endp

end main


