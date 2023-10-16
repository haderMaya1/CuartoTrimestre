#Hacemos las importaciones y configuraciones necesarias
import mysql.connector
from mysql.connector import Error
""""
HADER ELDIR MAYA MUNOZ 
FICHA 2340534
"""""
#Realizamos una clase
class DAO():
    #DATA ACCESS OBJECT(DAO)
    #Definimos la clase y hacemos la conexión
    def __init__(self):
        try:
            self.conexion=mysql.connector.connect(
                host='localhost',
                port='3306',
                user='root',
                password='',
                db='inversiones'
            )
            #Si la conexión falla, enviamos mensaje de error
        except Error as ex:
            print("Error al interntar la conexión: {0}".format(ex))

    #Metodo para listar
    def listarSocios(self):
        if self.conexion.is_connected():
            try:
                cursor=self.conexion.cursor()
                cursor.execute("Select * FROM tb_socios ORDER BY id")
                result=cursor.fetchall()
                return result
            except Error as ex:
                print("Error al interntar la conexión: {0}".format(ex))

    def listarInv(self):
        if self.conexion.is_connected():
            try:
                cursor=self.conexion.cursor()
                cursor.execute("Select * FROM tb_inversiones ORDER BY id")
                result=cursor.fetchall()
                return result
            except Error as ex:
                print("Error al interntar la conexión: {0}".format(ex))

    def listarMovInv(self):
        if self.conexion.is_connected():
            try:
                cursor=self.conexion.cursor()
                cursor.execute("Select * FROM tb_mov_inversiones_socios ORDER BY id")
                result=cursor.fetchall()
                return result
            except Error as ex:
                print("Error al interntar la conexión: {0}".format(ex))
    
    def registroSocio(self, socio):
        if self.conexion.is_connected():
            try:
                cursor=self.conexion.cursor()
                sql="INSERT INTO tb_socios (dni, nombre, apellido, direccion, telefono, sexo) values({0},'{1}','{2}','{3}','{4}','{5}')"
                cursor.execute(sql.format(socio[0], socio[1], socio[2], socio[3], socio[4], socio[5]))
                self.conexion.commit()
                print("\n===================================")
                print("\n¡Socio registrado correctamente!")
                print("\n===================================")
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))

    def registroInv(self, inv):
        if self.conexion.is_connected():
            try:
                cursor=self.conexion.cursor()
                sql="INSERT INTO tb_inversiones (cant_inversion, fecha, tipo_inversion, reinversion, ganancias) values({0},'{1}','{2}',{3},{4},{5})"
                cursor.execute(sql.format(inv[0], inv[1], inv[2], inv[3], inv[4]))
                self.conexion.commit()
                print("\n===================================")
                print("\n¡Inversion registrada correctamente!")
                print("\n===================================")
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))

    def registromI(self, mI):
        if self.conexion.is_connected():
            try:
                cursor=self.conexion.cursor()
                sql="INSERT INTO tb_mov_inversiones_socios (id_socio, id_inversion, valor, fecha_inversion) values({0},{1},{2},{3},'{4}')"
                cursor.execute(sql.format(mI[0], mI[1], mI[2], mI[3], mI[4]))
                self.conexion.commit()
                print("\n===================================")
                print("\n¡Movimiento registrado correctamente!")
                print("\n===================================")
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex)) 



    def actualizarSocio(self, socios):
         if self.conexion.is_connected():
            try:
                cursor=self.conexion.cursor()
                sql="UPDATE tb_socios SET dni ='{1}', nombre ='{2}', apellido ='{3}', direccion ='{4}', telefono ='{5}', sexo ='{6}' WHERE id = {0}"
                cursor.execute(sql.format(socios[1], socios[2], socios[3], socios[4], socios[5], socios[6],socios[0]))
                self.conexion.commit()
                print("\n===================================")
                print("\n¡Socio actualizado correctamente!")
                print("\n===================================")
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))      

    def actualizarmI(self, mI):
         if self.conexion.is_connected():
            try:
                cursor=self.conexion.cursor()
                sql="UPDATE tb_mov_inversiones_socios SET id_socio ={1}, id_inversion ={2}, valor ={3}, fecha_inversion ='{4}' WHERE id = {0}"
                cursor.execute(sql.format(mI[0], mI[1], mI[2], mI[3], mI[4]))
                self.conexion.commit()
                print("\n===================================")
                print("\n¡Moviemiento actualizado correctamente!")
                print("\n===================================")
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))     

    def actualizarInv(self, inv):
         if self.conexion.is_connected():
            try:
                cursor=self.conexion.cursor()
                sql="UPDATE tb_inversiones SET cant_inversion ={1}, fecha ='{2}', tipo_inversion = '{3}', reinversion ={4}, ganancias ='{5}' WHERE tb_inversion IS nullid = {0}"
                cursor.execute(sql.format(inv[0], inv[1], inv[2], inv[3], inv[4], inv[5]))
                self.conexion.commit()
                print("\n===================================")
                print("\n¡Inversion actualizado correctamente!")
                print("\n===================================")
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))          

    def eliminarSocios(self, elmSocio):
        if self.conexion.is_connected():
            try:
                cursor=self.conexion.cursor()
                sql="DELETE FROM tb_socios WHERE id ={0}" 
                cursor.execute(sql.format(elmSocio))
                self.conexion.commit()
                print("\n===================================")
                print("\n¡El Socio eliminado correctamente!")
                print("\n===================================")
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))    


    def eliminarmI(self, elmMI):
        if self.conexion.is_connected():
            try:
                cursor=self.conexion.cursor()
                sql="DELETE FROM tb_mov_inversiones_socios WHERE id ={0}" 
                cursor.execute(sql.format(elmMI))
                self.conexion.commit()
                print("\n===================================")
                print("\n¡El Moviemiento se eliminado correctamente!")
                print("\n===================================")
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))    

    def eliminarInv(self, elmInv):
        if self.conexion.is_connected():
            try:
                cursor=self.conexion.cursor()
                sql="DELETE FROM tb_inversiones WHERE id ={0}" 
                cursor.execute(sql.format(elmInv))
                self.conexion.commit()
                print("\n===================================")
                print("\n¡La inversion se eliminado correctamente!")
                print("\n===================================")
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))


