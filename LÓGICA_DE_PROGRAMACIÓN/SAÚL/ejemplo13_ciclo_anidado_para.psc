Algoritmo Ejemplo13_Ciclo_anidado_para
	// declaración de variables
	Definir i Como Entero
	Definir j Como Entero
	Escribir 'Tabla de multiplicar'
	// Inicialización de variables
	// i <- 1
	// Repetir
	Para i<-1 Hasta 9 Con Paso 1 Hacer
		// j <- 1
		// Repetir
		Para j<-1 Hasta 9 Con Paso 1 Hacer
			Escribir convertiratexto(i)+'x'+convertiratexto(j)+' = '+convertiratexto(i*j)
			// j <- j+1
			// FinMientras
			// Hasta Que j==10
			// i <- i+1
		FinPara
		Escribir ''
		// Hasta Que i==10
	FinPara
FinAlgoritmo
