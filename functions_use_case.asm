%include  'functions.asm'

SECTION .data
    message     db      "Hello ",   0
    message2    db      "world!",   0

SECTION .text
    global  _start

_start:
    mov     rax,    message
    call    _println

    mov     rax,    message2
    call    _print

    call    _exit
