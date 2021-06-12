global _start

section .data
  addCase db 10, "Enter caseID: "		;Use this prompt for add and edit
	addCaseLength equ $-addCase

	addSex db "Enter sex (F - Female, M - Male): "
	addSexLength equ $-addSex

	addStatus db "Enter status (0 - deceased, 1 - admitted, 2 - recovered): " ;Use this prompt for add and edit
	addStatusLength equ $-addStatus

  addDate db "Enter date admitted (mm/dd/yyyy): "
	addDateLength equ $-addDate

  arraySize equ 5

  patient_record equ 36
	
	caseID equ 0
	caseIDLength equ 20
	sex equ 21
	sexLength equ 22
	status equ 23
	statusLength equ 24
	date equ 25
	dateLength equ 35

section .bss
  record resb patient_record * arraySize

section .text
_start:
  mov rax, 1
	mov rdi, 1
	mov rsi, addCase
	mov rdx, addCaseLength
	syscall

	mov rax, 0
	mov rdi, 0
	lea rsi, [record + 0 * patient_record + caseID]
	mov rdx, caseIDLength
	syscall

	dec rax
	mov byte[record + 0 * patient_record + caseIDLength], al
	
  mov rax, 1
	mov rdi, 1
	mov rsi, addSex
	mov rdx, addSexLength
	syscall
	
	mov rax, 0
	mov rdi, 0
	lea rsi, [ record + 0 * patient_record + sex ]
	mov rdx, sexLength
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, addStatus
	mov rdx, addStatusLength
	syscall
	
	mov rax, 0
	mov rdi, 0
	lea rsi, [ record + 0 * patient_record + status ]
	mov rdx, statusLength
	syscall

  mov rax, 1
	mov rdi, 1
	mov rsi, addDate
	mov rdx, addDateLength
	syscall
	
	mov rax, 0
	mov rdi, 0
	lea rsi, [ record + 0 * patient_record + date ]
	mov rdx, dateLength
	syscall
  
  ; after getting it all, we need to re-convert the inputs
  ; to somehow remove  the garbage input
  ; this is a hack...

  ; clean up sex
  sub byte[ record + 0 * patient_record + sex ], 30h
  ; add byte[ record + 0 * patient_record + sex ], 30h


exit_here:
	mov rax, 60
	xor rdi, rdi
	syscall
