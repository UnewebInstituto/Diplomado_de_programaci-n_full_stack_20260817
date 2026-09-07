Algoritmo Tarea02_Algoritmo_Edad_Promedio
    //variables
	Dimensionar edades[100]
	Definir i Como Entero
	Definir n Como Entero
    Definir SumaEdades Como Entero
    Definir promedio Como Real
	Definir continuar Como Cadena
    Definir Niño Como Entero
    Definir Adolescente Como Entero
    Definir Adulto Como Entero
    Definir Adulto_Mayor Como Entero
    
    //inicializacion
	continuar <- "S"
	
    //lectura
	Mientras continuar == "S" o continuar == "s" Hacer
        n <- 0
        SumaEdades <- 0
        promedio <- 0
        Niño <- 0
        Adolescente <- 0
        Adulto <- 0
        Adulto_Mayor <- 0
        
		Mientras n <= 0 o n>100 hacer
			Escribir "Ingrese la cantidad de valores a leer (máximo 100):"
			Leer n
			Si n<=0 o n>100 Entonces
				Escribir "ERROR: cantidad no válida. Ingrese nuevamente"
			FinSi
		FinMientras
		
		i <- 0
		Mientras i <= n hacer
			Escribir "Ingrese la edad (lectura " + ConvertirATexto(i + 1) + "):"
			leer edades[i]
            Si edades[i] < 0 o edades[i] > 120 Entonces
				Escribir 'ERROR: Edad fuera de rango calculable. Ingrese nuevamente'
				Escribir '(Rango Calculable entre 0 a 120 años)'
            SiNo
				SumaEdades <- SumaEdades + edades[i]
				Si edades[i] < 11 Entonces
					Niño <- Niño + 1
				SiNo
					Si edades[i] >= 11 y edades[i] < 18 Entonces
						Adolescente <- Adolescente + 1
					SiNo
						Si edades[i] >= 18 y edades[i] < 60 Entonces
							Adulto <- Adulto + 1
						SiNo
							Adulto_Mayor <- Adulto_Mayor + 1
						FinSi
					FinSi
				FinSi
				i <- i + 1
            FinSi        
		FinMientras
		promedio <- SumaEdades / n
        Escribir ' '
        Escribir 'El Promedio de las Edades subidas es: ', promedio, ' Años'
        Escribir ' '
        Escribir 'Cantidad de personas segun su edad:'
        Escribir 'Cantidad de Niños: ',Niño
        Escribir 'Cantidad de Adolescentes: ',Adolescente
        Escribir 'Cantidad de Adultos: ',Adulto
        Escribir 'Cantidad de Adultos Mayores: ',Adulto_Mayor
        Escribir ' '
		Escribir "¿Desea ingresar nuevos datos (S/N)?:"
        Leer continuar
		Mientras continuar <> 'S' y continuar <> 's' y continuar <> 'N' y continuar <> 'n' Hacer
			Escribir 'ERROR: Respuesta no valida.'
			Escribir "¿Desea ingresar nuevos datos (S/N)?:"
			Leer continuar
			Escribir ' '
		FinMientras
	FinMientras
FinAlgoritmo