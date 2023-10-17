%include 'functions.asm'

SECTION .data
    message1    db  "Enter name: ", 0   ; Define a null-terminated string for message1
    message2    db  "Hello, ", 0        ; Define a null-terminated string for message2

SECTION .bss
    sinput  resb    255                  ; Reserve 255 bytes of uninitialized memory for input (sinput)

SECTION .text
    global _start

_start:
    mov     rax,    message1            ; Load the address of message1 into the rax register
    call    _print                      ; Call the _print function to print message1

    mov     rsi,    sinput               ; Load the address of sinput into the rsi register (input buffer)
    mov     rdx,    255                  ; Load the maximum number of bytes to read into the rdx register
    call    _read                       ; Call the _read function to read input into sinput

    mov     rax,    message2            ; Load the address of message2 into the rax register
    call    _print                      ; Call the _print function to print message2

    mov     rax,    sinput               ; Load the address of sinput into the rax register
    call    _print                      ; Call the _print function to print the user's input

    call    _exit                       ; Call the _exit function to terminate the program
