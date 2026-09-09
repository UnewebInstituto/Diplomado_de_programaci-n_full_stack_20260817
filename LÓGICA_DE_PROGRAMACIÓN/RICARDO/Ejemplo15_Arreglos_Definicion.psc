Algoritmo Ejercicio15_Arreglos_Definicion
	// variables
	Definir i Como Entero
	Definir n Como Entero
	Dimensionar a(7)
	// inicializacion
	a[0] <- 25
	a[1] <- 32
	a[2] <- -1
	a[3] <- 17
	a[4] <- 19
	a[5] <- 26
	a[6] <- 100
	i <- 0
	n <- 7
	// lectura
	Mientras i<7 Hacer
		Escribir a[i]
		i <- i+1
	FinMientras
	Escribir ' '
	Escribir 'Recorrido del arreglo mediante Repetir'
	i <- 0
	Repetir
		Escribir a[i]
		i <- i+1
	Hasta Que i>6
	Escribir ' '
	Escribir 'Recorrido del arreglo mediante Para'
	Para i<-0 Hasta 6 Hacer
		Escribir a[i]
	FinPara
FinAlgoritmo
