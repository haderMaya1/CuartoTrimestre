import mysql.connector
#Este es el insertar
con = mysql.connector.connect(host="localhost", user="root", password="",database="inversiones")
cursor = con.cursor()
sqlInsert = "insert into tb_inversiones(cant_inversion,fecha,tipo_inversion,reinversion,ganancias) values(%s,%s,%s,%s,%s)"
datos = ("128000","2022-08-17 01:40","Caja y cheque","","12000")
cursor.execute(sqlInsert,datos)
con.commit()
"""for tbl in cursor:
    print(tbl)/Solo para imprimir en pantalla
    lo que posiciones en el cursor.execute()"""
con.close()