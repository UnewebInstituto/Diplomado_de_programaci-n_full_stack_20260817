Algoritmo Ejercicio16_Arreglos_Definicion
	// variables
	Definir i Como Entero
	Definir j Como Entero
	Dimensionar A(3,3)
	// inicializacion
	A[0,0]<-25
	A[0,1]<-32
	A[0,2]<-47
	A[1,0]<-38
	A[1,1]<-96
	A[1,2]<--17
	A[2,0]<-34
	A[2,1]<-19
	A[2,2]<-45
	i <- 0
	// lectura
	Mientras i<3 Hacer
		j <- 0
		Mientras j<3 Hacer
			Escribir 'Posición '+ConvertirATexto(i)+','+ConvertirATexto(j)+' : '+ConvertirATexto(A[i,j])
			j <- j+1
		FinMientras
		i <- i+1
	FinMientras
	Escribir ' '
	Escribir 'Recorrido del arreglo mediante Repetir'
	i <- 0
	Repetir
		j <- 0
		Repetir
			Escribir 'Posición '+ConvertirATexto(i)+','+ConvertirATexto(j)+' : '+ConvertirATexto(A[i,j])
			j <- j+1
		Hasta Que j>2
		i <- i+1
	Hasta Que i>2
	Escribir ' '
	Escribir 'Recorrido del arreglo mediante Para'
	i <- 0
	Para i<-0 Hasta 2 Hacer
		Para j<-0 Hasta 2 Hacer
			Escribir 'Posición '+ConvertirATexto(i)+','+ConvertirATexto(j)+' : '+ConvertirATexto(A[i,j])
		FinPara
	FinPara
FinAlgoritmo
