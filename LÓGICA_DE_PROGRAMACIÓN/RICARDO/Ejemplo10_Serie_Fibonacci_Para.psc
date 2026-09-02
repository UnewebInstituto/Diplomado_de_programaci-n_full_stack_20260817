Algoritmo Ejemplo10_Serie_Fibonacci_Para
	// variables
	Definir n1 Como Real
	Definir n2 Como Real
	Definir n Como Entero
	Definir i Como Entero
	Definir cuma Como Real
	// inicializacion
	// lectura
	Escribir '1er valor:'
	Leer n1
	Escribir '2do valor:'
	Leer n2
	Escribir 'Cantidad de valores en la serie:'
	Leer n
	Escribir n1
	Escribir n2
	Para i<-2 Hasta n-1 Con Paso 1 Hacer
		suma <- n1+n2
		Escribir suma
		n1 <- n2
		n2 <- suma
	FinPara
FinAlgoritmo
