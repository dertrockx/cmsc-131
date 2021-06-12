global _start

section .data
  SYS_EXIT equ 60
  dividend db 198
  divisor db 10

section .text
_start:
  mov al, byte[dividend]
  mov bl, byte[divisor]
  div bl

exit_here:
  mov rax, SYS_EXIT
  xor rdi, rdi
  syscall