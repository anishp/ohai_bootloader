; Simple bootloader

BITS 16  ; set 16 bit mode
ORG 0x7c00 ; the BIOS will look for boot sector at this address

main:
	mov si, welcome_string
	call print

	jmp $

print:
	repeat:
	lodsb
	cmp al, 0x00
	je done
	mov ah, 0x0e
	int 0x10
	jmp repeat

	done:
	ret


welcome_string db "ohai this is my really awesome bootloader",0x00

times 510-($-$$) db 0 ;padd next all but 2 bytes with 0
; signal that this is a boot sector
db 0x55
db 0xaa


