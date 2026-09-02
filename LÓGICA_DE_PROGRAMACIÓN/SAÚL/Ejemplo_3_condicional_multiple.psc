Algoritmo Ejemplo3_condicional_multiple
	Definir lenguaje Como Entero
	
	lenguaje <- 0
	escribir "Por favor ingrese un numero sea la opcion"
	escribir "1-py 2-Js 3-php 4-sql 5-html 6-ccs:"
	leer lenguaje
	escribir ""
	escribir "Usted selecciono la opción" , lenguaje
	escribir "que corresponde a:"
	segun lenguaje hacer 
		1:
			Escribir "python"
		2: 
			Escribir "JavaScript"
		3:
			Escribir "pREPROCCESOR hypertext"
		4: 
			escribir "Structured query lenguage"
		5:
			Escribir "Hypertext mark lenguage"
		6: 
			Escribir "Cascade style sheet"
		de otro modo:
			Escribir "OPCIÓN NO VÁLIDA"
	FinSegun
	
FinAlgoritmo
