Algoritmo Estructura_de_control_condicional
	// Declaración de variables
	Definir edad Como Entero
	// Inicializacion de variable
	edad <- 0
	// lectura del valot
	Escribir 'Ejercicio 2 estructuras de control condicional'
	Escribir 'ingrese el siguiente dato.'
	Escribir 'edad...'
	Leer edad
	// Condicional simple
	Escribir 'Resultado de condicional simple'
	Si edad >= 18 Entonces
		Escribir 'Es mayor de edad'
	SiNo
		Escribir 'Es menor de edad'
	finsi
	Escribir 'Resultado del condicional múltiple'
	si edad < 10 Entonces
	finsi
		escribir ">>>>es un niño"
	si edad >= 11 y edad < 18 Entonces
		Escribir  ">>>>Es un adolescente"
	finsi
	si edad >= 18 y edad < 60 entonces 
		escribir ">>>>Es un adulto"
	finsi
	si edad >= 60 entonces 
		ESCRIBIR "Es un adulto mayor"
	finsi

FinAlgoritmo
