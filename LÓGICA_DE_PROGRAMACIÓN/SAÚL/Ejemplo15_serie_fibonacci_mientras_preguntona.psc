Algoritmo Ejemplo15_serie_fibonacci_mientras_preguntona
	// La serie fibonacci, es una
	// secuencia numérica, donde el
	// último valor obtenido
	// es la suma de los predecesores
	
	// Declaración de variables
	Definir n1 Como Real
	Definir n2 Como Real // primer numero de la serie
	Definir n Como Entero // segundo numero de la serie
	Definir i Como Entero // cantidad de valores a producir
	Definir suma Como Real // Variable acumuladora
	Definir respuesta Como Cadena // Controla si se repite el algoritmo
	
	respuesta <- 's'
	
	Mientras respuesta = 's' O respuesta = 'S' Hacer
		// Inicialización / reinicio de variables para cada serie
		n1 <- 0
		n2 <- 0
		n <- 0
		i <- 2 // Se inicializa en 2 porque se tiene la lectura de los dos primeros números
		
		Escribir 'Ingrese el valor del primero numero de la serie:'
		Leer n1
		Escribir 'Ingrese el valor del segundo numero de la serie:'
		Leer n2
		Escribir 'Ingrese el número de valores que tendrá la serie:'
		Leer n
		
		// Se escriben los primeros números de la serie
		Escribir n1
		Escribir n2
		
		Mientras i < n Hacer
			suma <- n1+n2
			Escribir suma
			n1 <- n2
			n2 <- suma
			i <- i+1
		FinMientras
		
		// Pregunta para decidir si continuar
		Escribir '¿Desea realizar otra serie Fibonacci? (s/n):'
		Leer respuesta
	FinMientras
	
	Escribir 'Programa finalizado.'
FinAlgoritmo