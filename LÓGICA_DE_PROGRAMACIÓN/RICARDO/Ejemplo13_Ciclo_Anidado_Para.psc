Algoritmo Ejemplo13_Ciclo_Anidado_Para
	// variables
	Definir i Como Entero
	Definir j Como Entero
	// inicializacion
	// lectura
	Escribir 'Tabla de multiplicar'
	Para i<-1 Hasta 9 Con Paso 1 Hacer
		Para j<-1 Hasta 9 Con Paso 1 Hacer
			Escribir ConvertirATexto(i)+' x ', ConvertirATexto(j)+' = ', ConvertirATexto(i*j)
		FinPara
		Escribir ''
	FinPara
FinAlgoritmo
