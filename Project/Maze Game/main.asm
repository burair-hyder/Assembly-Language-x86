;==============================================================
;   MAZE GAME – Irvine32
;   - 120 x 50 console (black background)
;   - Centered maze and menu
;   - Random / selected maze
;   - Returns to menu after win
;==============================================================

INCLUDE Irvine32.inc

;------------------ CONSTANTS --------------------------------
SCREEN_WIDTH    EQU 120

MAZE_ROWS       EQU 15
MAZE_COLS       EQU 30
TOTAL_CELLS     EQU MAZE_ROWS * MAZE_COLS

MAZE_LEFT       EQU (SCREEN_WIDTH - MAZE_COLS) / 2 ; 45
MAZE_TOP        EQU 8

MENU_LEFT       EQU MAZE_LEFT
MENU_TOP        EQU 10

INSTR_COL       EQU MAZE_LEFT
INSTR_ROW       EQU MAZE_TOP - 2

MOVES_COL       EQU MAZE_LEFT
MOVES_ROW       EQU MAZE_TOP - 1
WELCOME_WIDTH   EQU 55
WELCOME_LEFT    EQU (SCREEN_WIDTH - WELCOME_WIDTH) / 2
WELCOME_TOP     EQU 15

GAME_WIDTH  EQU 55
GAME_LEFT   EQU (SCREEN_WIDTH - GAME_WIDTH) / 2
GAME_TOP    EQU 15    ; position under WELCOME art



SCREEN_WIDTH    EQU 120        ; you already have this

TITLE_WIDTH  EQU 52
TITLE_LEFT   EQU (SCREEN_WIDTH - TITLE_WIDTH) / 2   ; = 34
TITLE_TOP    EQU 5




.data

;------------------ MENU TEXT --------------------------------
menuTitle   BYTE "====== MAZE GAME MENU ======",0
menu1       BYTE "1. Start Game (Random Maze)",0
menu2       BYTE "2. Select Maze",0
menu3       BYTE "3. Exit",0
menuAsk     BYTE "Enter your choice: ",0

submenuTitle BYTE "Select Maze",0
submenu1     BYTE "1. Maze 1",0
submenu2     BYTE "2. Maze 2",0
submenuAsk   BYTE "Enter your choice: ",0

selectedMaze DWORD 0        ; 0=random, 1=maze1, 2=maze2

welcomeA1 BYTE "___  ___                _____                      ",0
welcomeA2 BYTE "|  \/  |               |  __ \                     ",0
welcomeA3 BYTE "| .  . | __ _ _______  | |  \/ __ _ _ __ ___   ___ ",0
welcomeA4 BYTE "| |\/| |/ _` |_  / _ \ | | __ / _` | '_ ` _ \ / _ \",0
welcomeA5 BYTE "| |  | | (_| |/ /  __/ | |_\ \ (_| | | | | | |  __/",0
welcomeA6 BYTE "\_|  |_/\__,_/___\___|  \____/\__,_|_| |_| |_|\___|",0


title1 BYTE " _    _      _                          ",0
title2 BYTE "| |  | |    | |                         ",0
title3 BYTE "| |  | | ___| | ___ ___  _ __ ___   ___ ",0
title4 BYTE "| |/\\| |/ _ \\ |/ __/ _ \\| '_ ` _ \\ / _ \\",0
title5 BYTE "\\  /\\  /  __/ | (_| (_) | | | | | |  __/",0
title6 BYTE " \\/  \\/ \\___|_|\\___\\___/|_| |_| |_|\\___|",0








    youwin1 db " /$$     /$$ /$$$$$$  /$$   /$$       /$$      /$$ /$$$$$$ /$$   /$$", 0ah, 0
    youwin2 db "|  $$   /$$//$$__  $$| $$  | $$      | $$  /$ | $$|_  $$_/| $$$ | $$", 0ah, 0
    youwin3 db " \  $$ /$$/| $$  \ $$| $$  | $$      | $$ /$$$| $$  | $$  | $$$$| $$", 0ah, 0
    youwin4 db "  \  $$$$/ | $$  | $$| $$  | $$      | $$/$$ $$ $$  | $$  | $$ $$ $$", 0ah, 0
    youwin5 db "   \  $$/  | $$  | $$| $$  | $$      | $$$$_  $$$$  | $$  | $$  $$$$", 0ah, 0
    youwin6 db "    | $$   | $$  | $$| $$  | $$      | $$$/ \  $$$  | $$  | $$\  $$$", 0ah, 0
    youwin7 db "    | $$   |  $$$$$$/|  $$$$$$/      | $$/   \  $$ /$$$$$$| $$ \  $$", 0ah, 0
    youwin8 db "    |__/    \______/  \______/       |__/     \__/|______/|__/  \__/", 0ah, 0



;------------------ ACTIVE MAZE BUFFER -----------------------
maze BYTE TOTAL_CELLS DUP(?)

;------------------ MAZE 1 -----------------------------------
maze1  BYTE "##############################" ; row 0
       BYTE "#        #            #     T#" ; row 1
       BYTE "#  ####  #  #######   #  #####"; row 2
       BYTE "#     #     #     #      #   #"; row 3
       BYTE "### # ####### ### ###### # # #"; row 4
       BYTE "#   #       #   #      #   # #"; row 5
       BYTE "# ##### ### ### ###### ##### #"; row 6
       BYTE "#     #   #     #    #       #"; row 7
       BYTE "##### ### ####### ## #########"; row 8
       BYTE "#   #   #   #     ##        ##"; row 9
       BYTE "# # ### ### # ###### ###### ##"; row10
       BYTE "# #     #   #      #      #  #"; row11
       BYTE "# ####### ######## ######### #"; row12
       BYTE "#                            #"; row13
       BYTE "##############################"; row14

;------------------ MAZE 2 -----------------------------------
maze2  BYTE "##############################" ; row 0
       BYTE "#   T    #     ####    #     #"; row 1
       BYTE "#  ####  #  #######   #  #####"; row 2
       BYTE "#     #     #     #      #   #"; row 3
       BYTE "### # ####### ### ###### # # #"; row 4
       BYTE "#   #       #   #      #   # #"; row 5
       BYTE "# ##### ### ### ###### ##### #"; row 6
       BYTE "#     #   #     #    #       #"; row 7
       BYTE "##### ### ####### ## #########"; row 8
       BYTE "#   #   #   #     ##        ##"; row 9
       BYTE "# # ### ### # ###### ###### ##"; row10
       BYTE "# #     #   #      #      #  #"; row11
       BYTE "# ####### ######## ######### #"; row12
       BYTE "#                            #"; row13
       BYTE "##############################"; row14

;------------------ GAME VARIABLES ---------------------------
playerX     SDWORD 2      ; maze coords
playerY     SDWORD 13
newX        SDWORD ?
newY        SDWORD ?
tickCount   DWORD  0

instructions BYTE "Use arrow keys to move. ESC to quit.",0
movesLabel   BYTE "Moves: ",0
winMsg BYTE "🎉 YOU WIN! 🎉",0


.code

PrintTitleArt PROC
    pushad

    mov eax, 11                ; light cyan
    call SetTextColor

    ; line 1
    mov dl, TITLE_LEFT
    mov dh, TITLE_TOP
    call Gotoxy
    mov edx, OFFSET title1
    call WriteString

    ; line 2
    mov dl, TITLE_LEFT
    mov dh, TITLE_TOP+1
    call Gotoxy
    mov edx, OFFSET title2
    call WriteString

    ; line 3
    mov dl, TITLE_LEFT
    mov dh, TITLE_TOP+2
    call Gotoxy
    mov edx, OFFSET title3
    call WriteString

    ; line 4
    mov dl, TITLE_LEFT
    mov dh, TITLE_TOP+3
    call Gotoxy
    mov edx, OFFSET title4
    call WriteString

    ; line 5
    mov dl, TITLE_LEFT
    mov dh, TITLE_TOP+4
    call Gotoxy
    mov edx, OFFSET title5
    call WriteString

    ; line 6
    mov dl, TITLE_LEFT
    mov dh, TITLE_TOP+5
    call Gotoxy
    mov edx, OFFSET title6
    call WriteString

    popad
    ret
PrintTitleArt ENDP

 

        

  
PrintWelcomeArt PROC
    pushad

    mov eax, 11            ; light cyan
    call SetTextColor

    ; line 1
    mov dl, WELCOME_LEFT
    mov dh, WELCOME_TOP
    call Gotoxy
    mov edx, OFFSET welcomeA1
    call WriteString

    ; line 2
    mov dl, WELCOME_LEFT
    mov dh, WELCOME_TOP+1
    call Gotoxy
    mov edx, OFFSET welcomeA2
    call WriteString

    ; line 3
    mov dl, WELCOME_LEFT
    mov dh, WELCOME_TOP+2
    call Gotoxy
    mov edx, OFFSET welcomeA3
    call WriteString

    ; line 4
    mov dl, WELCOME_LEFT
    mov dh, WELCOME_TOP+3
    call Gotoxy
    mov edx, OFFSET welcomeA4
    call WriteString

    ; line 5
    mov dl, WELCOME_LEFT
    mov dh, WELCOME_TOP+4
    call Gotoxy
    mov edx, OFFSET welcomeA5
    call WriteString

    ; line 6
    mov dl, WELCOME_LEFT
    mov dh, WELCOME_TOP+5
    call Gotoxy
    mov edx, OFFSET welcomeA6
    call WriteString

    popad
    ret
PrintWelcomeArt ENDP






;==============================================================
; ShowMenu  -- main menu (centered)
;==============================================================
ShowMenu PROC
    call Clrscr

    mov eax, 11               ; light cyan
    call SetTextColor

    ; title
    mov dl, MENU_LEFT
    mov dh, MENU_TOP
    call Gotoxy
    mov edx, OFFSET menuTitle
    call WriteString

    ; option 1
    mov dh, MENU_TOP+2
    mov dl, MENU_LEFT
    call Gotoxy
    mov edx, OFFSET menu1
    call WriteString

    ; option 2
    mov dh, MENU_TOP+3
    mov dl, MENU_LEFT
    call Gotoxy
    mov edx, OFFSET menu2
    call WriteString

    ; option 3
    mov dh, MENU_TOP+4
    mov dl, MENU_LEFT
    call Gotoxy
    mov edx, OFFSET menu3
    call WriteString

    ; ask
    mov dh, MENU_TOP+6
    mov dl, MENU_LEFT
    call Gotoxy
    mov edx, OFFSET menuAsk
    call WriteString

    call ReadInt              ; result in EAX
    ret
ShowMenu ENDP

;==============================================================
; SelectMaze  -- submenu to choose maze 1 or 2
;==============================================================
SelectMaze PROC
    call Clrscr

    mov eax, 11
    call SetTextColor

    ; title
    mov dl, MENU_LEFT
    mov dh, MENU_TOP
    call Gotoxy
    mov edx, OFFSET submenuTitle
    call WriteString

    ; maze 1
    mov dh, MENU_TOP+2
    mov dl, MENU_LEFT
    call Gotoxy
    mov edx, OFFSET submenu1
    call WriteString

    ; maze 2
    mov dh, MENU_TOP+3
    mov dl, MENU_LEFT
    call Gotoxy
    mov edx, OFFSET submenu2
    call WriteString

    ; ask
    mov dh, MENU_TOP+5
    mov dl, MENU_LEFT
    call Gotoxy
    mov edx, OFFSET submenuAsk
    call WriteString

    call ReadInt

    cmp eax, 1
    je Maze1Sel
    cmp eax, 2
    je Maze2Sel
    ret                       ; invalid -> leave selection unchanged

Maze1Sel:
    mov selectedMaze, 1
    ret

Maze2Sel:
    mov selectedMaze, 2
    ret
SelectMaze ENDP

;==============================================================
; SetupMaze  -- copy selected or random maze into 'maze'
;==============================================================
SetupMaze PROC
    pushad

    ; if selectedMaze = 1 or 2, use that; else random
    mov eax, selectedMaze
    cmp eax, 1
    je UseMaze1
    cmp eax, 2
    je UseMaze2

    ; random between maze1 and maze2
    call Randomize
    mov eax, 2
    call RandomRange          ; 0 or 1
    cmp eax, 0
    je UseMaze1
    jmp UseMaze2

UseMaze1:
    mov esi, OFFSET maze1
    jmp CopyMaze

UseMaze2:
    mov esi, OFFSET maze2

CopyMaze:
    mov edi, OFFSET maze
    mov ecx, TOTAL_CELLS
    rep movsb

    popad
    ret
SetupMaze ENDP

;==============================================================
; DrawMaze  -- SIMPLE version: centered, no per-cell colors
;==============================================================
DrawMaze PROC
    pushad

    mov esi, OFFSET maze      ; source
    mov ebx, 0                ; row index

RowLoop:
    mov ecx, 0                ; column index

ColLoop:
    ; screen X = MAZE_LEFT + column (ECX)
    mov eax, ecx
    add eax, MAZE_LEFT
    mov dl, al

    ; screen Y = MAZE_TOP + row (EBX)
    mov eax, ebx
    add eax, MAZE_TOP
    mov dh, al

    call Gotoxy

    mov al, [esi]
    call WriteChar

    inc esi
    inc ecx
    cmp ecx, MAZE_COLS
    jl  ColLoop

    inc ebx
    cmp ebx, MAZE_ROWS
    jl  RowLoop

    popad
    ret
DrawMaze ENDP

;==============================================================
; DrawPlayer  -- draw 'B' at playerX,playerY in yellow
;==============================================================
DrawPlayer PROC
    pushad

    ; x coordinate = MAZE_LEFT + playerX
    mov eax, playerX
    add eax, MAZE_LEFT
    mov dl, al

    ; y coordinate = MAZE_TOP + playerY
    mov eax, playerY
    add eax, MAZE_TOP
    mov dh, al

    call Gotoxy

    mov eax, 14               ; yellow
    call SetTextColor

    mov al, 'B'
    call WriteChar

    popad
    ret
DrawPlayer ENDP

;==============================================================
; ErasePlayer  -- draw space at player position
;==============================================================
ErasePlayer PROC
    pushad

    mov eax, playerX
    add eax, MAZE_LEFT
    mov dl, al

    mov eax, playerY
    add eax, MAZE_TOP
    mov dh, al

    call Gotoxy

    mov eax, 7
    call SetTextColor

    mov al, ' '
    call WriteChar

    popad
    ret
ErasePlayer ENDP

;==============================================================
; GetCellChar
; IN:  EAX = x, EBX = y (maze coordinates)
; OUT: AL  = character at maze[y][x]
;==============================================================
GetCellChar PROC
    push esi
    push edx

    mov edx, ebx
    imul edx, MAZE_COLS       ; y * MAZE_COLS
    add edx, eax              ; + x
    mov esi, OFFSET maze
    mov al, [esi + edx]

    pop edx
    pop esi
    ret
GetCellChar ENDP

;==============================================================
; WinScreen  -- show win message + number of moves
;==============================================================

WinScreen PROC
    call clrscr

        mov eax, yellow (black*16)
        call settextcolor

        mov dl, 34-8
        mov dh, 6-1
        call gotoxy

        mov edx, offset youwin1
        call writestring

        mov dl, 34-8
        mov dh, 7-1
        call gotoxy

        mov eax, 100
        call delay

        mov edx, offset youwin2
        call writestring

        mov dl, 34-8
        mov dh, 8-1
        call gotoxy

        mov eax, 100
        call delay

        mov edx, offset youwin3
        call writestring

        mov dl, 34-8
        mov dh, 9-1
        call gotoxy

        mov eax, 100
        call delay

        mov edx, offset youwin4
        call writestring

        mov dl, 34-8
        mov dh, 10-1
        call gotoxy

        mov eax, 100
        call delay

        mov edx, offset youwin5
        call writestring

        mov dl, 34-8
        mov dh, 11-1
        call gotoxy

        mov eax, 100
        call delay

        mov edx, offset youwin6
        call writestring

        mov dl, 34-8
        mov dh, 12-1
        call gotoxy

        mov eax, 100
        call delay

        mov edx, offset youwin7
        call writestring

        mov eax, white
        call settextcolor

        mov dl, 47
        mov dh, 16
        call gotoxy

        mov eax, 100
        call delay

            mov eax, 10              ; light green
    call SetTextColor

    ; --- Centered Position (X = 40, Y = 15) ---
    mov dl, 40
    mov dh, 15
    call Gotoxy

    ; Print moves
    mov dl, 40
    mov dh, 17
    call Gotoxy

    mov edx, OFFSET movesLabel
    call WriteString

    mov eax, tickCount
    call WriteDec

    ; Pause
    call Crlf
    call WaitMsg

    ret
WinScreen ENDP


;==============================================================
; MAIN + GAME LOOP
;==============================================================
main PROC
call PrintTitleArt
call PrintWelcomeArt
;your first banner

call crlf
call WaitMsg; ; THIS GAME banner

call Clrscr


MenuStart:
    call ShowMenu

    cmp eax, 1
    je StartRandom
    cmp eax, 2
    je StartSelect
    cmp eax, 3
    je QuitGame
    jmp MenuStart             ; invalid choice

StartRandom:
    mov selectedMaze, 0       ; random
    jmp StartGame

StartSelect:
    call SelectMaze
    jmp StartGame

;------------------ StartGame -------------------------------
StartGame:
    call Clrscr

    mov eax, 7
    call SetTextColor

    ; instructions
    mov dl, INSTR_COL
    mov dh, INSTR_ROW
    call Gotoxy
    mov edx, OFFSET instructions
    call WriteString

    ; moves label
    mov dl, MOVES_COL
    mov dh, MOVES_ROW
    call Gotoxy
    mov edx, OFFSET movesLabel
    call WriteString

    ; reset player & counter
    mov playerX, 2
    mov playerY, 13
    mov tickCount, 0

    ; setup maze & draw
    call SetupMaze
    call DrawMaze
    call DrawPlayer

;------------------ GameLoop -------------------------------
GameLoop:
    ; print moves
    mov eax, 13               ; light magenta
    call SetTextColor

    mov dl, MOVES_COL+7
    mov dh, MOVES_ROW
    call Gotoxy
    mov eax, tickCount
    call WriteDec

    ; read key
    call ReadKey              ; AL=ASCII, AH=scan

    cmp al, 27                ; ESC
    je QuitGame

    cmp ah, 72                ; Up
    je MoveUp
    cmp ah, 80                ; Down
    je MoveDown
    cmp ah, 75                ; Left
    je MoveLeft
    cmp ah, 77                ; Right
    je MoveRight

    jmp GameLoop              ; ignore others

;------------------ Movement -------------------------------
MoveUp:
    mov eax, playerX
    mov ebx, playerY
    dec ebx
    cmp ebx, 0
    jl  GameLoop

    mov newX, eax
    mov newY, ebx

    mov eax, newX
    mov ebx, newY
    call GetCellChar
    cmp al, '#'
    je GameLoop
    cmp al, 'T'
    je ReachedTarget

    call ErasePlayer
    mov eax, newX
    mov playerX, eax
    mov eax, newY
    mov playerY, eax
    inc tickCount
    call DrawPlayer
    jmp GameLoop

MoveDown:
    mov eax, playerX
    mov ebx, playerY
    inc ebx
    cmp ebx, MAZE_ROWS
    jge GameLoop

    mov newX, eax
    mov newY, ebx

    mov eax, newX
    mov ebx, newY
    call GetCellChar
    cmp al, '#'
    je GameLoop
    cmp al, 'T'
    je ReachedTarget

    call ErasePlayer
    mov eax, newX
    mov playerX, eax
    mov eax, newY
    mov playerY, eax
    inc tickCount
    call DrawPlayer
    jmp GameLoop

MoveLeft:
    mov eax, playerX
    mov ebx, playerY
    dec eax
    cmp eax, 0
    jl  GameLoop

    mov newX, eax
    mov newY, ebx

    mov eax, newX
    mov ebx, newY
    call GetCellChar
    cmp al, '#'
    je GameLoop
    cmp al, 'T'
    je ReachedTarget

    call ErasePlayer
    mov eax, newX
    mov playerX, eax
    mov eax, newY
    mov playerY, eax
    inc tickCount
    call DrawPlayer
    jmp GameLoop

MoveRight:
    mov eax, playerX
    mov ebx, playerY
    inc eax
    cmp eax, MAZE_COLS
    jge GameLoop

    mov newX, eax
    mov newY, ebx

    mov eax, newX
    mov ebx, newY
    call GetCellChar
    cmp al, '#'
    je GameLoop
    cmp al, 'T'
    je ReachedTarget

    call ErasePlayer
    mov eax, newX
    mov playerX, eax
    mov eax, newY
    mov playerY, eax
    inc tickCount
    call DrawPlayer
    jmp GameLoop

;------------------ Target reached -------------------------
ReachedTarget:
    call WinScreen
    jmp MenuStart            ; back to main menu

;------------------ Quit -----------------------------------
QuitGame:
    exit

main ENDP
END main
