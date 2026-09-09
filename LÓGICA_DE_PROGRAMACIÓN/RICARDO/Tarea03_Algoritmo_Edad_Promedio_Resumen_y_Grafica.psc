Funcion resumen(argLenguajes, argPuntos, argEncuestas)
	Definir i Como Entero
	Escribir "Resumen de datos ingresados"
	Si argEncuestas > 0 Entonces
		Para i <- 0 Con Paso 1 Hasta 3 Hacer
			Escribir argLenguajes[i] + " : " + ConvertirATexto(argPuntos[i]) + "   " + ConvertirATexto(argPuntos[i]/argEncuestas*100) + " %"
		FinPara
		Escribir 'TOTAL.........:' + " : " + ConvertirATexto(argEncuestas) + "   " + '100 %'
	SiNo
		Escribir "No se ingresaron datos para calcular resumen."
	FinSi
FinFuncion

Funcion grafico(argLenguajes, argPuntos, argEncuestas)
	Definir i Como Entero
	Definir j Como Entero
	Definir barra Como Caracter
	Definir frecuenciaRelativa Como Real
	Definir frecuenciaSimple Como Entero
	
	Escribir "Grafico de datos ingresados"
	Si argEncuestas > 0 Entonces
		Para i <- 0 Con Paso 1 Hasta 3 Hacer
			frecuenciaRelativa <- (argPuntos[i] / argEncuestas) * 10
			frecuenciaSimple <- Redon(frecuenciaRelativa)
			barra <- argLenguajes[i] + ' '
			Para j <- 0 Con Paso 1 Hasta frecuenciaSimple - 1 Hacer
				barra <- barra + '*'
			FinPara
			Escribir barra
		FinPara
	SiNo
		Escribir "No se ingresaron datos para mostrar el grafico."
	FinSi
FinFuncion

Algoritmo Tarea03_Algoritmo_Edad_Promedio_Resumen_y_Grafica
	// Dimensiones
	Dimensionar edades[100]
	Dimensionar categorias[4]
	Dimensionar puntos[4]
	
	// Variables
	Definir i Como Entero
	Definir n Como Entero
	Definir SumaEdades Como Entero
	Definir Promedio Como Real
	Definir Continuar Como Cadena
	
	categorias[0] <- "NIÑOS............"
	categorias[1] <- "ADOLESCENTES....."
	categorias[2] <- "ADULTOS.........."
	categorias[3] <- "ADULTOS MAYORES.."
	
	continuar <- "S"
	//Lectura
	Mientras continuar == "S" o continuar == "s" Hacer
		n <- 0
		SumaEdades <- 0
		promedio <- 0
		
		Para i <- 0 Con Paso 1 Hasta 3 Hacer
			puntos[i] <- 0
		FinPara
		
		Mientras n <= 0 o n > 100 Hacer
			Escribir "Ingrese la cantidad de valores a leer (maximo 100):"
			Leer n
			Si n <= 0 o n > 100 Entonces
				Escribir "ERROR: cantidad no valida. Ingrese nuevamente"
			FinSi
		FinMientras
		
		i <- 0
		Mientras i < n Hacer
			Escribir "Ingrese la edad (lectura " + ConvertirATexto(i + 1) + "):"
			Leer edades[i]
			
			Si edades[i] < 0 o edades[i] > 120 Entonces
				Escribir 'ERROR: Edad fuera de rango calculable. Ingrese nuevamente'
				Escribir '(Rango Calculable entre 0 a 120 años)'
			SiNo
				SumaEdades <- SumaEdades + edades[i]
				
				Si edades[i] < 11 Entonces
					puntos[0] <- puntos[0] + 1
				SiNo
					Si edades[i] >= 11 y edades[i] < 18 Entonces
						puntos[1] <- puntos[1] + 1 
					SiNo
						Si edades[i] >= 18 y edades[i] < 60 Entonces
							puntos[2] <- puntos[2] + 1 
						SiNo
							puntos[3] <- puntos[3] + 1
						FinSi
					FinSi
				FinSi
				
				i <- i + 1
			FinSi        
		FinMientras
		
		promedio <- SumaEdades / n
		Escribir ' '
		Escribir 'El Promedio de las Edades subidas es: ', promedio, ' Años'
		Escribir ' '
		Escribir 'Cantidad de personas segun su edad:'
		Escribir 'Cantidad de Niños: ', puntos[0]
		Escribir 'Cantidad de Adolescentes: ', puntos[1]
		Escribir 'Cantidad de Adultos: ', puntos[2]
		Escribir 'Cantidad de Adultos Mayores: ', puntos[3]
		Escribir ' '
		
		resumen(categorias, puntos, n)
		Escribir ' '
		grafico(categorias, puntos, n)
		Escribir ' '
		
		Escribir "¿Desea ingresar nuevos datos (S/N)?:"
		Leer continuar
		Mientras continuar <> 'S' y continuar <> 's' y continuar <> 'N' y continuar <> 'n' Hacer
			Escribir 'ERROR: Respuesta no valida.'
			Escribir "¿Desea ingresar nuevos datos (S/N)?:"
			Leer continuar
			Escribir ' '
		FinMientras
	FinMientras
FinAlgoritmo