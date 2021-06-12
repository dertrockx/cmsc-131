global _start

section .data
  LF equ 10
  NULL equ 0
  SYS_EXIT equ 60
  STDOUT equ 1
  SYS_WRITE equ 1
  STDIN equ 0
  SYS_READ equ 0
  msg db "Enter a single-digit number: ", NULL ; always end your strings with NULL
  msgLen equ $-msg
  newLine db LF, NULL
  newLineLen equ $-newLine
  num1 db 0
  num2 db 0
  sum db 0


section .text
_start:
  mov rax, SYS_WRITE
  mov rdi, STDOUT
  mov rsi, msg
  mov rdx, msgLen
  syscall
  mov rax, SYS_READ
  mov rdi, STDIN
  mov rsi, num1
  mov rdx, 2 ; one for the digit and one for the newlinecharacter
  syscall
  mov rax, SYS_WRITE
  mov rdi, STDOUT
  mov rsi, msg
  mov rdx, msgLen
  syscall
  mov rax, SYS_READ
  mov rdi, STDIN
  mov rsi, num2
  mov rdx, 2 ; one for the digit and one for the newline character
  syscall
  sub byte[num1], 30h ; convert to decimal equivalent
  sub byte[num2], 30h
  ; get the sum of the two numbers
  mov al, byte[num1]
  add al, byte[num2] ; ax register holds the sum
; convert back to string for printing
  
  mov bl, 10 ; divide the sum in the ax register by 10 to get the tens and ones place values
  div bl

  mov byte[num1], al ; reuse num1 variable to store tens
  mov byte[num2], ah ; reuse num2 variable to store ones
  add byte[num1], 30h ; add 30h to get the numeric symbol equivalent of the decimal value
  add byte[num2], 30h
  
  mov rax, SYS_WRITE
  mov rdi, STDOUT
  mov rsi, num1
  mov rdx, 1

  syscall
  mov rax, SYS_WRITE
  mov rdi, STDOUT
  mov rsi, num2
  mov rdx, 1
  syscall

  mov rax, SYS_WRITE
  mov rdi, STDOUT
  mov rsi, newLine
  mov rdx, newLineLen
  syscall

exit_here:
  mov rax, SYS_EXIT
  xor rdi, rdi
  syscall