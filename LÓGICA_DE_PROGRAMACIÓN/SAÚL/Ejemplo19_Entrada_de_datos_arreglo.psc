Algoritmo Ejemplo19_Entrada_de_datos_arreglo
	dimensionar edades[100]
	definir i Como Entero
	definir n Como Entero
	definir continuar Como Caracter
	continuar <- "S"
	n <- 0
	i <- 0 
	Mientras continuar == "S" o continuar == "s" Hacer
		Mientras n <= 0 o n>100 hacer
			
		Escribir "Ingrese la cantidad máximo cien(100)"
		leer n 
		si n>100 o n<0 Entonces
			Escribir "Error: Cantidad no válida"
		FinSi
	FinMientras
	i <- 0
	mientras i < n Hacer
		
	FinMientras
		Escribir "Ingrese la edad (lectura" +ConvertirATexto(i+1) + "):"
		leer edades[i]
	Escribir "¿Desea ingresar nuevos datos (S/N)?"
	Leer continuar
	FinMientras
	
FinAlgoritmo
