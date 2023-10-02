global main
extern scanf
extern printf

section .data
  askname db "Digite uma palavra: ",0
  askletter db "Digite uma letra: ",0
  string db "%s",0
  primeira db "A primeira letra é: %c",10,0
  ultima db "A ultima letra é: %c",10,0
  achei db "A letra existe na palavra",10,0
  nachei db "A letra não exite na palavra",10,0


section .bss
  nome resb 32
  letra resb 1

section .text
  main:
    push rbp
    mov rbp,rsp

    ;pedir frase
     mov rdi, askname
     call printf

    ;ler frase
    mov rdi,string
    mov rsi,nome
    call scanf

   ;pedir letra
   mov rdi, askletter
   call printf

   ;ler letra
   mov rdi, string
   mov rsi, letra
   call scanf
    
    mov rsi,[nome]
    mov rbx, nome
    mov rdi, primeira
    call printf


    definir:
    inc rbx
    cmp byte [rbx],0
    jne definir
    mov rsi,[rbx-1]
    mov rdi,ultima
    call printf

    mov rbx,nome
    mov byte al,[letra]
    encontrar:
    cmp byte [rbx],0
    je nao
    cmp byte [rbx],al
    je sim
    inc rbx
    jmp encontrar

    nao:
    mov rdi, nachei
    call printf
    jmp return
    
    sim:
    mov rdi, achei
    call printf
    
    return:
     pop rbp
     mov eax,0
     ret