INCLUDE Irvine32.inc
KEY = 22    	

.data
lastName  BYTE  "Jenkins",0
lastNamePrompt BYTE "Last Name: ", 0
encryptText BYTE  "Last Name Encrypted: ",0
decryptText BYTE  "Last Name Decrypted: ",0

.code
main PROC

	mov edx, offset lastNamePrompt
	call WriteString
	mov edx, offset lastName
	call WriteString
	call crlf

; encryption portion

	mov	ecx, lengthof lastName - 1	
	mov	esi,0			

encryptionLoop:
	xor	lastName[esi],KEY	
	inc	esi			
	loop encryptionLoop

	mov edx, offset encryptText
	call WriteString
	mov edx, offset lastName
	call WriteString
	call crlf

; decryption portion

	mov	ecx, lengthof lastName - 1	
	mov	esi,0			

decryptionLoop:
	xor	lastName[esi],KEY	
	inc	esi			
	loop decryptionLoop

	mov edx, offset decryptText
	call WriteString
	mov edx, offset lastName
	call WriteString
	call crlf


	exit
main ENDP
END main