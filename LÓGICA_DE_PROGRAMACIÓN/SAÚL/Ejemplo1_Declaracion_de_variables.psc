Algoritmo Ejemplo1_Declaracion_de_variables
	// Declaración de variables
	Definir nombre Como Cadena
	Definir edad Como Entero
	Definir estatura Como Real
	Definir estudiante Como Lógico
	// Inicialización de variables
	nombre <- ''
	estatura <- 0
	pregunta <- ''
	estudiante <- Falso
	// Lectura de valores desde el mundo exterior
	Escribir 'Ejemplo 1 Declaracion de variables'
	edad <- 0
	Escribir 'Ingrese los siguinetes datos:'
	Escribir 'Nombre'
	Leer nombre
	Escribir 'edad'
	Leer edad
	Escribir 'estatura'
	Leer estatura
	Escribir '¿Es estudiante (s/n)?'
	
	Leer pregunta
	Si pregunta=='S' O pregunta=='s' Entonces
		estudiante <- Verdadero
	FinSi
	//Escritura o despliegue de los datos ingresados, serán mostrados al final
	ESCRIBIR "Estos son los datos cargados"
	Escribir "nombre..." nombre
	Escribir "edad..." edad
	escribir "estatura..." estatura
	si estudiante == Verdadero Entonces
		escribir "¿es estudianteee....?" , "SI ES ESTUDIANTE"
	SiNo
		escribir "¿es estudianteee...?" , "NO ES ESTUDIANTE"
		
	FinSi
FinAlgoritmo
