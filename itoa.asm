%include 'functions.asm'

SECTION .text
    global _start

_start:
    mov     rcx,    0

_nextNum:
    mov     rax,    rcx
    call    _iprintln
    inc     rcx
    cmp     rcx,    11
    jnz     _nextNum

    call    _exit