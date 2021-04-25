// Bubblesort
// The program sorts the array starting at the address in R16 with length specified in R17
// The sort is in ascending order - the smallest number at the start of the array
// ARRAY A -> ARRAY B
// Test: [1,5,2,13,7,11,3,6] -> [1,2,3,5,6,7,11,13]
// Base Address: B = RAM[16] = 100
// No. of Elems: N = RAM[17] = 8

// Set base index
@100
D=A
@B
M=D

// Set number of elements
@8
D=A
@N
M=D

// Set elements array A starting from RAM[100] since this is our base address
@1
D=A
@100
M=D

@5
D=A
@101
M=D

@2
D=A
@102
M=D

@13
D=A
@103
M=D

@7
D=A
@104
M=D

@11
D=A
@105
M=D

@3
D=A
@106
M=D

@6
D=A
@107
M=D

@outIndex     // init outer index
M=0

(OUTER)
	@N
	D=M
	@inIndex        // init the inner index
	M=D-1

(INNER)  	  		
	@B    
	D=M
	@inIndex
	A=D+M           // goes to address arr[inIndex]
	D=A-1          
	@firstaddress   // stores the address of arr[inIndex]
	M=D

	D=D+1           // goes to address arr[inIndex - 1]
	@secondaddress  // stores the address of arr[inIndex - 1]
	M=D

	@firstaddress
	A=M
	D=M               // get the value arr[inIndex]
	@secondaddress
	A=M
	D=D-M             // calc val (arr[inIndex] - arr[inIndex - 1])
	@SWAP
	D;JGT             // if(arr[inIndex] - arr[inIndex - 1]) > 0 then swap values

	@inIndex                 
	M=M-1             // inIndex = inIndex - 1
	D=M
	@outIndex
	D=D-M
	@INNER            // if (inIndex > outIndex) jump to inner loop
	D;JGT

	@outIndex               
	M=M+1	
	D=M
	@N                
	D=M-D
	@OUTER            // if (R14 - inIndex > 0) jump to outer loop
	D;JGT

	@END
	0;JMP



(SWAP)          	  // swaps arr[inIndex] and arr[inIndex-1]
	@firstaddress
	A=M
	D=M
	@firstvalue       // stores value of arr[inIndex]
	M=D

	@secondaddress
	A=M
	D=M
	@secondvalue       // stores the value of arr[inIndex-1]
	M=D

	@secondvalue       // stores the value of arr[inIndex-1] in arr[inIndex]
	D=M
	@firstaddress
	A=M
	M=D

	@firstvalue        // stores the value of arr[inIndex] in arr[inIndex-1]
	D=M
	@secondaddress
	A=M
	M=D
 
	@inIndex                 
	M=M-1          
	D=M
	@outIndex
	D=D-M
	@INNER              //if(inIndex - outIndex > 0) jump to INNER loop
	D;JGT

	@outIndex               
	M=M+1	   			
	D=M
	@N                
	D=M-D
	@OUTER              //if(length - outIndex > 0) jump to outer loop 
	D;JGT

(END)
	// Clear counters
	@18
	M=0
	@19
	M=0
	@20
	M=0
	@21
	M=0
	@22
	M=0
	@23
	M=0
			
	@EXIT
	0;JMP
	
(EXIT)
	@EXIT
	0;JMP
