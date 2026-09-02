Algoritmo Ejemplo11_Ciclo_Anidado_Mientras
	// variables
	Definir i Como Entero
	Definir j Como Entero
	// inicializacion
	i <- 1
	j <- 1
	// lectura
	Escribir 'Tabla de multiplicar'
	Mientras i<10 Hacer
		j <- 1
		Mientras j<10 Hacer
			Escribir ConvertirATexto(i)+' x ', ConvertirATexto(j)+' = ', ConvertirATexto(i*j)
			j <- j+1
		FinMientras
		i <- i+1
		Escribir ''
	FinMientras
FinAlgoritmo
