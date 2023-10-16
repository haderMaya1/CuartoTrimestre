import mysql.connector
from mysql.connector import Error

class DAO():
    #DATA ACCESS OBJECT(DAO)
    #Definimos la clase y hacemos la conexión
    def open(self):
        try:
            conexion=mysql.connector.connect(
                host='localhost',
                port='3306',
                user='root',
                password='',
                db='pytk'
            )
            return conexion
            #Si la conexión falla, enviamos mensaje de error
        except Error as ex:
            print("Error al interntar la conexión: {0}".format(ex))

    def alta (self, datos):
        conn=self.open()
        cursor=conn.cursor()
        sql="INSERT INTO person(name,lastname,password) vlaues(%s,%s,%s)"       
        cursor.execute (sql, datos)
        conn.close()
        return cursor.fetchall()

    def alta (self, datos):
        conn=self.open()
        cursor=conn.cursor()
        sql="SELECT * FROM person WHERE id=%s"       
        cursor.execute (sql, datos)
        conn.close()
        return cursor.fetchall()