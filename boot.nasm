; Simple bootloader

BITS 16  ; set 16 bit mode
ORG 0x7c00 ; the BIOS will look for boot sector at this address

; set registers for BIOS INT 10h
mov al, '!'    ;character to print
mov ah, 0x0e   ;write character in TTY mode
mov bh, 0x00   ;page number
mov bl, 0x07   ;color light gray

int 0x10

times 510-($-$$) db 0 ;padd next all but 2 bytes with 0
; signal that this is a boot sector
db 0x55
db 0xaa
