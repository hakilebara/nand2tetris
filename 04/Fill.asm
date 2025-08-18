// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.


(LOOP)
    // initialize n: black pixel counter
    @n
    M=0
    // initialize m : white pixel counter
    @m
    M=0
    // if (KBD > 0) goto BLACKSCREEN
    @KBD
    D=M
    @BLACKSCREEN
    D;JGT
    @LOOP
    0;JMP
(BLACKSCREEN)
    // if (KBD == 0) goto CLEARSCREEN
    @KBD
    D=M
    @CLEARSCREEN
    D;JEQ
    @n
    D=M
    @8191
    D=D-A
    @LOOP
    D;JGT
    // *(screen + n) = -1
    @n
    D=M
    @SCREEN
    A=D+A
    M=-1
    // n = n + 1
    @n
    M=M+1
    @BLACKSCREEN
    0;JMP
(CLEARSCREEN)
    // if (m > 8191) goto LOOP
    @m
    D=M
    @8191
    D=D-A
    @LOOP
    D;JGT
    // *(screen + m) = -1
    @m
    D=M
    @SCREEN
    A=D+A
    M=0
    // m = m + 1
    @m
    M=M+1
    @CLEARSCREEN
    0;JMP
