; @author
; Ian I. Salazar
; 2019-04060
; CMSC 131 AB-2L
; Exercise 2

;working na siya.
; ginamit ko quadword kasi not allowed na magkaibang type na operand


global _start

section .data
  SYS_EXIT equ 60
  age dq 25 
  days dq 0
  hours dq 0

  DAYS dq 365
  HOURS dq 24 

section .text

_start:
  mov rax, qword[age]
  mul qword[DAYS]
  mov qword[days], rax
  mov qword[days+8], rdx
 ; days = 9125 dapat, nagana na siya. don't touch it please
  
  ; hours should be 219000
  mov rax, qword[days]
  mul qword[HOURS]
  mov qword[hours], rax
  mov qword[hours+8], rdx


exit_here:
  mov rax, SYS_EXIT
  xor rdi, rdi
  syscall

