_slen:
    push    rbx         ; Preserve the value of rbx on the stack
    mov     rbx,    rax ; Store the original rax value in rbx

_nextChar:
    cmp     byte [rax], 0 ; Compare the byte at the memory location pointed to by rax with 0
    jz      _finished    ; Jump to _finished if the byte is 0 (end of string)
    inc     rax          ; Increment rax to move to the next character in the string
    jmp     _nextChar    ; Jump back to the _nextChar loop

_finished:
    sub     rax,    rbx ; Calculate the length of the string by subtracting rbx (original rax value) from rax
    pop     rbx         ; Restore the original value of rbx
    ret                 ; Return with the string length in rax

_print:
    push    rcx         ; Preserve rcx
    push    rdx         ; Preserve rdx
    push    rsi         ; Preserve rsi
    push    rdi         ; Preserve rdi
    push    rax         ; Preserve rax (return value)
    call    _slen       ; Call the _slen function to determine the string length

    mov     rdx,    rax ; Move the string length (calculated by _slen) to rdx
    pop     rax         ; Restore the original value of rax
    
    mov     rsi,    rax ; Set rsi to point to the start of the string
    mov     rax,    1   ; Set rax to 1 (syscall number for sys_write)
    mov     rdi,    1   ; Set rdi to 1 (file descriptor for stdout)
    syscall             ; Call syscall to write the string to stdout

    pop     rdi         ; Restore rdi
    pop     rsi         ; Restore rsi
    pop     rdx         ; Restore rdx
    pop     rcx         ; Restore rcx
    ret                 ; Return

_println:
    call    _print      ; Call the _print function to print the string

    push    rax         ; Preserve rax
    mov     rax,    10  ; Set rax to 10 (ASCII code for newline character)
    push    rax         ; Push the newline character onto the stack
    mov     rax,    rsp ; Set rax to the stack pointer (address of the newline character)
    call    _print      ; Call the _print function to print the newline character
    pop     rax         ; Restore rax
    pop     rax         ; Pop the newline character from the stack
    ret                 ; Return

_iprint:
    push    rcx         ; Preserve rcx
    push    rdx         ; Preserve rdx
    push    rsi         ; Preserve rsi
    push    rax         ; Preserve rax (return value)
    mov     rcx,    0

_divideLoop:
    inc     rcx
    mov     rdx,    0
    mov     rsi,    10
    idiv    rsi
    add     rdx,    48
    push    rdx
    cmp     rax,    0
    jnz     _divideLoop

_iprintLoop:
    dec     rcx
    mov     rax,    rsp
    call    _print
    pop     rax
    cmp     rcx,    0
    jnz     _iprintLoop
    
    pop     rax
    pop     rsi
    pop     rdx
    pop     rcx
    ret

_iprintln:
    call    _iprint      ; Call the _print function to print the string

    push    rax         ; Preserve rax
    mov     rax,    10  ; Set rax to 10 (ASCII code for newline character)
    push    rax         ; Push the newline character onto the stack
    mov     rax,    rsp ; Set rax to the stack pointer (address of the newline character)
    call    _print      ; Call the _print function to print the newline character
    pop     rax         ; Restore rax
    pop     rax         ; Pop the newline character from the stack
    ret                 ; Return

_read:
    push    rdi         ; Push the value of the rdi register onto the stack (saving it).
    push    rax         ; Push the value of the rax register onto the stack (saving it).
    mov     rax, 0      ; Set the value of the rax register to 0, indicating syscall number for sys_read.
    mov     rdi, 0      ; Set the value of the rdi register to 0, which is the file descriptor for stdin (standard input).
    syscall             ; Invoke the syscall to read input from stdin.

    pop     rax         ; Pop the previously saved value of rax back into the rax register.
    pop     rdi         ; Pop the previously saved value of rdi back into the rdi register.
    ret                 ; Return from the function.

_exit:
    mov     rax,    60  ; Set rax to 60 (syscall number for sys_exit)
    mov     rdi,    0   ; Set rdi to 0 (exit status)
    syscall             ; Call syscall to exit the program
    ret                 ; Return
