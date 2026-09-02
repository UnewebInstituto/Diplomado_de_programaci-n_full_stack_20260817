Algoritmo Ejemplo03_condiconal_multiples
	// Declaracion de variables
	Definir lenguaje Como Entero
	// Inicializacion de variables
	lenguaje <- 0
	// Lectura de valor
	Escribir 'Por favor ingrese un numero segun sea la opcion'
	Escribir '1-py, 2-js, 3-php, 4-sql, 5-html, 6-css:'
	Leer lenguaje
	Escribir ''
	Escribir 'Usted seleciono la opcion ', lenguaje
	Escribir 'que corressponde a:'
	Según lenguaje Hacer
		1:
			Escribir 'Python'
		2:
			Escribir 'Javascript'
		3:
			Escribir 'Preprocessor Hypertxt'
		4:
			Escribir 'Structured Query Languaje'
		5:
			Escribir 'HyperText Mark Languaje'
		6:
			Escribir 'Cascade Style Sheet'
		De Otro Modo:
			Escribir 'Opcion no valida'
	FinSegún
FinAlgoritmo
