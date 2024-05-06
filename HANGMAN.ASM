model small
stack 100h
data segment
  ; CONSTANTS  
  inputmsg db 'Guess a letter: $'
  welcome db 10,13,' _                                             ',10,13,'| |                                            ',10,13,'| |__   __ _ _ __   __ _ _ __ ___   __ _ _ __  ',10,13,"| '_ \ / _` | '_ \ / _` | '_ ` _ \ / _` | '_ \ ",10,13,'| | | | (_| | | | | (_| | | | | | | (_| | | | |',10,13,'|_| |_|\__,_|_| |_|\__, |_| |_| |_|\__,_|_| |_|',10,13,'                    __/ |                      ',10,13,'                   |___/                       $'
  hg0 db 10,13,'  +---+',10,13,'  |   |',10,13,'  O   |',10,13,' /|\  |',10,13,' / \  |',10,13,'      |',10,13,'=========$'
  hg1 db 10,13,'  +---+',10,13,'  |   |',10,13,'  O   |',10,13,' /|\  |',10,13,' /    |',10,13,'      |',10,13,'=========$'
  hg2 db 10,13,'  +---+',10,13,'  |   |',10,13,'  O   |',10,13,' /|\  |',10,13,'      |',10,13,'      |',10,13,'=========$'
  hg3 db 10,13,'  +---+',10,13,'  |   |',10,13,'  O   |',10,13,' /|   |',10,13,'      |',10,13,'      |',10,13,'=========$'
  hg4 db 10,13,'  +---+',10,13,'  |   |',10,13,'  O   |',10,13,'  |   |',10,13,'      |',10,13,'      |',10,13,'=========$'
  hg5 db 10,13,'  +---+',10,13,'  |   |',10,13,'  O   |',10,13,'      |',10,13,'      |',10,13,'      |',10,13,'=========$'
  hg6 db 10,13,'  +---+',10,13,'  |   |',10,13,'      |',10,13,'      |',10,13,'      |',10,13,'      |',10,13,'=========$'
  
  victorymsg db 10,13,'Congratulations! You have won!$'
  defeatmsg db 10,13,'You have lost!$'
  nl db 10,13,10,13,'$'
  ; VARIABLES
  ; len db 06h
  len db 0Ch
  ques db 'f','u','n','d','a','m','e','n','t','a','l','s','$'
  guess db 010h dup('?')
  hg db 07h dup('?'),'$'
  counter db 00h
  bool db 0
data ends

print macro msg
  lea dx, msg
  mov ah, 09h
  int 21h
endm

newline macro
  lea dx, nl
  mov ah, 09h
  int 21h
endm

input macro
  mov ah, 01h
  int 21h
endm

printhg macro address
  mov dx, [address]
  mov ah, 09h
  int 21h
endm

verify macro

  lea si, ques
  lea di, guess
  mov cl, len
  
  checker:
    cmp al, [si]
    jne skip
    mov [di], al
    mov bool, 1
  skip:
    add si, 1
    add di, 1
    loop checker
endm

loadhg macro
  lea bx, hg
  lea ax, hg6
  mov [bx], ax
  add bx, 2
  lea ax, hg5
  mov [bx], ax
  add bx, 2
  lea ax, hg4
  mov [bx], ax
  add bx, 2
  lea ax, hg3
  mov [bx], ax
  add bx, 2
  lea ax, hg2
  mov [bx], ax
  add bx, 2
  lea ax, hg1
  mov [bx], ax
  add bx, 2
  lea ax, hg0
  mov [bx], ax
  
  lea bx, guess
  mov cl, len
 l1:mov [bx], '_'
    add bx, 1
    loop l1
    mov [bx], '$'
endm
  
code segment
  assume cs:code, ds:data
  start:
    mov ax, data
    mov ds, ax
    
    loadhg ; Loading all hangman ASCII into a single array

    print welcome
    newline
    
    mov cl, 06h ; number of tries
    mov ch, 00h
    lea bx, hg  ; address of hangman
    game: 
      printhg bx
      newline
      print guess
      newline
      print inputmsg 
      input  ; user input in reg AL
      newline

      mov counter, cl
      verify
      mov cl, counter

      cmp bool, 1
      jne incorrect
      mov bool, 0
      
      jmp skipcp
    codecheckpoint:
      jmp game
    skipcp: 
      ; Check Victory      
      mov counter, cl
      mov cl, len
      lea si, guess
      victory:
        mov dh, [si]
        mov dl, '_'
        cmp dh, dl
        je skipv
        inc si
        loop victory
        
        printhg bx
        newline
        print guess
        newline
        print inputmsg 
        newline
        print victorymsg
        
        jmp exit
      skipv:
        mov cl, counter
        jmp game

      incorrect:  
        add bx, 2
        loop codecheckpoint
        printhg bx
        newline
        print guess
        newline
        print inputmsg 
        newline
        print defeatmsg
    
      exit:
        mov ah, 4ch
        int 21h
code ends
end start