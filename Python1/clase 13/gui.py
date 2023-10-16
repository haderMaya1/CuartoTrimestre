import tkinter as tk
from tkinter import messagebox as mb
from tkinter import scrolledtext as st
from mysqlx import Column
import mysql.connector
from mysql.connector import Error


class Conexion():
    def conexion(self):
        try:
            conexion = mysql.connector.connect(
                host='localhost',
                port='3306',
                user='root',
                password='',
                db='pytk'
            )
            return conexion
        except Error as ex:
            print("Error al conectar: {0}".format(ex))


class Window:
    def __init__(self):
        self.name = name.changeName()
        self.v = tk.Tk()
        self.v.title("My frist Window!")
        # CREAR LABEL
        self.etNombre = tk.Label(self.v, text="Firstname: ")
        self.etNombre.grid(column=1, row=1)
        self.etApellido = tk.Label(self.v, text="Lastname: ")
        self.etApellido.grid(column=1, row=2)
        self.etClave = tk.Label(self.v, text="Password: ")
        self.etClave.grid(column=1, row=3)

        self.btnPrn = tk.Button(self.v, text="Enviar:",
                                command=self.changeName)
        self.btnPrn.grid(column=1, row=4)
        self.btnPrn.configure(foreground="black")

        # Camp for insert text
        self.valueCampN = tk.StringVar()
        self.nameValue = tk.Entry(
            self.v, width=10, textvariable=self.valueCampN)
        self.nameValue.grid(column=2, row=1)

        self.valueCampL = tk.StringVar()
        self.lastNmValue = tk.Entry(
            self.v, width=10, textvariable=self.valueCampL)
        self.lastNmValue.grid(column=2, row=2)

        self.valueCampP = tk.StringVar()
        self.passWdValue = tk.Entry(
            self.v, width=10, textvariable=self.valueCampP)
        self.passWdValue.grid(column=2, row=3)

        self.v.mainloop()

    def changeName(self):
        conn = self.open()
        cursor = conn.cursor()
        sql = "INSERT INTO person(name,lastname,password) values(%s,%s,%s)"      
        datos = (self.valueCampN.get(),
                 self.valueCampL.get(), self.valueCampP.get())
        cursor.execute(sql, datos)
        conn.close()
        return cursor.fetchall()
        self.valueCampL.set("")
        self.valueCampN.set("")
        self.valueCampP.set("")
        mb.showinfo("Se ha cargado la información")


objWindow = Window()
