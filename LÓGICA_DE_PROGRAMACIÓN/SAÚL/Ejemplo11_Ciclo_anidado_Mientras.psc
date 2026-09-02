Algoritmo Ejemplo11_Ciclo_anidado_Mientras
	// declaración de variables
	Definir i Como Entero
	Definir j Como Entero
	Escribir 'Tabla de multiplicar'
	// Inicialización de variables
	i <- 1
	Mientras i<10 Hacer
		j <- 1
		Mientras j<10 Hacer
			Escribir convertiratexto(i)+'x'+convertiratexto(j)+' = '+convertiratexto(i*j)
			j <- j+1
		FinMientras
		i <- i+1
		Escribir ''
	FinMientras
FinAlgoritmo
