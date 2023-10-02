 global main
extern printf
extern scanf

section .data
inicial db "Escreva seu aniversario em anos, meses e dias:",10,0
ano db "Anos: ",0
mes db "Meses: ",0
dia db "Dias: ",0
num db "%d",0
resultado db "Sua idade em dias: %d",10,0

section .bss
anos resq 1
meses resq 1
dias resq 1

section .text
  main:
    push rbp
    mov rbp,rsp
    
    ;pedir aniversario
    mov rdi, inicial
    call printf
    
    ;anos
    mov rdi,ano
    call printf
    mov rdi,num
    mov rsi,anos
    call scanf
   
    ;meses
    mov rdi,mes
    call printf
    mov rdi,num
    mov rsi,meses
    call scanf

    ;ano mov rdi,mes
    mov rdi, dia
    call printf
    mov rdi,num
    mov rsi,dias
    call scanf

    ;colocar os valores em registradores
    mov rax,[anos]
    mov rbx,[meses]
    mov rcx,[dias]

    ;multiplicar e somar dias
    imul rax,365
    add rax,rcx
    imul rbx,30
    add rax,rbx

    mov rsi,rax
    mov rdi,resultado
    call printf
    
    pop rbp 
    mov eax,0
    ret
