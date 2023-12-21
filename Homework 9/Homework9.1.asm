INCLUDE Irvine32.inc

.DATA
    questionPrompt BYTE "What is the value of X in X=A-B+C? ", 0
    varA BYTE "Enter a value for variable A: ", 0
    varB BYTE "Enter a value for variable B: ", 0
    varC BYTE "Enter a value for variable C: ", 0
    varX BYTE "X = ", 0

.CODE
ArithmeticExpression PROC
    mov edx, OFFSET questionPrompt
    call WriteString
    call crlf

    mov edx, OFFSET varA
    call WriteString
    call ReadInt
    push eax

    mov edx, OFFSET varB
    call WriteString
    call ReadInt
    push eax

    mov edx, OFFSET varC
    call WriteString
    call ReadInt
    push eax

    pop eax        
    pop ebx        
    pop edx       

    sub eax, ebx   
    add eax, edx   

    mov edx, OFFSET varX
    call WriteString
    call WriteInt
    call Crlf

    exit
ArithmeticExpression ENDP

END ArithmeticExpression
