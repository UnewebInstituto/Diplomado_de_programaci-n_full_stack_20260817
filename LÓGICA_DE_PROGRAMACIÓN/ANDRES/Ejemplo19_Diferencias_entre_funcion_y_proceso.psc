// Declaración de función
// Declaración de proceso
Función menu
	Escribir 'ENCUESTA DE LENGUAJES DE PROGRAMACIÓN.'
	Escribir 'De la siguiente lista, por favor indique su lenguaje'
	Escribir 'de programación preferido:'
	Escribir '1- Python'
	Escribir '2- Javascript'
	Escribir '3- PHP'
	Escribir '4- C#'
	Escribir '5- No sabe'
	Escribir 'Opción --->'
FinFunción

Función resumen(argLenguajes,argPuntos,argEncuestas)
	Definir i Como Entero
	Escribir 'Resumen de datos ingresados' // Variable privada al proceso
	Para i<-0 Hasta 4 Con Paso 1 Hacer
		Escribir argLenguajes[i]+'   '+ConvertirATexto(argPuntos[i])+'   '+ConvertirATexto(argPuntos[i]/argEncuestas*100)+' %'
	FinPara
	Escribir 'TOTAL......:'+'   '+ConvertirATexto(argEncuestas)+'   '+'100%'
FinFunción

Función grafico(argLenguajes,argPuntos,argEncuestas)
	Definir i Como Entero
	Definir j Como Entero // Variable privada al proceso
	Definir barra Como Cadena
	Definir frecuenciaRelativa Como Real
	Definir frecuenciaSimple Como Entero
	Escribir 'Grafico de datos ingresados'
	Para i<-0 Hasta 4 Con Paso 1 Hacer
		// Escribir argLenguajes[i]
		frecuenciaRelativa <- argPuntos[i]/argEncuestas*10
		// Escribir frecuenciaRelativa
		frecuenciaSimple <- Redon(frecuenciaRelativa) // Decima parte para graficar
		// Escribir frecuenciaSimple
		barra <- argLenguajes[i]
		Para j<-0 Hasta frecuenciaSimple-1 Con Paso 1 Hacer
			barra <- barra+'*'
		FinPara
		Escribir barra
	FinPara
FinFunción

// Cuerpo principal
Algoritmo EJEMPLO19_DIFERENCIAS_ENTRE_FUNCION_Y_PROCESO
	// Declaración de variables
	Definir continuar Como Cadena
	Definir opc Como Entero
	Definir i Como Entero
	Definir encuestas Como Entero
	Dimensionar lenguajes(5)
	Dimensionar puntos(5)
	// Inicialización de variables
	continuar <- 'S'
	encuestas <- 0
	lenguajes[0] <- 'PYTHON.......:'
	lenguajes[1] <- 'JAVASCRIPT...:'
	lenguajes[2] <- 'PHP..........:'
	lenguajes[3] <- 'C#...........:'
	lenguajes[4] <- 'NO SABE......:'
	Para i<-0 Hasta 3 Con Paso 1 Hacer
		puntos[i] <- 0
	FinPara // Se inicializa el arreglo puntos en 0
	// Proceso
	Mientras continuar=='S' O continuar=='s' Hacer
		opc <- 0
		// Lamado mostrar menu
		menu()
		Leer opc
		Si opc>=1 Y opc<=5 Entonces
			puntos[opc-1]<-puntos[opc-1]+1
			encuestas <- encuestas+1 // Se incrementa en 1 la opción elegida
		FinSi
		Según opc Hacer
			1:
				Escribir 'Seleccionó la opción 1, correspondiente a Python.'
			2:
				Escribir 'Seleccionó la opción 2, correspondiente a Javascript.'
			3:
				Escribir 'Seleccionó la opción 3, correspondiente a PHP.'
			4:
				Escribir 'Seleccionó la opción 4, correspondiente a C#.'
			5:
				Escribir 'Seleccionó la opción 5, correspondiente a No sabe.'
			De Otro Modo:
				Escribir 'Seleccionó una ocpión no válida.'
		FinSegún
		Escribir '¿Desea realizar una nueva encuesta (S/N):'
		Leer continuar
	FinMientras
	// Llamado procesos
	resumen(lenguajes,puntos,encuestas)
	grafico(lenguajes,puntos,encuestas)
	Escribir 'Fin del programa...;)'
FinAlgoritmo
