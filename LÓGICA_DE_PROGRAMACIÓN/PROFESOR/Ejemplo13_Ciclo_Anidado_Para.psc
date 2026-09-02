Algoritmo Ejemplo13_Ciclo_Anidado_Para
	// Declaración de variables
	Definir i Como Entero
	Definir j Como Entero
	Escribir 'Tabla de Multiplicar'
	// Inicialización de variables
	// i <- 1
	// Mientras i<10 Hacer
	// Repetir
	Para i<-1 Hasta 9 Con Paso 1 Hacer
		// j <- 1
		// Mientras j<10 Hacer
		// Repetir
		Para j<-1 Hasta 9 Con Paso 1 Hacer
			Escribir ConvertirATexto(i)+' x '+ConvertirATexto(j)+' = '+ConvertirATexto(i*j)
			// j <- j+1
			// FinMientras
			// Hasta Que j==10
			// i <- i+1
		FinPara
		Escribir ''
		// FinMientras
		// Hasta Que i==10
	FinPara
FinAlgoritmo
