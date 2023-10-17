SECTION .data
    sys_exit    equ     60       ; Define an equate for system exit call number
    sys_write   equ     1        ; Define an equate for system write call number
    stdout      equ     1        ; Define an equate for standard output file descriptor

    message     db      "Hello ", 0      ; Define a null-terminated string 'Hello '
    message2    db      "World!", 10, 0  ; Define a null-terminated string 'World!' followed by a newline character and null terminator

SECTION .text
    global  _start   ; Declare _start as a global symbol for the entry point

_start:
    mov     rax,    message    ; Load the address of 'message' into rax
    call    _print             ; Call the _print function to print the message

    mov     rax,    message2   ; Load the address of 'message2' into rax
    call    _print             ; Call the _print function to print the second message

    mov     rax,    sys_exit   ; Load the system exit call number into rax
    mov     rdi,    0          ; Set the exit status to 0
    syscall                    ; Invoke the system call to exit

_print:
    push    rax                ; Push the value of rax onto the stack
    mov     rbx,    0          ; Initialize rbx to 0 to keep track of string length

_printLoop:
    inc     rax                ; Increment the memory address in rax (move to the next character)
    inc     rbx                ; Increment rbx (string length counter)
    mov     cl,     [rax]      ; Load the character at the address in rax into cl
    cmp     cl,     0          ; Compare cl with 0 (end of string)
    jne     _printLoop         ; If not at the end of the string, continue looping

    mov     rax,    sys_write   ; Load the system write call number into rax
    mov     rdi,    stdout      ; Load the standard output file descriptor into rdi
    pop     rsi                 ; Pop the original value of rax from the stack into rsi (address of the string)
    mov     rdx,    rbx         ; Load the length of the string into rdx
    syscall                     ; Invoke the system call to write to the standard output
    ret                         ; Return from the _print function
