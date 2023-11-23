// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

//R0 = 0
//@0
//D=A
//@R0
//M=D

//R1 = 2
//@2
//D=A
//@R1
//M=D

//R2 = 0
@0
D=A
@R2
M=D

// Initialize mask
@mask
M=1

//Initialize loop counter to zero
@counter
M=0

(MULTI_LOOP)
@mask
D=M
@R0
A=M
D=D&A

@MULTI_FINALLY
D;JEQ

//Add R1 to sum
@R1
D=M
@R2
M=D+M

(MULTI_FINALLY)
//increment counter
@counter
MD=M+1

//Exit if counter > 15
@16
D=D-A
@END
D;JEQ

// Shift R1 Left
@R1
D=M
M=D+M

// Shift mask left
@mask
D=M
M=D+M

@MULTI_LOOP
0;JMP

(END)
    @END
    0;JMP