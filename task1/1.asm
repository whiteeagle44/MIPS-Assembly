	.data
buf: 	.space 256
   
	.text
main: 
   	la 	$a0, buf
   	li 	$a1, 256,
   	li 	$v0, 8
   	syscall
	
	la 	$t0, buf # load buffer adress into $t0
	li 	$t3, '9'
	addu 	$t3, $t3, '0'
loop:
	lbu 	$t1, ($t0) # load first char into $t1
	beqz 	$t1 endloop  # if end of string, exit
	bltu 	$t1, '0', else # char is not a number, start again
	bgtu 	$t1, '9', else # --||--
	# at this point we have a number and need to replace it 
	# let's find the new value
	subu 	$t2, $t3, $t1 
	sb	$t2, ($t0)
else:  	
	addiu $t0, $t0, 1
	j loop
		
endloop:
	la $a0, buf
	li $v0, 4
	syscall

	li 	$v0, 10
	syscall
