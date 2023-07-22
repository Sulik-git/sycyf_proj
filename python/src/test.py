import scipy.io.wavfile as io

#Testowo załadowany plik wypisuje częstotliwość próbkowania oraz wartości dla każdej próbki

rateA, dataB= io.read("resource/PointA_signal8.wav")

print(rateA)
for d in dataB:
    print(d)

