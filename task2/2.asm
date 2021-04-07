	.data
buf: 	.space 256
   
	.text
main: 
   	la 	$a0, 	buf
   	li 	$a1, 	256,
   	li 	$v0, 	8
   	syscall
	
	la 	$t0, 	buf 		# buffer adress
	li 	$t3, 	0 		# current size
	li 	$t4, 	0 		# max size
	li 	$t5, 	0 		# start
	li 	$t6, 	0 		# end

loop:
	lbu 	$t1, 	($t0) 		# load first char into $t1
	beqz 	$t1 	endloop  	# if end of string, exit
	bltu 	$t1, 	'0', 	else	# char is not a number, skip incrementing current size
	bgtu 	$t1, 	'9', 	else	# --||--
	# at this point we have a number  
	addiu 	$t3,	$t3, 	1	# increment current size
        	addiu 	$t0, 	$t0, 	1	# increment buffer adress
        	j 	loop
else:  	
	addiu 	$t0, 	$t0,	1	# --||--
	bleu	$t3,	$t4  	loop	# if current size <= max size loop
	move	$t4, 	$t3		# current size = max size
	move 	$t6, 	$t0		# set end address
	subu 	$t5, 	$t6,	$t3	# set start address
 	li	$t3, 	0		# reset current size
	j loop
		

endloop:
	# start and end adress are 1 too big
	# decrement the above by 1
	subu	$t5, 	$t5,	1	
	subu	$t6, 	$t6, 	1
	
print:
	bgeu	$t5,	$t6, 	end 	
	lbu 	$a0, 	($t5)
	li	$v0, 	11
	syscall
	addiu 	$t5, 	$t5, 	1
 	j 	print

end:
	li 	$v0, 	10
	syscall
