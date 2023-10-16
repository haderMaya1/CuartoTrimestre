import mysql.connector
#Este es el insertar
con = mysql.connector.connect(host="localhost", user="root", password="",database="inversiones")
cursor = con.cursor()
sqlInsert = "update tb_socios set dni=?,nombre=?,apellido=?,direccion=?,telefono=?,sexo=? where id=?"
datos = ()
cursor.execute(sqlInsert,datos)
con.commit()
"""for tbl in cursor:
    print(tbl)/Solo para imprimir en pantalla
    lo que posiciones en el cursor.execute()"""
con.close()