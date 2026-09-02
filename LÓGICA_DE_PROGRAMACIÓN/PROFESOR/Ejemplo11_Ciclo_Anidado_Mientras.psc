Algoritmo Ejemplo11_Ciclo_Anidado_Mientras
	// Declaración de variables
	Definir i Como Entero
	Definir j Como Entero
	Escribir 'Tabla de Multiplicar'
	// Inicialización de variables
	i <- 1
	Mientras i<10 Hacer
		j <- 1
		Mientras j<10 Hacer
			Escribir ConvertirATexto(i)+' x '+ConvertirATexto(j)+' = '+ConvertirATexto(i*j)
			j <- j+1
		FinMientras
		i <- i+1
		Escribir ''
	FinMientras
FinAlgoritmo
