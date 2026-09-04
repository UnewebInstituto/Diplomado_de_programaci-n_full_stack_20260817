Algoritmo EJEMPLO15_ARREGLOS_DEFINICION
	// Declaración de variables
	Definir i Como Entero
	Definir n Como Entero
	// Declaración de la estructura de datos arreglo
	Dimensionar A(7)
	// Inicialización del arreglos con valores
	A[0] <- 25
	A[1] <- 32
	A[2] <- -1
	A[3] <- 17
	A[4] <- 19
	A[5] <- 26
	A[6] <- 100
	n <- 7
	i <- 0
	// Recorrido del contenido del arreglo
	Escribir 'Recorrido del arreglo mediante Mientras'
	Mientras i<7 Hacer
		Escribir A[i]
		i <- i+1
	FinMientras
	Escribir ' '
	Escribir 'Recorrido del arreglo mediante Repetir'
	i <- 0
	Repetir
		Escribir A[i]
		i <- i+1
	Hasta Que i>6
	Escribir ' '
	Escribir 'Recorrido del arreglo mediante Para'
	Para i<-0 Hasta 6 Con Paso 1 Hacer
		Escribir A[i]
	FinPara
FinAlgoritmo
