función resumen(categorias, conteo, totalPersonas, promedio)
	Definir i Como Entero
	Definir porcentaje Como Real
	
	Escribir ''
	Escribir ' Resultados'
	Escribir 'El Promedio de las edades ingresadas es: ', promedio, ' Años'
	Escribir 'C aracteriticas'
	
	Para i <- 0 Hasta 3 Con Paso 1 Hacer
		Si totalPersonas > 0 Entonces
			porcentaje <- (conteo[i] / totalPersonas) * 100
		SiNo
			porcentaje <- 0
		FinSi
		Escribir categorias[i], ': ', conteo[i], ' persona(s) (', porcentaje, '%)'
	FinPara
	Escribir 'Registros: ', totalPersonas, ' (100%)'
FinFuncion


// Subproceso para generar el gráfico de barras por categoría
funcion grafico(categorias, conteo, totalPersonas)
	Definir i, j Como Entero
	Definir frecuenciaRelativa Como Real
	Definir frecuenciaSimple Como Entero
	Definir barra Como Cadena
	
	Escribir ''
	Escribir 'Resultados en barra (aproxima)'
	Para i <- 0 Hasta 3 Con Paso 1 Hacer
		Escribir categorias[i]
		
		Si totalPersonas > 0 Entonces
			frecuenciaRelativa <- (conteo[i] / totalPersonas) * 10
			frecuenciaSimple <- Redon(frecuenciaRelativa)
		SiNo
			frecuenciaSimple <- 0
		FinSi
		
		barra <- ''
		Si frecuenciaSimple > 0 Entonces
			Para j <- 1 Hasta frecuenciaSimple Con Paso 1 Hacer
				barra <- barra + '*'
			FinPara
		FinSi
		
		Escribir barra, ' (', conteo[i], ')'
	FinPara
FinFuncion


Algoritmo Actividad_Final_Porcentajes_Y_Graficos
	
	Definir edades, conteo Como Entero
	Definir categorias Como Cadena
	Definir i, n Como Entero
	Definir SumaEdades Como Entero
	Definir promedio Como Real
	Definir continuar Como Cadena
	
	
	Dimension edades[120]
	Dimension categorias[4]
	Dimension conteo[4]
	
	
	categorias[0] <- 'Niños (0-10 años)'
	categorias[1] <- 'Adolescentes (11-17 años)'
	categorias[2] <- 'Adultos (18-59 años)'
	categorias[3] <- 'Adultos Mayores (60+ años)'
	
	continuar <- 'S'
	
	Mientras continuar == 'S' o continuar == 's' Hacer
		
		n <- 0
		SumaEdades <- 0
		promedio <- 0
		
		Para i <- 0 Hasta 3 Con Paso 1 Hacer
			conteo[i] <- 0
		FinPara
		
		
		Mientras n <= 0 o n > 120 Hacer
			Escribir 'Ingrese la cantidad de valores a leer (máximo 120):'
			Leer n
			Si n <= 0 o n > 120 Entonces
				Escribir 'ERROR: cantidad no válida. Ingrese nuevamente.'
			FinSi
		FinMientras
		
		
		i <- 0
		Mientras i < n Hacer
			Escribir 'Ingrese la edad (lectura ' + ConvertirATexto(i + 1) + '):'
			Leer edades[i]
			
			Si edades[i] < 0 o edades[i] > 120 Entonces
				Escribir 'ERROR: Edad fuera de rango. Ingrese nuevamente.'
				Escribir '(Rango válido: 0 a 120 años)'
			SiNo
				SumaEdades <- SumaEdades + edades[i]
				
				
				Si edades[i] <= 11 Entonces
					conteo[0] <- conteo[0] + 1
				SiNo
					Si edades[i] <= 18 Entonces
						conteo[1] <- conteo[1] + 1
					SiNo
						Si edades[i] <= 60 Entonces
							conteo[2] <- conteo[2] + 1
						SiNo
							conteo[3] <- conteo[3] + 1
						FinSi
					FinSi
				FinSi
				
				i <- i + 1
			FinSi
		FinMientras
		
		
		promedio <- SumaEdades / n
		
		
		resumen(categorias, conteo, n, promedio)
		grafico(categorias, conteo, n)
		
		
		Escribir ''
		Escribir '¿Desea ingresar nuevos datos (S/N)?:'
		Leer continuar
	FinMientras
	
	Escribir ''
	Escribir 'Fin del programa.    :D'
FinAlgoritmo