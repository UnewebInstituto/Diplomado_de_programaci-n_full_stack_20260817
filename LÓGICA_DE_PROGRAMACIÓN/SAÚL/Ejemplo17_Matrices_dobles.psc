Algoritmo Ejemplo17_Matrices_dobles
	
	dimensionar A[3,3]
	
	A[0,0] <- 25
	A[0,1] <- 32
	A[0,2] <- 47
	A[1,0] <- 38
	A[1,1] <- 96
	A[1,2] <- -17
	A[2,0] <- 34
	A[1,0] <- 19
	A[2,2] <- 45
	i <- 0
	Mientras i < 3 Hacer
		j <- 0
		Mientras j < 3 Hacer
			Escribir "Contenido de la posicion " + ConvertirATexto(i) + "," + ConvertirATexto(j) + " : " + ConvertirATexto(A[i,j])
			j <- j + 1
		FinMientras
		i <- i + 1
	FinMientras
	Escribir ""
	Escribir "Ciclo REPETIR"
	i <- 0
	Repetir
		j<- 0 
		repetir
			Escribir "Contenido de la posicion " + ConvertirATexto(i) + "," + ConvertirATexto(j) + " : " + ConvertirATexto(A[i,j])
			j <- j + 1
		Hasta Que j > 2
		i <- i + 1
	Hasta Que i > 2
	Escribir  ""
	Escribir "Ciclo para"
	para i<-0 Hasta 2 Con Paso 1 Hacer
		para j <- 0 hasta 2 Con Paso 1 hacer 
			Escribir "Contenido de la posicion " + ConvertirATexto(i) + "," + ConvertirATexto(j) + " : " + ConvertirATexto(A[i,j])
		FinPara
	FinPara
FinAlgoritmo
