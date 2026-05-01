; post1b.asm - INT 10h: cursor y color
; Compilar: nasm -f bin post1b.asm -o post1b.com

ORG 100h

section .text
start:
    ; Limpiar pantalla (AH=06h)
    mov ah, 06h
    xor al, al       ; Limpiar toda la ventana
    xor cx, cx       ; Esquina superior (0,0)
    mov dx, 184Fh    ; Esquina inferior (24,79)
    mov bh, 07h      ; Atributo blanco sobre negro
    int 10h

    ; Posicionar cursor (Fila 2, Columna 10)
    mov ah, 02h
    xor bh, bh       ; Pagina 0
    mov dh, 02h      ; Fila 2
    mov dl, 0Ah      ; Columna 10
    int 10h

    ; Escribir "A" (Amarillo sobre Azul = 1Eh)
    mov ah, 09h
    mov al, "A"      ; Caracter
    mov bl, 1Eh      ; Atributo
    mov cx, 1        ; Repeticiones
    int 10h

    ; Posicionar cursor (Fila 3, Columna 10)
    mov ah, 02h
    mov dh, 03h
    mov dl, 0Ah
    int 10h

    ; Escribir "U" (Rojo claro sobre negro = 0Ch)
    mov ah, 09h
    mov al, "U"
    mov bl, 0Ch
    mov cx, 1
    int 10h

    ; Avanzar cursor manualmente a Columna 11
    mov ah, 02h
    mov dl, 0Bh
    int 10h

    ; Escribir "7"
    mov ah, 09h
    mov al, "7"
    int 10h

    ; Esperar tecla y salir
    mov ah, 07h      ; Leer sin eco
    int 21h
    mov ah, 4Ch
    int 21h