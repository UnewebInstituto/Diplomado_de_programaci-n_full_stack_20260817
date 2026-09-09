#Ejemplo 6 Serie Fibonacci Mientras
'''
n1 = float()
n2 = float()
n = int()
i = int()
suma = float()
'''
n1 = 0
n2 = 0
n = 0
i = 2
suma = 0

print('Ingrese el valos del 1er numero de la serie:')
n1 = float(input())
print('Ingrese el valos del 2do numero de la serie:')
n2 = float(input())
print ('Ingrese el numero de valores que tendra la serie:')
n = int(input())
print(n1)
print(n2)
while i < n:
    suma = n1 + n2
    print(suma)
    n1 = n2
    n2 = suma
    i = i + 1
print ('fin del programa')
