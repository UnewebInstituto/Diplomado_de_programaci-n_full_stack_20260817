Algoritmo Ejemplo12_Ciclo_Anidado_Repetir
	// variables
	Definir i Como Entero
	Definir j Como Entero
	// inicializacion
	i <- 1
	j <- 1
	// lectura
	Escribir 'Tabla de multiplicar'
	Repetir
		j <- 1
		Repetir
			Escribir ConvertirATexto(i)+' x ', ConvertirATexto(j)+' = ', ConvertirATexto(i*j)
			j <- j+1
		Hasta Que j==10
		i <- i+1
		Escribir ''
	Hasta Que i==10
FinAlgoritmo
