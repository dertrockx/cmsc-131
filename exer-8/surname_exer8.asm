global _start

section .data
	menu db 10, "[1] Add Patient", 10, "[2] Edit Patient", 10, "[3] Print Patients", 10, "[4] Exit", 10, "Enter choice: "
	menuLength equ $-menu

	invalidChoice db 10, "Invalid choice!", 10
	invalidChoiceLength equ $-invalidChoice

	fullPrompt db "Record is already full!", 10
	fullPromptLength equ $-fullPrompt

	addCase db 10, "Enter caseID: "		;Use this prompt for add and edit
	addCaseLength equ $-addCase

	addSex db "Enter sex (F - Female, M - Male): "
	addSexLength equ $-addSex

	addStatus db "Enter status (0 - deceased, 1 - admitted, 2 - recovered): " ;Use this prompt for add and edit
	addStatusLength equ $-addStatus

	addDate db "Enter date admitted (mm/dd/yyyy): "
	addDateLength equ $-addDate

	printCase db 10, "CaseID: "
	printCaseLength equ $-printCase

	printSex db 10, "Sex: "
	printSexLength equ $-printSex

	printStatus db 10, "Status: "
	printStatusLength equ $-printStatus

	printDate db 10, "Date Admitted: "
	printDateLength equ $-printDate

	cannotEdit db "Cannot edit records of a deceased patient.", 10
	cannotEditLength equ $-cannotEdit

	cannotFind db "Patient not found!", 10
	cannotFindPrompt equ $-cannotFind

	newLine db 10
	newLineLength equ $-newLine

	choice db 0 ; store choices here
	choiceLength equ 2 ; since either 1, 2, 3, 4 lang pamimilian and the second one is for new line

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

	currentIndex db 0 ; index where the record database points at
	

	

; choice mapping
; 1 - 49
; 2, 50
; 3, 51
; 4, 52

section .bss
	record resb patient_record * arraySize

section .text
_start:
	mov bpl, byte[currentIndex]	

	jmp run

	
run:
	mov rax, 1
	mov rdi, 1
	mov rsi, menu
	mov rdx, menuLength
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, choice
	mov rdx, 2
	syscall

	
	mov al, 36
	mul bpl
	mov r14w, ax

	mov al, byte[choice]
	sub al, 30h
	cmp al, 1 ; 49 === 1 sa mapping, ewan ko kung bakit
	je addPatient
	cmp al, 3
	je printAllCases
	cmp al, 4
	je exit_here


addPatient:
	cmp bpl, 5
	je fullPromptFunc

	call addCaseFunc
	call addSexFunc
	call addStatusFunc
	call addDateFunc
	add bpl, 1

	jmp run

fullPromptFunc:
	mov rax, 1
	mov rdi, 1
	mov rsi, fullPrompt
	mov rdx, fullPromptLength
	syscall
	jmp run

printAllCases:
	mov r10b, 0
	; mov r11, qword[currentIndex]

	print:

		cmp bpl, r10b
		je exit

		mov al, 36
		mul r10b
		mov r15w, ax

		mov rax, 1
		mov rdi, 1
		mov rsi, printCase
		mov rdx, printCaseLength
		syscall

		mov rax, 1
		mov rdi, 1
		lea rsi, [ record + r15 + caseID]
		mov dl, byte[ record + r15 + caseIDLength ] 
		syscall

		mov rax, 1
		mov rdi, 1
		mov rsi, printSex
		mov rdx, printSexLength
		syscall

		mov rax, 1
		mov rdi, 1
		lea rsi, [ record + r15 + sex]
		mov dl, byte[ record + r15 + sexLength ] 
		syscall

		mov rax, 1
		mov rdi, 1
		mov rsi, printStatus
		mov rdx, printStatusLength
		syscall

		mov rax, 1
		mov rdi, 1
		lea rsi, [ record + r15 + status]
		mov dl, byte[ record + r15 + statusLength ] 
		syscall

		mov rax, 1
		mov rdi, 1
		mov rsi, printDate
		mov rdx, printDateLength
		syscall

		mov rax, 1
		mov rdi, 1
		lea rsi, [ record + r15 + date]
		mov dl, byte[ record + r15 + dateLength  ] 
		syscall


		inc r10b
		jmp print 
	exit:
		jmp run

addCaseFunc:
	; case ID input
	mov rax, 1
	mov rdi, 1
	mov rsi, addCase
	mov rdx, addCaseLength
	syscall

	mov rax, 0
	mov rdi, 0
	lea rsi, [record + r14 + caseID]
	mov rdx, caseIDLength
	syscall

	dec rax
	mov byte[record + r14 + caseIDLength], al
	ret

addSexFunc:
		; sex input
	mov rax, 1
	mov rdi, 1
	mov rsi, addSex
	mov rdx, addSexLength
	syscall
	
	mov rax, 0
	mov rdi, 0
	lea rsi, [ record + r14 + sex ]
	mov rdx, sexLength
	syscall



	; dec rax
	; mov byte[record + 0 * patient_record + sexLength], al
	ret

addStatusFunc:
	; status input
	mov rax, 1
	mov rdi, 1
	mov rsi, addStatus
	mov rdx, addStatusLength
	syscall
	
	mov rax, 0
	mov rdi, 0
	lea rsi, [ record + r14 + status ]
	mov rdx, statusLength
	syscall

	; dec rax
	; mov byte[record + 0 * patient_record + statusLength], al
	

	ret

addDateFunc:
	; date input
	mov rax, 1
	mov rdi, 1
	mov rsi, addDate
	mov rdx, addDateLength
	syscall
	
	mov rax, 0
	mov rdi, 0
	lea rsi, [ record + r14 + date ]
	mov rdx, dateLength
	syscall

	ret 

exit_here:
	mov rax, 60
	xor rdi, rdi
	syscall


