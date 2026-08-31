Algoritmo Ejercicio01
	// variables
	Definir nombre Como Cadena
	Definir apellido Como Cadena
	Definir correo Como Cadena
	Definir direccion Como Cadena
	Definir edad Como Entero
	// inicializacion
	nombre <- ''
	apellido <- ''
	correo <- ''
	direccion <- ''
	edad <- 0
	// proceso
	Escribir 'Ejercicio01'
	Escribir 'Ingrese los siguientes datos:'
	Escribir 'Nombre................:'
	Leer nombre
	Escribir 'Apellido..............:'
	Leer apellido
	Escribir 'Correo Electronico....:'
	Leer correo
	Escribir 'Direccion.............:'
	Leer direccion
	Escribir 'Edad..................:'
	Leer edad
	Escribir 'Estos son los datos cargados.'
	Escribir 'Nombre..............:', nombre
	Escribir 'Apellido............:', apellido
	Escribir 'Correo Electronico..:', correo
	Escribir 'Dirección...........:', direccion
	Escribir 'Edad................:', edad
	Si edad<18 Entonces
		Escribir 'Es menor de edad'
	SiNo
		Escribir 'Es mayor de edad'
	FinSi
FinAlgoritmo
