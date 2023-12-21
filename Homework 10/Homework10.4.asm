
include Irvine32.inc

Coordinates STRUCT
    x dword ?
    y dword ?
    z dword ?
Coordinates ENDS

.data
coords Coordinates <1, 2, 3>, <4, 5, 6>, <7, 8, 9>
numOfCoords = 3  

.code
main PROC
    mov esi, OFFSET coords 
    mov ecx, numOfCoords     


    L1: 
        mov eax, [esi+8]    
        call WriteDec       
        call Crlf          

        add esi, TYPE Coordinates  
        loop L1

    invoke ExitProcess, 0

main ENDP
End main


