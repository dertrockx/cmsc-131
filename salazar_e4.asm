# loops / iterative statements

global _start

section .data
  SYS_EXIT equ 60
  a db 96
  b db 64
  gcf db 0

section .text

_start:
  jmp getGCF

getGCF:
  mov al, byte[a]
  cmp al, byte[b]
  je returnA
  cmp al, 0
  je returnZero
  
  mov bl, byte[b]
  cmp bl, 0
  je returnZero

  cmp al, bl
  ja case1
  jmp case2

case1:
  sub byte[a], bl
  jmp getGCF

case2:
  sub byte[b], al
  jmp getGCF

returnZero:
  mov byte[gcf], 0
  jmp exit_here


returnA:
  mov byte[gcf], al
  jmp exit_here

exit_here:
  mov rax, SYS_EXIT
  xor rdi, rdi
  syscall
