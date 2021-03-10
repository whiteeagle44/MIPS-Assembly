.data
input: .space 256
   
.text
main: 
   	la $a0, input
   	li $a1, 256,
   	li $v0, 8
   	syscall

	la $t0, input
loop:
	lbu $t1, ($t0)
	beqz $t1 endloop
	blt $t1, '0', loop
	bgt $t1, '9', loop
	subu $t2, $t2, $t2 
	addi $t2, $t2, '9'
	addi $t2, $t2, '0'
	lbu $t1, $t2 
	lbu $t0, $t1
	addi $t0, 1
	
endloop: