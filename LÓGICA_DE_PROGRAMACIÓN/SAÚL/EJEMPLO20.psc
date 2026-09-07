// Declaración de funcióm
Función resumen(argLenguajes,argPuntos,argEncuestas)
	Definir i Como Entero
	Escribir 'Resumen de datos ingresados' // Variable privada
	Para i<-0 Hasta 4 Con Paso 1 Hacer
		Escribir argLenguajes[i]+' : '+convertiratexto(argPuntos[i])+': '+convertiratexto(argPuntos[i]/argEncuestas*100), ' : ', '%'
	FinPara
	Escribir 'TOTAL.....:'+'  '+convertiratexto(argEncuestas)+'  '+'100%'
FinFunción

Función grafico(argLenguajes,argPuntos,argEncuestas)
	Definir i Como Entero
	Definir j Como Entero // Variable privada
	Definir barra Como Cadena
	Definir frecuenciaRelativa Como Real
	Definir frecuenciaSimple Como Entero
	Escribir 'Gráfico de datos ingresados'
	Para i<-0 Hasta 4 Con Paso 1 Hacer
		Escribir argLenguajes[i]
		frecuenciaRelativa <- argPuntos[i]/argEncuestas*10
		frecuenciaSimple <- redon(frecuenciaRelativa)
		Escribir frecuenciaSimple
		barra <- ''
		Para j<-0 Hasta frecuenciaSimple-1 Con Paso 1 Hacer
			barra <- barra+'*'
		FinPara
		Escribir barra
	FinPara
FinFunción

// Declaración de Proceso
Función menu
	Escribir 'Encuesta de lenguaje de programación preferido'
	Escribir 'De la siguiente lista, indique su lenguaje de programacion favorito:'
	Escribir '- 1 python........:'
	Escribir '- 2 JavaScript....:'
	Escribir '- 3 PHP...........:'
	Escribir '- 4 C#............:'
	Escribir '- 5 No sabe jaja..:('
	Escribir 'Opción ------->'
FinFunción

// Cuerpo principal
Algoritmo EJEMPLO10_DIFERENCIA_ENTRE_FUNCION_Y_PROCESO
	Definir continuar Como Cadena
	Definir opc Como Entero
	Definir i Como Entero
	Definir encuestas Como Entero
	Dimensionar lenguajes(5)
	Dimensionar puntos(5)
	continuar <- 'S'
	lenguajes[0] <- 'python'
	lenguajes[1] <- 'JavaScript'
	lenguajes[2] <- 'PHP'
	lenguajes[3] <- 'C#'
	lenguajes[4] <- 'No sabe jaja'
	Para i<-0 Hasta 3 Con Paso 1 Hacer
		puntos[i] <- 0
	FinPara
	Mientras continuar=='S' O continuar=='s' Hacer
		opc <- 0
		menu()
		Leer opc
		Si opc>=1 Y opc<=5 Entonces
			puntos[opc-1]<-puntos[opc-1]+1
			encuestas <- encuestas+1
		FinSi
		Según opc Hacer
			1:
				Escribir 'Seleccionó la opcion 1: python.....:'
			2:
				Escribir 'seleccionó la opcion 2: JavaScript.:'
			3:
				Escribir 'seleccionó la opcion 3: PHP........:'
			4:
				Escribir 'seleccionó la opcion 4: C#.........:'
			5:
				Escribir 'seleccionó la opcion 5: no sabe jaja: '
			De Otro Modo:
				Escribir 'Seleccionó una opción no válida'
		FinSegún
		Escribir 'Desea ejecutar otro proceso (S/N)?'
		Leer continuar
	FinMientras
	// Llamado a procesos
	resumen(lenguajes,puntos,encuestas)
	grafico(lenguajes,puntos,encuestas)
	Escribir 'Fin del programa....;]'
FinAlgoritmo

Funcion SinTitulo
	
FinFuncion
