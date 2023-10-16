from unittest import FunctionTestCase
from bd.conexion import DAO
import funciones

#HADER ELDIR MAYA MUNOZ FICHA:2340534

def menuPrincipal():
    continuar = True
    while (continuar):
        opcionCorrecta = False
        while (not opcionCorrecta):
            print(" ]=================================[")
            print(" ]=================================[")
            print(" ]========= MENU PRINCIPAL ========[")
            print(" ]=====1. LISTA DE SOCIOS =========[")
            print(" ]=====2. LISTA DE INVERSIONES=====[")
            print(" ]=====3. LISTA DE MOVIMIENTOS ====[")
            print(" ]=====4. REGISTRAR SOCIO =========[")
            print(" ]=====5. REGISTRAR INVERSIONES ===[")
            print(" ]=====6. REGISTRAR MOVIMIENTOS ===[")
            print(" ]=====7. ACTUALIZAR SOCIO ========[")
            print(" ]=====8. ACTUALIZAR INVERSIONES ==[")
            print(" ]=====9. ACTUALIZAR MOVIMIENTOS ==[")
            print(" ]=====10. ELIMINAR SOCIO =========[")
            print(" ]=====11. ELIMINAR INVERSIONES ===[")
            print(" ]=====12. ELIMINAR MOVIMIENTOS ===[")
            print(" ]=====13. SALIR ================ =[")
            print(" ]=================================[")
            print(" ]=================================[")
            opcion = int(input("Seleccione una opción por favor: "))


            if opcion < 1 or opcion > 10:
                print("Opción no valida, intente de nuevo. . .")
            elif opcion == 10:
                continuar = False
                print("¡Nos veremos luego!")
                break
            else:
                opcionCorrecta = True
                ejecutarAccion(opcion)


def ejecutarAccion(opcion):
    dao = DAO()

    if opcion == 1:
        try:
            socios = DAO.listarSocios()
            if len(socios) > 0:
                funciones.listarSocios(socios)
            else:
                print("No se encontraron registros")
        except:
            print("Ocurrio un eror, ejecuta de nuevo")
    if opcion == 2:
        try:
            inv = DAO.listarInv()
            if len(inv) > 0:
                funciones.listarInv(inv)
            else:
                print("No se encontraron registros")
        except:
            print("Ocurrio un eror, ejecuta de nuevo")
    if opcion == 3:
        try:
            inv = DAO.listarMovInv()
            if len(inv) > 0:
                funciones.listarMovInv(inv)
            else:
                print("No se encontraron registros")
        except:
            print("Ocurrio un eror, ejecuta de nuevo")
    elif opcion == 4:
        socio = funciones.insertarRegistro()
        try:
            socio = DAO.registroSocio(socio)
        except:
            print("Algo ha salido mal, revisa")
    elif opcion == 5:
        inv = funciones.insertarRegistro()
        try:
            inv = DAO.registroInv(inv)
        except:
            print("Algo ha salido mal, revisa")
    elif opcion == 6:
        mI = funciones.insertarRegistro()
        try:
            mI = DAO.registromI(mI)
        except:
            print("Algo ha salido mal, revisa")
    elif opcion == 7:
        try:
            socios = DAO.listarSocios()
            if len(socios) > 0:
                editSocios = funciones.actualizarRegistro(socios)
                if editSocios:
                    DAO.actualizarSocio(socios)
                else:
                    print("Codigo del socio no encontrado")
            else:
                print("No se encontraron registros")
        except:
            print("Algo salio mal, inteta de nuevo")
    elif opcion == 8:
        try:
            inv = DAO.listarInv()
            if len(socios) > 0:
                editInv = funciones.actualizarRegistro(inv)
                if editInv:
                    DAO.actualizarInv(inv)
                else:
                    print("Codigo del socio no encontrado")
            else:
                print("No se encontraron registros")
        except:
            print("Algo salio mal, inteta de nuevo")
    elif opcion == 9:
        try:
            mI = DAO.listarMovInv()
            if len(mI) > 0:
                editmI = funciones.actualizarRegistro(mI)
                if editmI:
                    DAO.actualizarmI(mI)
                else:
                    print("Codigo del socio no encontrado")
            else:
                print("No se encontraron registros")
        except:
            print("Algo salio mal, inteta de nuevo")
    elif opcion == 10:
            try:
                socios = DAO.listarSocios()
                if len(socios) > 0:
                    elmSocio = funciones.eliminarRegistro(socios)
                    if not (elmSocio == ""):
                        DAO.eliminarSocios(elmSocio)
                    else:
                        print("No se hayo el ID")
                else:
                    print("No se encontraron registros")
            except:
                print("Algo salio mal, inteta de nuevo")
    if not(opcion == 10):
        print("Opción no válida...")
    elif opcion == 11:
            try:
                inv = DAO.listarInv()
                if len(inv) > 0:
                    elmInv = funciones.eliminarRegistro(inv)
                    if not (elmInv == ""):
                        DAO.eliminarInv(elmInv)
                    else:
                        print("No se hayo el ID")
                else:
                    print("No se encontraron registros")
            except:
                print("Algo salio mal, inteta de nuevo")
    if not(opcion == 11):
        print("Opción no válida...")
    elif opcion == 12:
            try:
                mI = DAO.listarMovInvr()
                if len(mI) > 0:
                    elmmI = funciones.eliminarRegistro(mI)
                    if not (elmmI == ""):
                     DAO.eliminarmI(elmmI)
                    else:
                        print("No se hayo el ID")
                else:
                    print("No se encontraron registros")
            except:
                print("Algo salio mal, inteta de nuevo")
    if not(opcion == 12):
        print("Ok, Otra opcion")


menuPrincipal()
