global _start


section .data
  student_record equ 34
  student_num equ 0
  snLength equ 11
  name equ 12
  nameLength equ 32
  age equ 33

  snInput db "2013-00000", 0

section .bss
  student resb student_record

section .text
_start:
  ; example with user input
  ; will be discussed sa week 10?
  
  mov rax, 0 ;
  mov rdi, 0 ; input 
  lea rsi, [student + student_num] ; where to put input
  mov rdx, 11 ; how many characters does the input have
  syscall 

  dec rax
  mov byte[student + snLength], al ; input is registered at al?

  ; print operation
  mov rax, 1
  mov rdi, 1
  lea rsi, [ student + student_num ] ; gets the value from student_num member
  mov dl, byte[student + snLength]
  syscall
 
exit_here:
  mov rax, 60
  mov rdi, rdi
  syscall
