.data
Vector:	.word 53, 78, -51, 28, -38, 96, 30, 80, 89, 86, -31, -32, 82, -70, 5, 70, -69, -75, 96, -65, -67, -54, 40, 19, -87, -45, 35, -89, -78, 18, -53, 100, 10, 47, -8, -70, -82, 46, 97, -85, 43, 5, -74, -53, 95, -30, 4, 100, -20, 62, 68, -9, 17, -27, 55, -98, 12, -70, 14, 4, 97, 100, -97, 63, 96, -1, -30, 78, 6, 38, -24, -79, -47, -88, -57, 14, -44, 3, 70, -76, -68, 46, 95, -66, 83, -66, 90, -61, -2, 99, -61, -48, 39, -80, 27, -16, -52, -23, -75, 40 
Abscissa: .space 400
Ordinate: .space 400
Welcome: .asciiz  	"Solución parcial 2 Juan Pablo Bedoya - Valeria Granada \n"
MensajeCanNeg: .asciiz 	"La cantidad de números negativos en Vector es: "

		
.text

Main:
	li $v0,4
	la $a0,	Welcome
	syscall 	
	la $a0,Vector
	addi $sp,$sp, -4
	sw $s0, 0($sp)
	jal OrganizaVector	
	addi $s0, $v0, 0 		#Cantidad numeros negativos
	li $v0,4
	la $a0,	MensajeCanNeg
	syscall 
	li $v0,1
	add $a0,$zero,$s0
	syscall 
	jal SolucionPunto2
		
#-------------------------------------------------------------------------------------------------------------
# PUNTO 1
#-------------------------------------------------------------------------------------------------------------	
OrganizaVector:
	la $t5,Abscissa			#apuntando a la base del vector Abscissa
	addi $t0, $zero, 99 		#contador de iteraciones para recorrer Vector
	addi $t1, $zero, 0		#contador de negativos
	
Ciclo:
	beq $t0, $zero, FinCiclo	#Compara la iteración para saber cuando finalizar el cliclo		 
	lw $t3, 0($a0)			#almaceno en t3 el valor vector posicion i
	addi $t4,$zero,0
	slt $t4,$t3,$zero		#comparo si el num almacenado en t3 es menor que cero
	bne $t4,$zero, NumeroNegativo
	subi $t0,$t0, 1
	addi $a0,$a0,4	
	j Ciclo

NumeroNegativo:
	sw $t3, ($t5)
	addi $t5,$t5,4
	subi $t0,$t0,1			#disminuyo el contador
	addi $t1,$t1,1
	addi $a0,$a0,4	 		#contador de negativos aumenta
	j  Ciclo	
	
#-------------------------------------------------------------------------------------------------------------
# PUNTO 2
#------------------------------------------------------------------------------------------------------------- 
	
SolucionPunto2:
	la $t9,Ordinate			#base del vector Ordinate
	la $a0,Abscissa			#BAse del vector Abscissa
	addi $a1,$t1,0			#Tamanho Vector Abscissa
	add $t0, $zero, $t1 		#contador de iteraciones para recorrer Vector

Ciclo2:	
	beq $t0, $zero, FinCiclo2	#Compara la iteración para saber cuando finalizar el cliclo		 
	lw $t6, 0($a0)			#almaceno en t6 el valor vector posicion i
	add $t7,$t6,$t6			#Se multiplica con sumas
	add $t8,$t7,$t6
	addi $t8,$t8,100		# Se sum,a 100 al valor que hay en t8
	sw $t5,0($t9)			#se almacena valor en Ordinate
	subi $t0,$t0, 1
	addi $t9,$t9,4
	addi $a0,$a0,4		
	j Ciclo2

FinCiclo:
	lw $s0, 0($sp)
	addi $sp,$sp,4
	addi $v0,$t1,0
	jr $ra	
	
FinCiclo2:
	jr $ra		
	
Exit:
	li, $v0, 10
	syscall 

