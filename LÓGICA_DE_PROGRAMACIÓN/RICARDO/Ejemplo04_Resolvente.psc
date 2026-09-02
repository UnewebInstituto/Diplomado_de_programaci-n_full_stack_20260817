Algoritmo Ejemplo04_Resolvente
	// variables
	Definir a Como Real
	Definir b Como Real
	Definir c Como Real
	Definir x1 Como Real
	Definir x2 Como Real
	Definir sub_radical Como Real
	Definir resultado Como Cadena
	// inicializacion
	a <- 0
	b <- 0
	c <- 0
	x1 <- 0
	x2 <- 0
	sub_radical <- 0
	resultado <- ''
	// lectura
	Escribir 'Ingrese el valor de A (debe ser diferente de 0):'
	Leer a
	Si a<>0 Entonces
		Escribir 'Ingrese el valor de B:'
		Leer b
		Escribir 'Ingrese el valor de C:'
		Leer c
		sub_radical <- b*b-4*a*c
		Si sub_radical<0 Entonces
			resultado <- 'ERROR: Expresion Sub Radical debe ser >= 0'
		SiNo
			x1 <- (-b+raiz(sub_radical))/2*a
			x2 <- (-b-raiz(sub_radical))/2*a
			resultado <- 'x1: '+ConvertirATexto(x1)+', x2: '+ConvertirATexto(x2)
		FinSi
	SiNo
		resultado <- 'ERROR: valor de A, debe ser diferente de 0'
	FinSi
	Escribir resultado
FinAlgoritmo
