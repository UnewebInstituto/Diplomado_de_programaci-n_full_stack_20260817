Algoritmo Ejemplo12_Ciclo_anidado_repetir
	// declaración de variables
	Definir i Como Entero
	Definir j Como Entero
	Escribir 'Tabla de multiplicar'
	// Inicialización de variables
	i <- 1
	Repetir
		j <- 1
		Repetir
			Escribir convertiratexto(i)+'x'+convertiratexto(j)+' = '+convertiratexto(i*j)
			j <- j+1
			// FinMientras
		Hasta Que j==10
		i <- i+1
		Escribir ''
	Hasta Que i==10
FinAlgoritmo
