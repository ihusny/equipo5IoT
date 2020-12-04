import mysql.connector
import random
from os import system, name

def crearPerfil(cnx, cursor):
    system('clear')
    nombre = input("Introduzca su nombre: ")
    apellido = input("Introduzca su apellido: ")
    edad = input("Introduzca su edad: ")
    query_data = (nombre, apellido, edad)
    query = f"INSERT INTO Perfiles(id_perfil, apellido, edad) values (%s, %s, %s);"
    cursor.execute(query, query_data)
    cnx.commit()

def introducirDatos(cnx, cursor, medicion, opciones):
    system('clear')
    id_perfil = int(input("Introduzca su id: "))
    dia = input("Introduzca el día: ")
    mes = input("Introduzca su mes: ")
    fecha = "2020-"+str(mes)+"-"+str(dia)
    query_data = (id_perfil, medicion, fecha)

    if(opciones=="cardio"):
        query = f"INSERT INTO Perfiles(id_perfil, medicion_cardio, fecha) values (%s, %s, %s);"
    elif(opciones=="oxi"):
        query = f"INSERT INTO Perfiles(id_perfil, medicion_oxi, fecha) values (%s, %s, %s);"

    cursor.execute(query, query_data)
    cnx.commit()

try:
    cnx = mysql.connector.connect(user='root', password='0412M4sql.', host='127.0.0.1', database='reto_sensor')

    cursor = cnx.cursor()

    # do:
    #     reset = input("¿Desea resetear los datos (S/N)? "))
    #
    #     if(reset.at(0)=='S'):
    #         query = "DELETE FROM Sensor_oxi";
    #         cursor.execute(query)
    #         cnx.commit()
    #         query = "DELETE FROM Sensor_cardio";
    #         cursor.execute(query)
    #         cnx.commit()
    #         query = "DELETE FROM Perfiles";
    #         cursor.execute(query)
    #         cnx.commit()
    #         query = "ALTER TABLE tablename AUTO_INCREMENT = 1";
    #         cursor.execute(query)
    #         cnx.commit()
    # while(reset!='S' || reset=!'N')

    #CREAR PERFILES
    limit = int(input("¿Cuantos usuarios quieres agregar? "))
    if (limit > 0):
        for i in range(limit):
            crearPerfil(cnx, cursor)

    #INTRODUCIR Datos
    introducirDatos(cnx, cursor, medicion_cardio, "cardio")
    introducirDatos(cnx, cursor, medicion_oxi, "oxi")




except mysql.connector.Error as err:

  if err.errno == mysql.connector.errorcode.ER_ACCESS_DENIED_ERROR:
    print("Something is wrong with your user name or password")
  elif err.errno == mysql.connector.errorcode.ER_BAD_DB_ERROR:
    print("Database does not exist")
  else:
    print("Error:")
    print(err)

finally:
  if 'cnx' in locals() or 'cnx' in globals():
    cnx.close()
