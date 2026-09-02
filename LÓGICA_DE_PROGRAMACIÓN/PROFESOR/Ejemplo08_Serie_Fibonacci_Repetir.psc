Algoritmo Ejemplo08_Serie_Fibonacci_Repetir
	// Declaración de variables
	Definir n1 Como Real
	Definir n2 Como Real
	Definir suma Como Real
	Definir i Como Entero
	Definir n Como Entero
	// Inicialización de variables
	n1 <- 0
	n2 <- 0
	suma <- 0
	i <- 2
	n <- 0
	Escribir 'Ingrese el 1er. valor:' // Se inicializa en 2, porque se tienen n1 y n2
	Leer n1
	Escribir 'Ingrese el 2do. valor:'
	Leer n2
	Escribir 'Ingrese el número de valores que tendrá la serie:'
	Leer n
	// Se escribe los 2 primeros valores
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
