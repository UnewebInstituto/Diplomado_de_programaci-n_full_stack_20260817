Algoritmo CASA_2
	Definir N Como Entero
	Definir i Como Entero
	Definir edad Como Entero
	Definir suma Como Entero
	Definir promedio Como Real
	Definir niños Como Entero
	Definir adolescentes Como Entero
	Definir adultos Como Entero
	Definir AdultosMayores Como Entero
	
	suma <- 0
	niños <- 0
	adolescentes <- 0
	adultos <- 0
	AdultosMayores <- 0
	
	Escribir "Ingrese la cantidad de personas a registrar:"
	Leer N
	
	Dimension edades[N]
	
	Para i <- 0 Hasta N - 1 Con Paso 1 Hacer
		Repetir
			Escribir "Ingrese la edad ", i + 1, " (entre 0 y 120):"
			Leer edad
			
			Si edad < 0 O edad > 120 Entonces
				Escribir "Error: La edad debe ser mayor o igual a 0 y menor o igual a 120."
			FinSi
		Hasta Que edad >= 0 Y edad <= 120
		
		edades[i] <- edad
		suma <- suma + edades[i]
		
		Si edades[i] < 11 Entonces
			niños <- niños + 1
		Sino
			Si edades[i] >= 11 Y edades[i] < 18 Entonces
				adolescentes <- adolescentes + 1
			Sino
				Si edades[i] >= 18 Y edades[i] < 60 Entonces
					adultos <- adultos + 1
				Sino
					AdultosMayores <- AdultosMayores + 1
				FinSi
			FinSi
		FinSi
		
	FinPara
	
	Si N > 0 Entonces
		promedio <- suma / N
	Sino
		promedio <- 0
	FinSi
	
	Escribir "RESULTADO :D"
	Escribir "Edad promedio: ", promedio
	Escribir "Cantidad de personas por rango de edad:"
	Escribir "   - Niños (mayores a 11): ", niños
	Escribir "   - Adolescentes (mayores o iguales 11 y menores de 18): ", adolescentes
	Escribir "   - Adultos (mayores o iguales a 18 y menores de 60): ", adultos
	Escribir "   - Adultos Mayores (mayores o iguales a 60): ", Adultos Mayores
	
	Escribir "Quiere ingresar nuevos datos (s/n)"
	Leer respuesta
FinAlgoritmo