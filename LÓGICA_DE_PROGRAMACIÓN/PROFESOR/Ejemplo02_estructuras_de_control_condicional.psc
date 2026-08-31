Algoritmo Ejemplo02_estructuras_de_control_condicional
	// Declaración de variables
	Definir edad Como Entero
	// Inicialización de variable
	edad <- 0
	// Lectura del valor
	Escribir 'Ejemplo02 Estructuras de Control Condicional'
	Escribir 'Ingrese el siguiente dato.'
	Escribir 'Edad...:'
	Leer edad
	// Condicional simple
	Escribir 'Resultado del condicional simple.'
	Si edad>=18 Entonces
		Escribir '>>> Es mayor de edad.'
	FinSi
	Escribir 'Resultado del condicional compuesto.'
	Si edad>=18 Entonces
		Escribir '>>> Es mayor de edad.'
	SiNo
		Escribir '>>> Es menor de edad.'
	FinSi
	Escribir 'Resultado del condicional múltiple.'
	Si edad<11 Entonces
		Escribir '>>> Es un niño.'
	FinSi
	Si edad>=11 Y edad<18 Entonces
		Escribir '>>> Es un adolescente.'
	FinSi
	Si edad>=18 Y edad<60 Entonces
		Escribir '>>> Es un adulto.'
	FinSi
	Si edad>=60 Entonces
		Escribir '>>> Es un adulto mayor.'
	FinSi
	Escribir '*** Fin del programa ***'
FinAlgoritmo
