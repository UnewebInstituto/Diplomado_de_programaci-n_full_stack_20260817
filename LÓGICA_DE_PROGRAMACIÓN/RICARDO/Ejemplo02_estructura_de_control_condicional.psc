Algoritmo Ejemplo02_estructura_de_control_condicional
	// variables
	Definir edad Como Entero
	// inicializacion
	edad <- 0
	// lectura
	Escribir 'Ejemplo02 Estructura de Control Condicional'
	Escribir 'Ingrese el sguiente dato:'
	Escribir 'Edad.......:'
	Leer edad
	// condicional simple
	Escribir 'Resultado del condicional simple'
	Si edad>=18 Entonces
		Escribir 'Es mayor de edad.'
	FinSi
	// condicional compuesto
	Escribir 'Resultado del condicional compuesto'
	Si edad>=18 Entonces
		Escribir 'Es mayor de edad.'
	SiNo
		Escribir 'Es menor de edad.'
	FinSi
	// condicional multiple
	Escribir 'Resultado del condicional multiple'
	Si edad<11 Entonces
		Escribir 'Es un niño'
	FinSi
	Si edad>=11 Y edad<18 Entonces
		Escribir 'Es un adolecente.'
	FinSi
	Si edad>=18 Y edad<60 Entonces
		Escribir 'Es un adulto'
	FinSi
	Si edad>=60 Entonces
		Escribir 'Es un adulto mayor'
	FinSi
FinAlgoritmo
