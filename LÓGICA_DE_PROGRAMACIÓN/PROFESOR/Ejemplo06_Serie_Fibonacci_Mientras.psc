Algoritmo Ejemplo06_Serie_Fibonacci_Mientras
	// La serie Fibonacci, es una secuencia numérica, donde
	// el último valor obtenido, en la suma de los dos predecesores
	// Declaración de variables
	Definir n1 Como Real
	Definir n2 Como Real // 1er. número de la serie
	Definir n Como Entero // 2do. número de la serie
	Definir i Como Entero // Cantidad de valores a producir
	Definir suma Como Real // Variable contador
	// Inicialización de las variables
	n1 <- 0
	n2 <- 0
	n <- 0
	i <- 2
	suma <- 0 // Se inicializa en 2, porque se tiene la lectura de los 2 primeros números
	Escribir 'Ingrese el valor del 1er. número de la serie:'
	Leer n1
	Escribir 'Ingrese el valor del 2do. número de la serie:'
	Leer n2
	Escribir 'Ingrese el número de valores que tendrá la serie:'
	Leer n
	// Se escriben los dos primeros números de la serie
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
