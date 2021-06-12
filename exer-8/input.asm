global _start

section .data
  SYS_EXIT equ 60
  num1 db 0

section .text
_start:
  mov rax, 0
  mov rdi, 0
  mov rsi, num1
  mov rdx, 2
  syscall

exit_here:
  mov rax, SYS_EXIT
  xor rdi, rdi
  syscall