import matplotlib.pyplot as plt
import numpy as np
import random
from scipy.signal import find_peaks
import serial



ser = serial.Serial("/dev/cu.usbmodem14201", 9600)
hrValues = []
miliValues = []
milis = []
Values = []


def analisisHR():
    global hrValues
    global miliValues
    valores = []
    valoresMili = []
    for i in range(0, 97):
        valores.append((hrValues[i]+hrValues[i+1]+hrValues[i+2])/3)
        valoresMili.append((miliValues[i]+miliValues[i+1]+miliValues[i+2])/3)
    subida = True
    palpitacionAnterior = 1
    for i in range(0, len(valores)):
        if (valores[i+1] > valores[i]):
            tiempo = valoresMili[i]

        else:
            tiempo = valoresMili[i]-palpitacionAnterior

            subida = False

    hrValues = hrValues[25:]
    miliValues = miliValues[25:]


count = 0
leer = True
while(leer):
    lineBytes = ser.readline()
    line = lineBytes.decode("ascii")
    if line[0:2] != "HR":
        continue
    line = line.rstrip()
    medidas = line.split(";")
    hr = int(medidas[0].split(":")[1])
    medidas = int(medidas[0].split(":")[1])
    miliValues.append(milis)
    if(len(hrValues) == 100):
        analisisHR()
    Values.append(hr)
    count += 1
    if (count == 1000):
        leer = False
    # print(hr)
    print(count/10, str("%"))
# print(Values)

# HR 35-36 sin dedo, 720-750 con dedo
# RED 200k +-500 sin dedo, 233k +-500 con dedo
# IR 2200+-100 sin dedo,  220500 +- 100 con dedo
# milis - tiempo en milisegundos




def smooth_curve_simple(points, sample_size):
    smoothed_points = [sum(points[i:i+sample_size]) /
    sample_size for i in range(0, len(points), sample_size)]
    return smoothed_points


def analisisHR2(hrValues, miliValues, sample_size):
    smoothed_values = smooth_curve_simple(hrValues, sample_size)
    peaks = find_peaks(smoothed_values)[0]
    valorHR = (60000*len(peaks))/(miliValues[-1]-miliValues[0])
    return valorHR






print(analisisHR2(Values,miliValues,20))



