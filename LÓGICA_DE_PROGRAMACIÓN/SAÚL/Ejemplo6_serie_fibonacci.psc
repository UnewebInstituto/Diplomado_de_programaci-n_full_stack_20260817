Algoritmo Ejemplo6_serie_fibonacci_mientras
	// La serie fibonacci, es una
	// secuencia numérica, donde el
	// último valor obtenido
	// es la suma de los predecesores
	// Declaración de variable
	Definir n1 Como Real
	Definir n2 Como Real // primer numero de la serie
	Definir n Como Entero // segundo numero de la serie
	Definir i Como Entero // cantidad de valores a producir
	Definir suma Como Real // Variable contador
	// Inicialización de las variables
	n1 <- 0
	n2 <- 0
	n <- 0
	i <- 2
	Escribir 'Ingrese el valor del primero numero de la serie:' // Se inicializa en 2 porque se tiene la lectura de los dos primeros números
	Leer n1
	Escribir 'Ingrese el valor del segundo numero de la serie:'
	Leer n2
	Escribir 'Ingrese el número de valores que tendrá la serie:'
	Leer n
	// Se escriben los primeros número de la serie
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
