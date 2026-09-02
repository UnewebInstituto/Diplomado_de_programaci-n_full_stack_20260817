Algoritmo Ejemplo06_Serie_Fibonacci_Mientras
	// La serie Fibonacci, es una secuencia numerica, donde
	// el ultimo calor obtenido, en la suma de los dos predecesoes
	// Deckaracuin de variables
	Definir n1 Como Real
	Definir n2 Como Real
	Definir n Como Entero // 1er. bumero de la serie
	Definir i Como Entero // 2do. numero de la serie
	Definir suma Como Real // Cantidad de valores a producir
	// Inicializacion de las variables
	n1 <- 0 // Variable contador
	n2 <- 0
	n <- 0
	i <- 2
	Escribir 'Ingrese el valor del 1er. numero de la serie:'
	Leer n1 // Se inicializa en dos porque se tiene la lectura de los 2 primeros numeros
	Escribir 'Ingrese el valor del 2do. numero de la serie:'
	Leer n2
	Escribir 'Ingrese el numero de valores que tendra la serie:'
	Leer n
	// Se escriben los dos primeros numeros de la serie
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
