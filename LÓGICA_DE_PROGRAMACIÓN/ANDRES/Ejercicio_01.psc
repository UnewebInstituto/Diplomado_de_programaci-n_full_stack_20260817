Algoritmo Ejercicio_01
	//Declaracion de variables
	Definir nombre Como Caracter
	Definir apellido Como Caracter
	Definir correo_electronico Como Caracter
	Definir direccion Como Caracter
	Definir edad Como Entero
	//Inicializacion de variables
	nombre <- ""
	apellido <- ""
	correo_electronico <- ""
	direccion <- ""
	edad <- 0
	//Lectura de valores 
	Escribir "Declaracion de variables"
	Escribir "Ingrese los datos:"
	Escribir "Nombre............"
	Leer nombre
	Escribir "Apellido.........."
	Leer apellido
	Escribir "Correo............"
	Leer correo_electronico
	Escribir "Direccion........."
	Leer direccion
	Escribir "Edad.............."
	Leer edad
	//Escritura
	Escribir "Datos:"
	Escribir " Nombre.......", nombre
	Escribir "Apellido......", apellido
	Escribir "Correo........", correo_electronico
	Escribir "Direccion.....", direccion
	Si edad > 18 Entonces
		Escribir "Mayor de edad"
	SiNo
		Escribir "Menor de edad"
	FinSi
	
FinAlgoritmo
