Algoritmo Ejercicio02
	
	Dimensionar edades(100)
	Definir i Como Entero
	Definir n Como Entero
	Definir continuar Como Cadena
	Definir suma Como Real
	Definir promedio Como Real
	// Modificación 1
	Definir j Como Entero
	Dimensionar  contador(4) 
	Dimensionar  etiqueta(4) 
	// 
	suma <- 0
	continuar <- 'S'
	n <- 0
	// Modificación 2
	etiqueta[0] <- "NIÑOS"
	etiqueta[1] <- "ADOLESCENTES"
	etiqueta[2] <- "ADULTOS"
	etiqueta[3] <- "ADULTOS MAYORES"
	
	contador[0] <- 0 // Cantidad de niños
	contador[1] <- 0 // Cantidad de adolescentes
	contador[2] <- 0 // Cantidad de adultos
	contador[3] <- 0 // Cantidad de adultos mayores
	
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
				contador[0] <- contador[0] + 1 // Contar niños
			SiNo
				Si edades[i]>=11 Y edades[i]<18 Entonces
					Escribir edades[i], ': Es un Adolescente'
					contador[1] <- contador[1] + 1 // Contar adolescentes
				SiNo
					Si edades[i]>=18 Y edades[i]<60 Entonces
						Escribir edades[i], ': Es un Adulto'
						contador[2] <- contador[2] + 1 // Contar adultos
					SiNo
						Si edades[i]>=60 Entonces
							Escribir edades[i], ': Es un Adulto Mayor'
							contador[3] <- contador[3] + 1 // Contar adultos mayores
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
		
		// Modificación 3
		Escribir "Cantidad de datos según la edades:"
		para j<-0 hasta 3 Con Paso 1 Hacer 
			Escribir etiqueta[j] + " : " + ConvertirATexto(contador[j])
		FinPara
		
		Escribir '¿Desea ingresar nuevos datos (S/N)?'
		Leer continuar
	FinMientras
	
	Escribir 'Fin del Programa'
FinAlgoritmo
