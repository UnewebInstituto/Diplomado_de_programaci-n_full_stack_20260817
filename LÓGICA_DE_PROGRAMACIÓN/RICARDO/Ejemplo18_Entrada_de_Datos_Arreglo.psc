Algoritmo Ejemplo18_Entrada_de_datos_arreglo
	Dimensionar edades[100]
	Definir i Como Entero
	Definir n Como Entero
	Definir continuar Como Caracter
	continuar <- "S"
	n <- 0
	
	Mientras continuar == "S" o continuar == "s" Hacer
		Mientras n <= 0 o n>100 hacer
			Escribir "Ingrese la cantidad de valores a leer (máximo 100):"
			Leer n
			si n<=0 o n>100 Entonces
				Escribir "Error: cantidad no válida"
			FinSi
		FinMientras
		
		i <- 0
		Mientras i < n hacer
			Escribir "Ingrese la edad (lectura " + ConvertirATexto(i+1) + "):"
			leer edades[i]
			i <- i + 1
		FinMientras
		
		Escribir "¿Desea ingresar nuevos datos (S/N)?"
		Leer continuar
	FinMientras
FinAlgoritmo