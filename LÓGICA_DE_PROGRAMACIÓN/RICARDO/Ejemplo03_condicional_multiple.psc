Algoritmo Ejempl03_condicional_multiple
	// variables
	Definir lenguaje Como Entero
	// inicializacion
	lenguaje <- 0
	// lectura
	Escribir 'Por favor ingrese un numero segun sea la opcion'
	Escribir 'iniciales: 1-py, 2-js, 3-php, 4-sql, 5-html, 6-css:'
	Leer lenguaje
	Escribir ''
	Escribir 'Usted selecciono la opcion ', lenguaje
	Escribir 'que corresponde a:'
	Según lenguaje Hacer
		1:
			Escribir 'Python'
		2:
			Escribir 'JavaScript'
		3:
			Escribir 'Preprocessor Hypertext'
		4:
			Escribir 'Strured Query Language'
		5:
			Escribir 'HyperText Mark Language'
		6:
			Escribir 'Cascade Style Sheet'
		De Otro Modo:
			Escribir 'Opcion No Valida'
	FinSegún
FinAlgoritmo
