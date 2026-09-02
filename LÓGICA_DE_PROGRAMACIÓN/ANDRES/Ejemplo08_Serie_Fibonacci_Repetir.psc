Algoritmo Ejemplo08_Serie_Fibonacci_Repetir
	// Declaracion de variables
	Definir n1 Como Real
	Definir n2 Como Real
	Definir suma Como Real
	Definir i Como Entero
	Definir n Como Entero
	// Inicializacion de variables
	n1 <- 0
	n2 <- 0
	suma <- 0
	i <- 2
	n <- 0 // Se inicializa en dos porque se tienen n1 y n2
	Escribir 'Ingrese el primer valor:'
	Leer n1
	Escribir 'Ingrese el segundo valor:'
	Leer n2
	Escribir 'Ingrese el numero de valores que tendra la serie:'
	Leer n
	// Se escribe los dos primeros valores
	Escribir n1
	Escribir n2
	Repetir
		suma <- n1+n2
		Escribir suma
		n1 <- n2
		n2 <- suma
		i <- i+1
	Hasta Que i==n
FinAlgoritmo
