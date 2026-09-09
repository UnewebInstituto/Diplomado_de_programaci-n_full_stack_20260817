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
		divide <- 'ERROR: Division por cero'
	SiNo
		divide <- ConvertirATexto(n1/n2)
	FinSi
FinFunción

Función potencia <- potenciar(base,exponente)
	Definir producto Como Entero
	Definir i Como Entero
	i <- 0
	producto <- 1
	Mientras i<exponente Hacer
		producto <- producto*base
		i <- i+1
	FinMientras
	potencia <- producto
FinFunción

Algoritmo Ejercicio17_Funciones_Definicion
	// variables
	Definir numero1 Como Real
	Definir numero2 Como Real
	Definir opc Como Entero
	Definir respuesta Como Cadena
	// inicializacion
	respuesta <- 'N'
	// lectura
	Mientras respuesta=='N' O respuesta=='n' Hacer
		numero1 <- 0
		numero2 <- 0
		Escribir 'Calculadora Basica'
		Escribir ''
		Escribir '1er valor'
		Leer numero1
		Escribir '2do valor'
		Leer numero2
		Escribir '1 - Sumar'
		Escribir '2 - Restar'
		Escribir '3 - Multiplicar'
		Escribir '4 - Dividir'
		Escribir '5 - Potencia'
		Escribir '6 - Salir'
		Escribir 'Indique una opcion'
		Leer opc
		Escribir 'Resultado'
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
				Escribir potenciar(numero1,numero2)
			6:
				Escribir '¿Desea salir de la calculadora (S/N):?'
				Leer respuesta
			De Otro Modo:
				Escribir 'Opcion no valida'
		FinSegún
	FinMientras
	Escribir 'Fin de la Calculadora'
FinAlgoritmo
