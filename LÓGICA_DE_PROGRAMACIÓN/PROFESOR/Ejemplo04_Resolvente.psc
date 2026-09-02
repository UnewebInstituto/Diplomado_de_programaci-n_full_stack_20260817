Algoritmo Ejemplo04_Resolvente
	// Este Algoritmo calcula la ecuación de
	// 2do. Grado, conocida como "Resolvente"
	// a partir de la introducción de los
	// valores a, b y c. La premisa, es que
	// el valor de "a" sea diferente de 0 y
	// la expresión "b&2-4*a*c >= 0"
	// Declaración de variables
	Definir a Como Real
	Definir b Como Real
	Definir c Como Real
	Definir x1 Como Real
	Definir x2 Como Real
	Definir sub_radical Como Real
	Definir resultado Como Cadena
	// Inicialización de variables
	a <- 0
	b <- 0
	c <- 0
	x1 <- 0
	x2 <- 0
	sub_radical <- 0
	resultado <- ''
	// Proceso
	Escribir 'Ingrese el valor de a (debe ser diferente de 0):'
	Leer a
	Si a<>0 Entonces
		Escribir 'Ingrese el valor de b:'
		Leer b
		Escribir 'Ingrese el valor de c:'
		Leer c
		sub_radical <- b*b-4*a*c
		Si sub_radical<0 Entonces
			resultado <- 'ERROR: Expresión sub radical, debe ser >= 0'
		SiNo
			x1 <- (-b+raiz(sub_radical))/2*a
			x2 <- (-b-raiz(sub_radical))/2*a
			resultado <- 'x1:'+ConvertirATexto(x1)+', x2:'+ConvertirATexto(x2)
		FinSi
	SiNo
		resultado <- 'ERROR: Valor de a, debe ser diferente de 0'
	FinSi
	// Escribir resultado de la evaluación
	Escribir resultado
FinAlgoritmo
