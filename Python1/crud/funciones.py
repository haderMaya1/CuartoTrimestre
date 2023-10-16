# importante para no sobrecargar el archivo principal con los metodos que usaremos
from datetime import date
# HADER ELDIR MAYA MUNOZ
# FICHA 2340534

def listarSocios(socios):
    print("\nSocios: \n")
    contador = 1
    for soc in socios:
        datos = "{0}. id:{1}| Dni: {2} | Nombre: {3} | Apellido: {4} | Direccion: {5} | Telefono: {6} | Sexo: {7}"
        print(datos.format(contador, soc[0], soc[1],
              soc[2], soc[3], soc[4], soc[5], soc[6]))
        contador = contador+1
    print(" ")


def listarInv(inv):
    print("\nInversiones: \n")
    contador = 1
    for inv in inv:
        datos = "{0}. id:{1}| cant_inversion: {2} | fecha: {3} | tipo: {4} | reinversion: {5} | ganancias: {6}"
        print(datos.format(contador, inv[0], inv[1],
              inv[2], inv[3], inv[4], inv[5], inv[6]))
        contador = contador+1
    print(" ")


def listarMovInv(mI):
    print("\nMovimientos: \n")
    contador = 1
    for mI in mI:
        datos = "{0}. id:{1}| id_socio: {2} | id_inversion: {3} | valor: {4} | fecha_inversion: {5}"
        print(datos.format(contador, mI[0], mI[1],
              mI[2], mI[3], mI[4], mI[5]))
        contador = contador+1
    print(" ")


def insertarRegistro():
    dni = input("Ingrese Dni: ")
    nombre = input("Ingrese su nombre: ")
    apellido = input("Ingrese su apellido: ")
    direccion = input("Ingrese su dirección: ")
    telefono = input("Ingrese su telefono: ")
    sexo = input("Ingrese su genero: ")

    socio = (dni, nombre, apellido, direccion, telefono, sexo)
    return socio


def insertarRegistro():
    id_socio = int(input("Ingrese id del socio: "))
    id_inversion = int(input("Ingrese id inversion: "))
    valor = float(input("Ingrese el valor:"))
    fecha_inversion = date(input("Ingresa fecha invrsion: "))

    mI = (id_socio, id_inversion, valor, fecha_inversion)
    return mI


def insertarRegistro():
    cant_inversion = float(input("Ingrese la cantidad de inversion: "))
    fecha = date(input("Ingrese una fecha: "))
    tipo_inversion = input("Ingrese una descripcion: ")
    reinversion = float(input("Ingrese la cantidad reinvertido: "))
    ganancias = float(input("Ingrese las ganancias obteidas: "))

    inv = (cant_inversion, fecha, tipo_inversion, reinversion, ganancias)
    return inv


def actualizarRegistro(socios):
    listarSocios(socios)
    codEdit = False
    editSocios = int(input("Ingrese el ID que desea editar:"))
    for soc in socios:
        if soc[0] == editSocios:
            codEdit = True
            break

    if codEdit:
        dni = input("Ingrese Dni a modificar: ")
        nombre = input("Ingrese su nombre a modificar: ")
        apellido = input("Ingrese su apellido a modificar: ")
        direccion = input("Ingrese su dirección a modificar: ")
        telefono = input("Ingrese su telefono a modificar: ")
        sexo = input("Ingrese su genero a modificar: ")
        id = print("id = '?'")

        socios = (editSocios, dni, nombre, apellido,
                  direccion, telefono, sexo, id)
    else:
        socios = None

    return socios


def actualizarRegistro(mI):
    listarMovInv(mI)
    codEdit = False
    editmI = int(input("Ingrese el ID que desea editar:"))
    for movIn in mI:
        if movIn[0] == editmI:
            codEdit = True
            break

    if codEdit:
        id_socio = int(input("Ingrese id del socio: "))
        id_inversion = int(input("Ingrese id inversion: "))
        valor = float(input("Ingrese el valor:"))
        fecha_inversion = date(input("Ingresa fecha invrsion: "))

        mI = (id_socio, id_inversion, valor, fecha_inversion, id)
        return mI
    else:
        mI = None
    return mI


def actualizarRegistro(inv):
    listarInv(inv)
    codEdit = False
    editInv = int(input("Ingrese el ID que desea editar:"))
    for Inv in inv:
        if Inv[0] == editInv:
            codEdit = True
            break

    if codEdit:
        cant_inversion = float(input("Ingrese la cantidad de inversion: "))
        fecha = date(input("Ingrese una fecha: "))
        tipo_inversion = input("Ingrese una descripcion: ")
        reinversion = float(input("Ingrese la cantidad reinvertido: "))
        ganancias = float(input("Ingrese las ganancias obteidas: "))

        inv = (cant_inversion, fecha, tipo_inversion, reinversion, ganancias)
        return inv
    else:
        inv = None
    return inv


def actualizarRegistro(mI):
    listarMovInv(mI)
    codEdit = False
    editmI = int(input("Ingrese el ID que desea editar:"))
    for movIn in mI:
        if movIn[0] == editmI:
            codEdit = True
            break

    if codEdit:
        id_socio = int(input("Ingrese id del socio: "))
        id_inversion = int(input("Ingrese id inversion: "))
        valor = float(input("Ingrese el valor:"))
        fecha_inversion = date(input("Ingresa fecha invrsion: "))

        mI = (id_socio, id_inversion, valor, fecha_inversion, id)
        return mI
    else:
        mI = None
    return mI


def eliminarRegistro(socios):
    listarSocios(socios)
    codElim = False
    elmSocios = int(input("Ingrese el ID que desea eliminar:"))
    for soc in socios:
        if soc[0] == elmSocios:
            codElim = True
            break

    if not codElim:
        elmSocios == int

    return elmSocios


def eliminarRegistro(inv):
    listarInv(inv)
    codElim = False
    elmInv = int(input("Ingrese el ID que desea eliminar:"))
    for inva in inv:
        if inva[0] == elmInv:
            codElim = True
            break

    if not codElim:
        elmInv == int

    return elmInv


def eliminarRegistro(mI):
    listarMovInv(mI)
    codElim = False
    elmmI = int(input("Ingrese el ID que desea eliminar:"))
    for mI in mI:
        if mI[0] == elmmI:
            codElim = True
            break

    if not codElim:
        elmmI == int

    return elmmI
