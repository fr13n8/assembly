%include 'functions.asm'

SECTION .text              ; Start of the .text section (executable code)
    global _start         ; Declare _start as a global label (entry point)

_start:                   ; Entry point of the program
    mov     rcx,    10           ; Load the value 10 into the rcx register

_nextDigit:               ; Loop label to print digits
    dec     rcx               ; Decrement the value in rcx
    mov     rax,    rcx          ; Move the value from rcx to rax
    add     rax,    48           ; Convert the value in rax to ASCII (48 is the ASCII code for '0')
    push    rax              ; Push the ASCII value onto the stack
    mov     rax,    rsp          ; Move the address of the pushed value (top of stack) into rax
    call    _println         ; Call the _println function to print the value

    pop     rax               ; Pop the previously pushed value from the stack into rax
    cmp     rcx,    0            ; Compare the value in rcx to 0
    jne     _nextDigit        ; Jump to _nextDigit if rcx is not equal to 0 (loop continuation)
    call    _exit            ; Call the _exit function to terminate the program
