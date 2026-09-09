// Declaracion de Proceso
Función resumen(etiqueta,contador,opc)
	Escribir 'Cantidad de datos segun las edades:'
	Para j<-0 Hasta 3 Con Paso 1 Hacer
		Escribir etiqueta[j]+'  '+ConvertirATexto(contador[j])+'   '+ConvertirATexto(contador[j]/opc*100)+' %'
	FinPara
	Escribir 'Total............:'+' '+ConvertirATexto(opc)+'  '+'100%'
FinFunción

Función grafico(etiqueta,contador,opc)
	Definir i Como Entero
	Definir j Como Entero
	Definir barra Como Cadena
	Definir frecuenciaRelativa Como Real
	Definir frecuenciaSimple Como Entero
	Escribir 'Grafico de datos segun la edad'
	Para i<-0 Hasta 3 Con Paso 1 Hacer
		frecuenciaRelativa <- contador[i]/opc*10
		frecuenciaSimple <- Redon(frecuenciaRelativa)
		barra <- etiqueta[i]
		Para j<-0 Hasta frecuenciaSimple-1 Con Paso 1 Hacer
			barra <- barra+'*'
		FinPara
		Escribir barra
	FinPara
FinFunción

// Cuerpo principal
Algoritmo Ejercicio03
	// Declaracion de variables
	Dimensionar edades(100)
	Definir i Como Entero
	Definir n Como Entero
	Definir continuar Como Cadena
	Definir suma Como Real
	Definir promedio Como Real
	Definir opc Como Entero
	Definir j Como Entero
	Dimensionar contador(4)
	Dimensionar etiqueta(4)
	suma <- 0
	continuar <- 'S'
	n <- 0
	opc <- 0
	etiqueta[0] <- 'NIÑOS..........:'
	etiqueta[1] <- 'ADOLESCENTES...:'
	etiqueta[2] <- 'ADULTOS........:'
	etiqueta[3] <- 'ADULTOS MAYORES:'
	contador[0] <- 0
	contador[1] <- 0 // Cantidad de niños
	contador[2] <- 0 // Cantidad de adolescentes
	contador[3] <- 0 // Cantidad de adultos
	Mientras continuar=='S' O continuar=='s' Hacer // Cantidad de adultos mayores
		Mientras n<=0 O n>100 Hacer
			Escribir 'Ingrese la cantidad de valores a leer (máximo 100):'
			Leer n
			Si n<=0 O n>100 Entonces
				Escribir 'Error: cantidad no válida'
			FinSi
		FinMientras
		// Validacion de edad
		i <- 0
		Mientras i<n Hacer
			Escribir 'Ingrese la edad (lectura '+ConvertirATexto(i+1)+'):'
			Leer edades[i]
			Mientras edades[i]<=0 O edades[i]>120 Hacer
				Escribir 'ERROR: Edad no valida'
				Escribir 'Ingrese la edad (lectura '+ConvertirATexto(i+1)+'):'
				Leer edades[i]
			FinMientras
			i <- i+1
			opc <- opc+1
		FinMientras
		// Asignacion de edad
		i <- 0
		Repetir
			Si edades[i]<11 Entonces
				Escribir edades[i], ': Es un nino'
				contador[0] <- contador[0]+1
			SiNo // Contar niños
				Si edades[i]>=11 Y edades[i]<18 Entonces
					Escribir edades[i], ': Es un Adolescente'
					contador[1] <- contador[1]+1
				SiNo // Contar adolescentes
					Si edades[i]>=18 Y edades[i]<60 Entonces
						Escribir edades[i], ': Es un Adulto'
						contador[2] <- contador[2]+1
					SiNo // Contar adultos
						Si edades[i]>=60 Entonces
							Escribir edades[i], ': Es un Adulto Mayor'
							contador[3] <- contador[3]+1
						FinSi // Contar adultos mayores
					FinSi
				FinSi
			FinSi
			i <- i+1
		Hasta Que i=n
		// Edad promedio
		Para i<-0 Hasta n-1 Con Paso 1 Hacer
			suma <- suma+edades[i]
		FinPara
		Si n>0 Entonces
			promedio <- suma/n
			Escribir ' La edad promedio es: ', promedio
		FinSi
		// Llamado de Proceso
		resumen(etiqueta,contador,opc)
		grafico(etiqueta,contador,opc)
		Escribir '¿Desea ingresar nuevos datos (S/N)?'
		Leer continuar
	FinMientras
	Escribir 'Fin del Programa'
FinAlgoritmo
