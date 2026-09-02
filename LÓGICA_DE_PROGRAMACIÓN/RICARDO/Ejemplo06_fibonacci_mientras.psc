Algoritmo Ejemplo06_fibonacci_mientras
	// variables
	Definir n1 Como Real
	Definir n2 Como Real
	Definir n Como Entero
	Definir i Como Entero
	Definir suma Como Real
	// inicializacion
	n1 <- 0
	n2 <- 0
	n <- 0
	i <- 2
	suma <- 0
	// lectura
	Escribir 'Ingrese el valos del 1er numero de la serie:'
	Leer n1
	Escribir 'Ingrese el valos del 2do numero de la serie:'
	Leer n2
	Escribir 'Ingrese el numero de valores que tendra la serie:'
	Leer n
	Escribir n1
	Escribir n2
	Mientras i<n Hacer
		suma <- n1+n2
		Escribir suma
		n1 <- n2
		n2 <- suma
		i <- i+1
	FinMientras
FinAlgoritmo
