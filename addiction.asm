SECTION .data
    ; Define some constants
    sys_exit    equ       60       ; System call number for exit
    sys_write   equ       1        ; System call number for write
    stdout      equ       1        ; File descriptor for standard output

    ; Define data variables
    digit       db        0        ; A single byte to store a digit
    newline     db        10       ; The ASCII code for newline character

SECTION .text
    global      _start

_start:
    ; Main entry point
    mov       rax,      5        ; Load the value 5 into rax
    mov       rbx,      3        ; Load the value 3 into rbx
    add       rax,      rbx      ; Add the values in rax and rbx
    call      printRAXdigit      ; Call the printRAXdigit subroutine

    mov       rax,      sys_exit ; Load the system call number for exit into rax
    mov       rdi,      0        ; Load the exit status code (0) into rdi
    syscall                      ; Invoke the system call to exit the program

printRAXdigit:
    ; Subroutine to print the value in RAX as a single digit
    add       al,       '0'       ; Convert the low 8 bits of RAX to ASCII
    mov       [digit],  al        ; Store the ASCII digit in the 'digit' variable
    mov       rax,      sys_write ; Load the system call number for write into rax
    mov       rdi,      stdout    ; Load the file descriptor for standard output into rdi
    mov       rsi,      digit     ; Load the address of the 'digit' variable into rsi
    mov       rdx,      1         ; Specify the number of bytes to write (1 byte)
    syscall                       ; Invoke the system call to write the digit

    mov       rax,      sys_write ; Load the system call number for write into rax
    mov       rdi,      stdout    ; Load the file descriptor for standard output into rdi
    mov       rsi,      newline   ; Load the address of the 'newline' character into rsi
    mov       rdx,      1         ; Specify the number of bytes to write (1 byte)
    syscall                       ; Invoke the system call to write a newline character

    ret                           ; Return from the subroutine
