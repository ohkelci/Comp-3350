INCLUDE Irvine32.inc

.data
CloudArray SWORD 1,2,3,4,5,6,7,8,9,0Ah,0Bh,0Ch
MistArray SWORD  0,1,-2,-3,4,5,6,7,8,9,0Ah,0Bh
FogArray SWORD	12 DUP (?)

.code
main proc


;display cloudArray
	mov esi, OFFSET CloudArray
	mov ebx, TYPE CloudArray
	mov ecx, LENGTHOF CloudArray

cloudLoop:
	movsx eax, WORD PTR [esi]
	call WriteInt
	add esi, 2
	loop CloudLoop


;display MistArray
	mov esi, OFFSET MistArray
	mov ebx, TYPE MistArray
	mov ecx, LENGTHOF MistArray
	call Crlf

mistLoop:
	movsx eax, WORD PTR [esi]
	call WriteInt
	add esi, 2
	loop mistLoop	

; CloudArray + MistArray = FogArray
	mov esi, OFFSET CloudArray
	mov edi, OFFSET MistArray
	mov ebx, OFFSET FogArray
	mov ecx, LENGTHOF FogArray
	call Crlf
	
fogLoop:
    mov ax, [esi]        ; Load value from CloudArray
    add ax, [edi]        ; Add value from MistArray
    mov [ebx], ax        ; Store result in FogArray

    add esi, 2
    add edi, 2
    add ebx, 2
    loop fogLoop

    ; Display FogArray
    mov esi, OFFSET FogArray
    mov ecx, LENGTHOF FogArray

fogDisplayLoop:
    movsx eax, WORD PTR [esi]
    call WriteInt
    add esi, 2
    loop fogDisplayLoop

    call Crlf


exit
main endp
end main
