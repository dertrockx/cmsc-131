global _start
section .data
  arraysize equ 3
  student_record equ 34
  student_num equ 0
  snLength equ 11
  name equ 12
  nameLength equ 32
  age equ 33
  student1 db "Harry Potter", 0
  student2 db "Ron Weasley", 0
  student3 db "Hermione Granger", 0

section .bss
  record resb student_record*arraysize

section .text
_start:
  mov rsi, student1
  lea rdi, [record + 0*student_record + name]
  cld
  mov rcx, 12
  rep movsb
  
  mov rsi, 0
  mov rdi, 0
  mov rcx, 0
  mov rsi, student2
  lea rdi, [record + 1*student_record + name]
  cld
  mov rcx, 11
  rep movsb
  mov rsi, 0
  mov rdi, 0
  mov rcx, 0
  mov rsi, student3
  lea rdi, [record + 2*student_record + name]
  cld
  mov rcx, 16
  rep movsb
  mov byte[record+(0*student_record)+age], 17
  mov byte[record+(1*student_record)+age], 16
  mov byte[record+(2*student_record)+age], 17

exit_here:
  mov rax, 60
  xor rdi, rdi
  syscall