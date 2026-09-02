Algoritmo EJEMPLO4_RESOLVENTE_CUADRATICA
	// Este algoritmo calcula la ecuacion de
	// 2do grado, conocida como resolvente
	// a partir de la introduccion de los
	// valores a, b y c. La premisa, es que
	// el valor dre "a" sea diferente de 0 y
	// la expresión  b Y 2-4ac
	// Declaración de variables
	Definir a Como Real
	Definir b Como Real
	Definir c Como Real
	Definir x1 Como Real
	Definir x2 Como Real
	Definir sub_radical Como Real
	Definir resultado Como Cadena
	// Inicializacion de variables
	a <- 0
	b <- 0
	c <- 0
	x1 <- 0
	x2 <- 0
	sub_radical <- 0
	resultado <- ''
	// Proceso
	Escribir 'Ingrese el valor de {a} (Debe ser distinto de 0):'
	Leer a
	Si a <> 0 Entonces
		Escribir 'Ingrese el valor de b:'
		Leer b
		Escribir 'Ingrese el valor de c:'
		Leer c
		sub_radical <- b*b-4*a*c
		Si sub_radical<0 Entonces
			resultado <- 'ERROR: xpresión sub-radical debe ser >= 0'
		SiNo
			x1 <- (-b+raiz(sub_radical))/2*a
			x2 <- (-b-raiz(sub_radical))/2*a
			resultado <- 'x1:'+ConvertirATexto(x1)+'x2'+ConvertirATexto(x2)
		FinSi
	SiNo
		resultado <- 'ERROR: VALOR DE A DEBE SER DIFERENTE DE 0'
	FinSi
	// Escribir resultado
	Escribir Resultado
FinAlgoritmo
