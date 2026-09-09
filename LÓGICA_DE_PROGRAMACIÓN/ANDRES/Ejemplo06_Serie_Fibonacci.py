#Ejemplo06 Serie Fibonacci
"""""
La serie Fibonacci, es una secuencia numerica, donde
el ultimo calor obtenido, en la suma de los dos predecesoes
"""
#Declaracion de variables
"""
Dado que Python es debilmente tipado
no hay tipos de datos en la declaracion de
variables. 

n1 = float() # 1er. numero de la variable
n2 = float() # 2do. numero de la variable
n = int() # Cantidad de valores a pedir
i = int() # Variable de control
suma = float() # Suma de valores
"""
# Inicializacion de variables
n1 = 0
n2 = 0
n = 0
i = 2
suma = 0
# Entrada de datos
print("Ingrese el valor del 1er. numero de la serie:")
n1 = float(input())
print("Ingrese el valor del 2do. numero de la serie:")
n2 = float(input())
print("Ingrese el numero de valores de la serie:")
n = int(input())
# Se escriben los dos primeros numeros de la serie
print(n1)
print(n2)
while i < n:
    suma = n1 + n2
    print(suma)
    n1 = n2
    n2 = suma
    i = i + 1
print("Fin del programa")

