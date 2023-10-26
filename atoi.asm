_atoi:
    push    rcx         ; Preserve rcx
    push    rsi         ; Preserve rsi
    mov     rsi,    rax
    
    mov     rax,    0
    mov     rcx,    0
_loop:
    xor     rbx,    rbx
    mov     bl,     [rsi + rcx]
    cmp     bl,     48
    jl      _finish
    cmp     bl,     57  
    jg      _finish

    sub     bl,     48
    add     rax,    rbx
    mov     rbx,    10
    mul     rbx
    inc     rcx
    jmp     _loop

_finish:
    cmp     rcx,    0
    je      _restore
    mov     rbx,    10
    div     rbx

_restore:
    pop     rsi
    pop     rcx
    ret