Algoritmo Ejemplo03_condicional_multiple
	// Declaración de variables
	Definir lenguaje Como Entero
	// Inicialización de variables
	lenguaje <- 0
	// Lectura de valor
	Escribir 'Por favor ingrese un número según sea la opción'
	Escribir '1-py, 2-js, 3-php, 4-sql, 5-html, 6-css:'
	Leer lenguaje
	Escribir ''
	Escribir 'Usted seleccionó la opción ', lenguaje
	Escribir 'que corresponde a:'
	Según lenguaje Hacer
		1:
			Escribir 'Python'
		2:
			Escribir 'Javascript'
		3:
			Escribir 'Preprocessor Hypertext'
		4:
			Escribir 'Structured Query Languaje'
		5:
			Escribir 'HyperText Mark Languaje'
		6:
			Escribir 'Cascade Style Sheet'
		De Otro Modo:
			Escribir 'Opción No Válida'
	FinSegún
FinAlgoritmo
