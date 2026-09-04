// Declaración de funciones
Función suma <- sumar(n1,n2)
	suma <- n1+n2
FinFunción

Función resta <- restar(n1,n2)
	resta <- n1-n2
FinFunción

Función multiplica <- multiplicar(n1,n2)
	multiplica <- n1*n2
FinFunción

Función divide <- dividir(n1,n2)
	Si n2==0 Entonces
		divide <- 'Error: División por cero'
	SiNo
		divide <- ConvertirATexto(n1/n2)
	FinSi
FinFunción

Funcion potencia <- potenciar(base,exponente)
	// Toda variable declarada dentro de una función
	// es privada a ella, es decir su alcance (valores)
	// sólo existen en el contexto de la función
	// Declaración de variables privadas
	Definir producto Como Entero
	Definir i Como Entero
	// Inicialización de las vriables
	producto <- 1
	i <- 0
	Mientras i < exponente Hacer
		producto <- producto * base
		i <- i + 1	
	FinMientras
	potencia <- producto
FinFuncion

// Cuerpo principal del Algoritmo o programa
Algoritmo EJEMPLO17_FUNCIONES_DEFINICION
	// Declaración de variables
	Definir numero1 Como Real
	Definir numero2 Como Real
	Definir opc Como Entero
	Definir respuesta Como Cadena
	// Inicialización de variables
	respuesta <- 'N'
	Mientras respuesta=='N' O respuesta=='n' Hacer // No abandonar la calculadora
		numero1 <- 0
		numero2 <- 0
		Escribir 'Calculadora básica'
		Escribir ''
		Escribir '1er. Valor:'
		Leer numero1
		Escribir '2do. Valor:'
		Leer numero2
		Escribir ''
		Escribir '1 - Sumar'
		Escribir '2 - Restar'
		Escribir '3 - Multiplicar'
		Escribir '4 - Dividir'
		Escribir '5 - Potencia'
		Escribir '6 - Salir'
		Escribir 'Indique una opción:'
		Leer opc
		Escribir 'Resultado:'
		Según opc Hacer
			1:
				Escribir sumar(numero1,numero2)
			2:
				Escribir restar(numero1,numero2)
			3:
				Escribir multiplicar(numero1,numero2)
			4:
				Escribir dividir(numero1,numero2)
			5:
				Escribir potenciar(numero1, numero2)
			6:
				Escribir '¿Desea salir de la calculadora (S/N):?'
				Leer respuesta
			De Otro Modo:
				Escribir 'Opción no válida'
		FinSegún
	FinMientras
	Escribir 'Fin de la calculadora...'
FinAlgoritmo
