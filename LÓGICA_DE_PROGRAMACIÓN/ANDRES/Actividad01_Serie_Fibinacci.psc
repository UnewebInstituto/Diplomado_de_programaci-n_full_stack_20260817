Algoritmo Actividad01_Serie_Fibonacci
	// Definicion de variables
	Definir n1 Como Real
	Definir n2 Como Real
	Definir n Como Entero
	Definir suma Como Real
	Definir i Como Entero
	Definir continuar  Como Caracter
	// Entrada de datos
	continuar <- "S"
	Mientras continuar == "S" O continuar =="s" Hacer
		Escribir '1er. Valor:'
		Leer n1
		Escribir '2do. Valor:'
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
		Escribir "Desea ingresar otros datos (S/N):?"
		Leer continuar
	FinMientras
	Escribir "Fin del Programa"
FinAlgoritmo

