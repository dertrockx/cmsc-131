global _start


; test cases passed: 4
section .data
  SYS_EXIT equ 60
  inputA db 21
  inputB db 15
  inputC db 7
  largestNum db 0
  largestInput db 'A' ; set default largest input to A


section .text

_start:
  mov al, byte[inputA]
  cmp al, byte[inputB]
  jle bIsGreatest
  cmp al, byte[inputC]
  jle bIsGreatest
  jmp aIsGreatest

aIsGreatest:
  mov byte[largestNum], al
  jmp exit_here

bIsGreatest:
  mov bl, byte[inputB]
  cmp bl, byte[inputA]
  jle cIsGreatest
  cmp bl, byte[inputC]
  jle cIsGreatest
  mov byte[largestNum], bl
  mov byte[largestInput], 'B'
  jmp exit_here

cIsGreatest:
  mov cl, byte[inputC]
  cmp cl, byte[inputA]
  jle exit_here
  cmp cl, byte[inputB]
  jle exit_here
  mov byte[largestNum], cl
  mov byte[largestInput], 'C'
  jmp exit_here

exit_here:
  mov rax, SYS_EXIT
  xor rdi, rdi
  syscall
  
