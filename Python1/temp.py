#print ("hellow world")

#Sangria de identacion

if 5 < 20:
    print ("5 es menor que 20")
    if 5 < 20:
       print ("5 no es menor que 20")
       

#Variables
nombre = 5
print(nombre)
nombre = "Javier"
print(nombre)     

"""
Tipos de datos
dato = str (3)
dato = int (3)
dato = float (3)
"""

dato = str (3)
print (type(dato))
print (dato)
dato = int (3)
print (type(dato))
print (dato)
dato = float (3)
print (type(dato))
print (dato)

nombre = "dani"
print (nombre)
nOmbre = "sadda"
print (nOmbre)

"""
mi-nombre = 'lina'
print (mi-nombre)
2apellidos = 'sena'

No pueden usarse numeros y caracteres especiales
"""
nom, apellido, dire= "camilo", "serna", "calle32"

print (apellido, dire, nom)


nom=apellido=dire= "camilo"
print(nom,apellido,dire)

Colores=["Rojo","Verde","Azul"]
print (Colores[2])
edad = 20
color1,color2,color3=Colores
print("Aqui estan los colores: "+color1,color2,color3,edad)

nombre="Hader"
def  imprimir():
    print (nombre)
imprimir()

apellidos="Maya"
def assis(nombre,apellidos):
    print(nombre,apellidos)
assis(nombre, apellidos)

"""
Reemplazo de elementos en Python
"""
lenguajes = ['Java','Php','Python','Kotlin']
print(lenguajes)

lenguajes [2:3]=['Python','Csharp']
print(lenguajes)

"""
Para la proxima clase

Crear una funcion que
organice los parametros para conformar una palabra o organice los datos
de manera logica

ej: 0 1 2 3 4 5 
    c m a l i o
    
    c a m i l o
"""
nombre=['c','m','a','l','i','o']
def camilo(nombre)