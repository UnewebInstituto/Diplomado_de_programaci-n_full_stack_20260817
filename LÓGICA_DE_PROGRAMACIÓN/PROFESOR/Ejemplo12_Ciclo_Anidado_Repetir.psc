Algoritmo Ejemplo12_Ciclo_Anidado_Repetir
	// Declaración de variables
	Definir i Como Entero
	Definir j Como Entero
	Escribir 'Tabla de Multiplicar'
	// Inicialización de variables
	i <- 1
	// Mientras i<10 Hacer
	Repetir
		j <- 1
		// Mientras j<10 Hacer
		Repetir
			Escribir ConvertirATexto(i)+' x '+ConvertirATexto(j)+' = '+ConvertirATexto(i*j)
			j <- j+1
			// FinMientras
		Hasta Que j==10
		i <- i+1
		Escribir ''
		// FinMientras
	Hasta Que i==10
FinAlgoritmo
