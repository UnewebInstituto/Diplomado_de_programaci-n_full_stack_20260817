Algoritmo Ejercicio1_datos
	
	definir correo_electronico Como Caracter
	Definir nombre Como Caracter
	Definir apellido Como Caracter
	definir dirección Como Caracter
	definir edad Como Entero
	
	correo_electronico <- ""
	nombre <- ""
	apellido <- ""
	dirección <- ""
	edad <- 0
	
	escribir "Ingrese sus datos"
	escribir "correo electrónico"
	leer correo_electronico
	escribir "nombre"
	leer nombre
	escribir "apellido"
	leer apellido
	escribir "dirección"
	leer dirección
	escribir "edad"
	leer edad
	
	Si edad <= 18 Entonces
		escribir "Es menor de edad"
	sino 
		escribir "es mayor de edad"
	FinSi
	
FinAlgoritmo
