%include  'functions.asm'
%include  'atoi.asm'

global  _start

SECTION .text

_start:
  mov rsi, [rsp]
  lea rdi, [rsp + 16]
  mov rcx,  0

_nextArg:
  cmp rsi,  1
  jz  _done
  mov rax,  [rdi]
  call  _atoi
  add rcx,  rax
  add rdi,  8
  dec rsi
  jmp _nextArg
    
_done:
  xor rax, rax
  mov rax, rcx
  call _iprintln
  call  _exit

