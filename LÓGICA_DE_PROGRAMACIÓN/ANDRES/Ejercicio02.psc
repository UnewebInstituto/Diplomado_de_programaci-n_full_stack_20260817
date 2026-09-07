Algoritmo Ejercicio02
	
	Dimensionar edades(100)
	Definir i Como Entero
	Definir n Como Entero
	Definir continuar Como Cadena
	Definir suma Como Real
	Definir promedio Como Real
	suma <- 0
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
		
		// Validacion de edad
		i <- 0
		Mientras i<n Hacer
			Escribir 'Ingrese la edad (lectura '+ConvertirATexto(i+1)+'):'
			Leer edades[i]
			Mientras edades[i]<=0 O edades[i]>120 Hacer
				Escribir 'ERROR: Edad no valida'
				Escribir 'Ingrese la edad (lectura '+ConvertirATexto(i+1)+'):'
				Leer edades[i]
			FinMientras
			i <- i+1
		FinMientras
		
		// Asignacion de edad
		i <- 0
		Repetir
			Si edades[i]<11 Entonces
				Escribir edades[i], ': Es un nino'
			SiNo
				Si edades[i]>=11 Y edades[i]<18 Entonces
					Escribir edades[i], ': Es un Adolescente'
				SiNo
					Si edades[i]>=18 Y edades[i]<60 Entonces
						Escribir edades[i], ': Es un Adulto'
					SiNo
						Si edades[i]>=60 Entonces
							Escribir edades[i], ': Es un Adulto Mayor'
						FinSi
					FinSi
				FinSi
			FinSi
			i <- i+1
		Hasta Que i=n
		
		// Edad promedio
		Para i<-0 Hasta n-1 Con Paso 1 Hacer
			suma <- suma+edades[i]
		FinPara
		Si n>0 Entonces
			promedio <- suma/n
			Escribir ' La edad promedio es: ', promedio
		FinSi
		Escribir '¿Desea ingresar nuevos datos (S/N)?'
		Leer continuar
	FinMientras
	
	Escribir 'Fin del Programa'
FinAlgoritmo
