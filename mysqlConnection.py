import mysql.connector
import random
from os import system, name

def crearPerfil(cnx, cursor):
    system('clear')
    nombre = input("Introduzca su nombre: ")
    apellido = input("Introduzca su apellido: ")
    edad = input("Introduzca su edad: ")
    query_data = (nombre, apellido, edad)
    query = f"INSERT INTO Perfiles(nombre, apellido, edad) values (%s, %s, %s);"
    cursor.execute(query, query_data)
    cnx.commit()

try:
    cnx = mysql.connector.connect(user='root', password='0412M4sql.', host='127.0.0.1', database='reto_sensor')

    cursor = cnx.cursor()


    limit = int(input("¿Cuantos usuarios quieres agregar? "))

    if (limit > 0):
        for i in range(limit):
            crearPerfil(cnx, cursor)

# for i in range(5, 7):
#     for j in range(1000):
#         query = f"INSERT INTO Sensor_cardio(id_perfil, medicion_cardio, fecha) values("+ str(i)+ ", "+str(random.randint(50, 120))+", '2020-11-10');"
#         cursor.execute(query)
#         cnx.commit()
#         query = f"INSERT INTO Sensor_oxi(id_perfil, medicion_oxi, fecha) values("+str(i)+", "+str(random.randint(70, 100))+", '2020-11-10');"
#         cursor.execute(query)
#         cnx.commit()


    for i in range(5, 7):
        for j in range(1000):

            query_data = (i, str(random.randint(50, 120)), '2020-11-10')
            query = f"INSERT INTO Sensor_cardio(id_perfil, medicion_cardio, fecha) values(%s, %s, %s);"
            cursor.execute(query, query_data)
            cnx.commit()

            query_data = (i, str(random.randint(70, 100)), '2020-11-10')
            query = f"INSERT INTO Sensor_oxi(id_perfil, medicion_oxi, fecha) values(%s, %s, %s);"
            cursor.execute(query, query_data)
            cnx.commit()


    # last_id = [result[0] for result in cursor][-1]
    # limit = input("¿Cuantos usuarios quieres agregar? ")
    # for id_perfil in range(last_id+1, last_id+limit):
    #     system('clear')
    #     name = input("Introduzca su nombre: ")
    #     apellido = input("Introduzca su apellido: ")
    #     edad = input("Introduzca su edad: ")
    #     query_data = (id_perfil, name, apellido, edad)
    #     query = f"INSERT INTO Perfiles(id_perfil, medicion_cardio, fecha) values (%s, %s, %s, %s);"
    #
    #     cursor.execute(query, query_data)



    # # List comprehension
    # last_id = [result[0] for result in cursor][-1]

    # # 18--> 19-29
    # for id_light in range(last_id+1, last_id+12):
    #   query_data = (id_light, False, 0)
    #   query = f"INSERT INTO lights(id_light, turned_on, intensity) values(%s, %s, %s);"

    #   cursor.execute(query, query_data)

    # update lights id_light > 18 turned_on true
    # query = f"UPDATE lights SET turned_on = false, intensity = 0;"

    # delte lights id_light > 5
    #query = f"DELETE FROM lights WHERE id_light > 7;"
    # cursor.execute(query)

    cnx.commit()

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
