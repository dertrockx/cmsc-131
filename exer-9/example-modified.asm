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
  num1a db 0 ; first digit
  num1b db 0 ; second digit

  num2a db 0 ; first digit 
  num2b db 0 ; second digit
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
  mov rsi, num1a
  mov rdx, 1 ; two for the digit and one for the newlinecharacter
  syscall

  mov rax, SYS_READ
  mov rdi, STDIN
  mov rsi, num1b
  mov rdx, 2 ; two for the digit and one for the newlinecharacter
  syscall

  mov rax, SYS_WRITE
  mov rdi, STDOUT
  mov rsi, msg
  mov rdx, msgLen
  syscall

  mov rax, SYS_READ
  mov rdi, STDIN
  mov rsi, num2a
  mov rdx, 1 ; two for the digit and one for the newline character
  syscall

  mov rax, SYS_READ
  mov rdi, STDIN
  mov rsi, num2b
  mov rdx, 2 ; two for the digit and one for the newline character
  syscall

  sub byte[num1a], 30h ; convert to decimal equivalent
  sub byte[num1b], 30h
  sub byte[num2a], 30h
  sub byte[num2b], 30h

  ; move actual value to num1 and num2 
  ; since parsed separately ang ones and tens
  mov al, byte[num1a]
  mov bl, 10
  mul bl
  add al, byte[num1b]
  mov byte[num1a], al

  mov al, byte[num2a]
  mov bl, 10
  mul bl
  add al, byte[num2b]
  mov byte[num2a], al

  ; get the sum
  add al, byte[num1a]
  ; ax has the sum
  mov bl, 100
  div bl
  ; al - quotient, ah - remainder
  ; store the hundreds digit to num1a
  mov byte[num1a], al
  mov byte[num1b], ah
  ; then divide again to get the tens digit and ones digit
  mov al, byte[num1b]
  mov ah, 0
  mov bl, 10
  div bl

  ; store tens to num1b
  ; store ones to num2a
  mov byte[num1b], al
  mov byte[num2a], ah

  
  ; add 30h to get the ascii equivalent
  add byte[num1a], 30h 
  add byte[num1b], 30h
  add byte[num2a], 30h

  mov rax, SYS_WRITE
  mov rdi, STDOUT
  mov rsi, num1a
  mov rdx, 1
  syscall

  mov rax, SYS_WRITE
  mov rdi, STDOUT
  mov rsi, num1b
  mov rdx, 1
  syscall

  mov rax, SYS_WRITE
  mov rdi, STDOUT
  mov rsi, num2a
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