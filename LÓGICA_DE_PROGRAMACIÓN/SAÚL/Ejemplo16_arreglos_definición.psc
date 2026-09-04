Algoritmo Ejemplo16_arreglos_definición
	//Declaracion de variables
	//
	definir i Como Entero
	definir n Como Entero
	
	Dimensionar A[7]
	A[0] <- 25
	A[1] <- 32
	A[2] <- -1
	A[3] <- 17
	A[4] <- 19
	A[5] <- 26
	A[6] <- 100
	n <- 7
	i <- 0
	
	Escribir "Recorrido mediante arreglo mientras"
	mientras i < 7
		escribir A[i]
		i <- i + 1
	FinMientras
	
	Escribir  " "
	escribir "Recorrido del arreglo mediante repetir"
	i <- 0
	Repetir
		escribir A[i]
		i <- i +1
	Hasta Que i > 6
	
	Escribir  " "
	escribir "Recorrido del arreglo mediante para"
	para i <- 0 con paso 1 Hasta 6
		Escribir  A[i]
	FinPara
FinAlgoritmo
