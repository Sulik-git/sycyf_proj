import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import correlate
import scipy.io.wavfile as wav

rate, arrReceivedA = wav.read("D:/REPO/SYF_PROJ/python/resource/PointA_signal8.wav")
reete,arrReceivedB = wav.read("D:/REPO/SYF_PROJ/python/resource/x_signal8.wav")
arrSent=[]



#Pobranie wartości dla próbek sygnału z pliku tekstowego i zapisanie ich w macierzy
#with open("D:/REPO/SYF_PROJ/signalB.txt",'r') as f:
 #   for line in f.readlines():
  #      line = line.replace('\n','')
   #     line = float(line)
    #    arrReceivedA.append(line)

#with open("receivedB.txt",'r') as f:
 #   for line in f.readlines():
  #      line = line.replace('\n','')
   #     line = float(line)
    #    arrReceivedB.append(line)

#with open("D:/REPO/SYF_PROJ/.txt",'r') as f:
 #   for line in f.readlines():
  #      line = line.replace('\n','')
   #     line = float(line)
    #    arrSent.append(line)


arrA = np.array(arrReceivedA)
#arrB = np.array(arrReceivedB)
arrS = np.array(arrReceivedB)

#Korelacja wzajemna dwóch sygnałów
correlateAS = correlate(arrS,arrA,method="direct")
#correlateBS = correlate(arrB,arrS)

#Pobranie indeksu maksymalnej wartości
prob1 = np.argmax(correlateAS)
print(prob1)
print(correlateAS[638])
#prob2 = np.argmax(correlateBS)

#Okreslenie wartości opóźnienia
#pointA = prob1 - (len(arrS)-1)
#pointB = prob2 - (len(arrS)-1)

#Czas propagacji sygnału do drona wyrażona w sekundach
#timeA = (pointA/1000000)/2
#timeB = (pointB/1000000)/2

#Prędkość światła w powietrzu
#v = 299711000

#Droga jaką pokonał sygnał
#radiousA = v*timeA
#radiousB = v*timeB

#print("Promień z punktu A: ",round(radiousA/1000,5),"km")
#print("Promien z punktu B: ",round(radiousB/1000,5),"km")

#plt.figure(1)
#print("Opóźnienie dla sygnału A względem sygnału wysłanego = ",pointA,"próbek")
#plt.plot(np.arange(len(correlateAS))-(len(arrS)-1),correlateAS)
#plt.title("Korelacja sygnału receivedA i sygnału wysłanego")

#plt.figure(2)
#print("Opóźnienie sygnału B względem sygnału wysłanego = ",pointB,"próbek")
#plt.plot(np.arange(len(correlateBS))-(len(arrS)-1),correlateBS)
#plt.title("Korelacja sygnału receivedB i sygnału wysłanego")
#plt.show()


