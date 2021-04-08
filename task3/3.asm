	.data
buf: 	.space 256
   
	.text
main: 
   	la 	$a0, 	buf
   	li 	$a1, 	256,
   	li 	$v0, 	8
   	syscall
	
	la 	$t0, 	buf 		# buffer adress
	la 	$t3, 	buf 		# left
	la 	$t4, 	buf 		# right
	
iright:  # set right to point to last character 
	lbu	$t1, 	1($t4)
	bleu	$t1,	' ',	while
	addiu	$t4,	$t4,	1
	j 	iright

while: 
	beq	$t3, 	$t4	print
	lbu 	$t1, 	($t3)
	bltu	$t1,	'0'	left
	bgtu	$t1, 	'9'	left 	
	# left now points to a number
	
if2:    
	lbu	$t2, 	($t4)
	bltu	$t2,	'0'	right
	bgtu 	$t2, 	'9'	right
	# right now points to a number
	
	# swap values: 
	sb 	$t2, 	($t3)
	sb 	$t1, 	($t4)
	
	subiu	$t4, 	$t4, 	1 
	beq 	$t3, 	$t4	while # to prevent inf loop with adresses interchanging
	addiu	$t3, 	$t3, 	1
	j	while
	
right:  # decrease right pointer
	subiu 	$t4, 	$t4,	1
	j 	while
	
left:	# increase left pointer
	addiu 	$t3, 	$t3, 	1
	j	while 
	
print: 
	la $a0, buf
	li $v0, 4
	syscall

end:
	li 	$v0, 	10
	syscall
