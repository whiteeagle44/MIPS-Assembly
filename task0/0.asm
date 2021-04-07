	.data
buf: 	.space 	256
   
	.text
main: 
   	la 	$a0, buf
   	li 	$a1, 256,
   	li 	$v0, 8
   	syscall
	
	la 	$t0, buf # load buffer adress into $t0

loop:
	lbu 	$t1, ($t0) # load first char into $t1
	beqz 	$t1 endloop  # if end of string, exit
	bltu 	$t1, 'a', else # char is not a small letter, start again
	bgtu 	$t1, 'z', else # --||--
	# at this point we have a small letter and need to replace it 
	# let's find the new value
	subu 	$t2, $t1, 32 
	sb	$t2, ($t0)
else:  	
	addiu 	$t0, $t0, 1
	j 	loop
		
endloop:
	la 	$a0, buf
	li 	$v0, 4
	syscall

	li 	$v0, 10
	syscall
