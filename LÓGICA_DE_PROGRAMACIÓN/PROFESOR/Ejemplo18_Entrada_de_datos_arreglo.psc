Algoritmo Ejemplo18_Entrada_de_datos_arreglo
	Dimensionar edades(100)
	Definir i Como Entero
	Definir n Como Entero
	Definir continuar Como Cadena
	continuar <- 'S'
	n <- 0
	Mientras continuar=='S' O continuar=='s' Hacer
		Mientras n<=0 O n>100 Hacer
			Escribir 'Ingrese la cantidad de valores a leer (máximo 100):'
			Leer n
			Si n<=0 O n>100 Entonces
				Escribir 'Error: cantidad no válida'
			FinSi
		FinMientras
		i <- 0
		Mientras i<n Hacer
			Escribir 'Ingrese la edad (lectura '+ConvertirATexto(i+1)+'):'
			Leer edades[i]
			i <- i+1
		FinMientras
		Escribir '¿Desea ingresar nuevos datos (S/N)?'
		Leer continuar
	FinMientras
FinAlgoritmo
