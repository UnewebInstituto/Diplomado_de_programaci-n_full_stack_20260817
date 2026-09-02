Algoritmo Ejemplo8_serie_fibonacci_repetir
	// Declaración de variables
	Definir n1 Como Real
	Definir n2 Como Real
	Definir suma Como Real
	Definir i Como Entero
	Definir n Como Entero
	// Inicialización de variables
	ni <- 0
	n2 <- 0
	suma <- 0
	i <- 2
	n <- 0 // Se inicializa en 2 porqeu se obtienen los dos primero valores, o sea, n1 y n2.
	Escribir 'Ingrese el primer valor'
	Leer n1
	Escribir 'Ingrese el segundo valor'
	Leer n2
	Escribir 'Cantidad de valores que tendrá la serie'
	Leer n
	// Se escriben los 2 primeros valores
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
