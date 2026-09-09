# Ejemplo06 Serie Fibonacci Mientras
"""
La serie Fibonacci, es una secuencia numérica, donde el último valor obtenido, en la suma de los dos predecesores.
"""
# Declaración de variables
"""
Dado que Python es debilmente tipado
no hay tipos de datos en la declaración de 
variables. Se asumen como objetos de las
clases float() o int()

n1 = float() # 1er. número de la serie
n2 = float() # 2do. número de la serie
n = int() # Cantidad de valores a producir
i = int() # Variable contador
suma = float() # Suma de valores
"""
# Inicialización de variables
n1 = 0
n2 = 0
n = 0
i = 2
suma = 0
# Entrada de datos
print("Ingrese el valor del 1er. nÚmero de la serie:")
n1 = float(input())
print("Ingrese el valor del 2do. nÚmero de la serie:")
n2 = float(input())
print("Ingrese el nÚmero de valores que tendrá la  serie:")
n = int(input())
# Se escriben los dos primeros números de la serie
print(n1)
print(n2)
while i < n:
    suma = n1 + n2
    print(suma)
    n1 = n2
    n2 = suma
    i = i + 1
print("Fin del programa")