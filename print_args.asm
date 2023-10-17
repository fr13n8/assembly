%include 'functions.asm' ; Include external functions

SECTION .text
    global  _start ; Declare the entry point for the program

_start:
    mov     rsi,    [rsp] ; Move the number of command line arguments into rsi
    lea     rdi,    [rsp + 16] ; Load the address of the first command line argument into rdi

_nextArg:
    cmp     rsi,    1 ; Compare rsi (the number of arguments) with 1
    jz      _finish ; If they are equal, jump to the _finish label
    mov     rax,    [rdi] ; Move the value at the address in rdi into rax (load an argument)
    call    _println ; Call the _println function to print the value in rax
    add     rdi,    8 ; Add 8 to rdi to move to the next argument (assuming each argument is 8 bytes)
    dec     rsi ; Decrement rsi to process the next argument
    jmp     _nextArg ; Jump back to _nextArg to process the next argument

_finish:
    call    _exit ; Call the _exit function to exit the program
