Algoritmo Ejemplo01_declaracion_de_variables
	// Declaracion de variables
	Definir nombre Como Cadena
	Definir edad Como Entero
	Definir estatura Como Real
	Definir estudiante Como Lógico
	// Inicializacion de variables
	nombre <- ''
	edad <- 0
	estatura <- 0
	pregunta <- ''
	estudiante <- Falso
	// Lectura de valores desde el mundo exterior
	Escribir 'Ejemplo01 declaracion de Variables'
	Escribir 'Ingrese los siguientes datos:'
	Escribir 'Nombre......'
	Leer nombre
	Escribir 'Edad.......'
	Leer edad
	Escribir 'Estatura......'
	Leer estatura
	Escribir 'Es estudiante(S/N)..?'
	Leer pregunta
	Si pregunta=='S' O pregunta=='s' Entonces
		estudiante <- Verdadero
	FinSi
	// Escritura o depliegue de los datos ingresados
	Escribir ' Estos son los datos cargados:'
	Escribir 'Nombre.....', nombre
	Escribir 'Edad.......', edad
	Escribir 'Estatura...', estatura
	Si estudiate == Verdadero Entonces
		Escribir 'Es estudiante...:? Si es Estudiante'
	SiNo
		Escribir 'Es estudiante...:? No es Estudiante'
	FinSi
FinAlgoritmo
