#Ejemplo6 Serie fibonacci Mientras
"""
	 La serie fibonacci, es una
	 secuencia num�rica, donde el
	 �ltimo valor obtenido
	 es la suma de los predecesores
     Declaraci�n de variable
"""
#Declaracion de variables
"""
Dado que python es debilmente tipado
no hay tipos de datos en la declaracion de variables
"""
n1 = float() #
n2 = float() #
i = int() #
suma = float() #
n = int() #

#Variables

n1 = 0
n2 = 0
i = 2
suma = 0
n = 0

#entrada de datos

print("Ingrese el 1er numero de la serie fibonacci")
n1 = float(input())
print("Ingrese el 2do numero de la serie fibonacci")
n2 = float(input())
print("Ingrese el numero de elementos de la serie fibonacci")
n = float(input())
#Se escriben los primeros dos elementos de la serie fibonacci
print(n1)
print(n2)

while i < n:
    suma = n1 + n2
    print(suma)
    n1 = n2
    n2 = suma
    i = i + 1

print("Fin del programa")