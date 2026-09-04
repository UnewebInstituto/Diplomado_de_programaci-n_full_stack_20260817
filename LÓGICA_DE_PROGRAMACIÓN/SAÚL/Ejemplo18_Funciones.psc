Funcion suma <- sumar (n1, n2)
	suma <- n1 + n2
FinFuncion

Funcion resta <- restar (n1, n2)
	resta <- n1 - n2
FinFuncion

Funcion multiplica <- multiplicar (n1, n2)
	multiplica <- n1 * n2
FinFuncion

Funcion divide <- dividir (n1, n2)
	si n2 == 0 Entonces
		divide <- "Syntax error (NO PUEDE DIVIDIR POR 0 :))"
	SiNo
		divide <- ConvertirATexto(n1/n2)
	FinSi
FinFuncion

	
Funcion potencia <- potenciar (base, exponente)
	//Toda variable declarada dentro de una Funcion 
	//es privada a ella, esw decir su alcance (valores)
	//sólo existen en el contexto de la Funcion 
	//Declaracion de variables privadas
		definir prodcuto como entero
		definir i Como Entero
		//Inicialización de variables
		producto <- 1
		i <- 0
		mientras i < exponente Hacer
			producto <- producto * base
			i <- i + 1
		FinMientras
		potencia <- producto
FinFuncion


Algoritmo Ejemplo18_Funciones
	definir numero1 como real
	definir numero2 Como Real
	definir opc como entero
	definir respuesta Como Caracter
	respuesta <- "N"
	
	mientras respuesta = "N" O respuesta = "n" hacer
		Escribir "Calculadora básica"
		Escribir "1 - sumar"
		Escribir "2 - restar"
		Escribir "3 - multiplicar"
		Escribir "4 - dividir"
		Escribir "5 - potenciar"
		escribir "6 - salir"
		Escribir "Indique una opción"
		leer opc
		escribir "1er valor:"
		leer numero1
		escribir "2do valor:"
		leer numero2
		segun opc Hacer
			1: 
				escribir sumar(numero1,numero2)
			2: 
				escribir restar(numero1,numero2)
			3: 
				escribir multiplicar(numero1,numero2)
			4: 
				escribir dividir(numero1,numero2)
			5: 
				escribir potenciar(numero1, numero2)
			6:
				escribir "¿Desea abandonar la calculadora(S/N)?:("
				leer respuesta
			De Otro Modo:escribir "Opción no válida"
		FinSegun
	FinMientras
	Escribir "Fin de la calculadora"
	
	
	
	
FinAlgoritmo
