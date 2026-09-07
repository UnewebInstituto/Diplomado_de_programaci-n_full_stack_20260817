Funcion resumen(argLenguajes, argPuntos, argEncuestas)
	Definir i Como Entero
	Escribir "Resumen de datos ingresados"
	Para i<-0 Con Paso 1 Hasta 4 Hacer
		Escribir argLenguajes[i] + " : " + ConvertirATexto(argPuntos[i]) + "   " + ConvertirATexto(argPuntos[i]/argEncuestas*100) + " %"
	FinPara
	Escribir 'TOTAL.........:' + " : " + ConvertirATexto(argEncuestas) + "   " + '100 %'
FinFuncion

Funcion grafico(argLenguajes, argPuntos, argEncuestas)
	Definir i Como Entero
	Definir j Como Entero
	Definir barra Como Caracter
	Definir frecuenciaRelativa Como Real
	Definir frecuenciaSimple Como Entero
	Escribir "Grafico de datos ingresados"
	Para i<-0 Con Paso 1 Hasta 4 Hacer
		Escribir argLenguajes[i] + '  '
		frecuenciaRelativa <- argPuntos[i]/argEncuestas * 10
		frecuenciaSimple <- Redon(frecuenciaRelativa)
		barra <- argLenguajes[i]
		Para j <- 0 Con Paso 1 Hasta frecuenciaSimple - 1 Hacer
			barra <- barra + '*'
		FinPara
		Escribir barra
	FinPara
FinFuncion

Funcion menu
	Escribir "ENCUESTA DE LENGUAJES DE PROGRAMACIÓN."
	Escribir "De la siguiente lista, por favor indique su lenguaje"
	Escribir "de programación preferido:"
	Escribir "1- Python"
	Escribir "2- Javascript"
	Escribir "3- PHP"
	Escribir "4- C#"
	Escribir "5- No sabe"
	Escribir "Opción --->"
FinFuncion



Algoritmo Ejemplo19_diferencias_entre_funcion_Y_proceso
	Definir continuar Como Caracter
	Definir i Como Entero
	Definir opc Como Entero
	Definir encuestas Como Entero
	Dimensionar lenguajes(5)
	Dimensionar puntos(5)
	
	continuar <- "S"
	encuestas <- 0
	lenguajes[0] <- "PYTHON......."
	lenguajes[1] <- "JAVASCRIPT..."
	lenguajes[2] <- "PHP.........."
	lenguajes[3] <- "C#..........."
	lenguajes[4] <- "NO SABE......"
	para i<-0 Con Paso 1 Hasta 3 Hacer	
		puntos[i] <- 0
	FinPara
	
	Mientras continuar == "S" O continuar == "s" Hacer
		opc <- 0
		
		menu
		Leer opc
		si opc >= 1 y opc <= 5 Entonces
			puntos[opc-1] <- puntos[opc-1] + 1 
			encuestas <- encuestas + 1
		FinSi
		Segun opc
			1: Escribir "Seleccionó la opción 1, correspondiente a Python."
			2: Escribir "Seleccionó la opción 2, correspondiente a Javascript."
			3: Escribir "Seleccionó la opción 3, correspondiente a PHP."
			4: Escribir "Seleccionó la opción 4, correspondiente a C#."
			5: Escribir "Seleccionó la opción 5, correspondiente a No sabe."
			De Otro Modo: Escribir "Seleccionó una ocpión no válida."
		FinSegun
		Escribir "¿Desea realizar una nueva encuesta (S/N):"
		leer continuar
	FinMientras
	resumen(lenguajes, puntos, encuestas)
	grafico(lenguajes, puntos, encuestas)
	Escribir "Fin del programa...;)"
FinAlgoritmo
