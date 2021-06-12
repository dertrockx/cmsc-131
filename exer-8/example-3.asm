global _start
section .data

  arraySize equ 3
  student_record equ 34
  student_num equ 0
  snLength equ 11
  name equ 12
  nameLength equ 32
  age equ 33

  student1 db "Harry Potter", 0
  student2 db "Ron Weasly", 0
  student3 db "Hermione Granger", 0


section .bss
  record resb student_record * arraySize


section .text
_start:
  mov byte[student + age], 17 ; student.age = 17

  mov rsi, snInput ; rsi = snInput
  lea rdi, [student + student_num] ; student.student_num = rsi
  cld

  mov rcx, 11
  rep movsb

  mov byte[rdi], 0

exit_here:
  mov rax, 60
  mov rdi, rdi
  syscall
