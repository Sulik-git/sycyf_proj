import scipy.io.wavfile as wav

samplesA, dataA = wav.read("D:/REPO/SYF_PROJ/python/resource/PointB_signal8.wav")

bitA = []
bitB = []
bitAS = []
bitBS = []
bitS = []
bitSS = []



for sA in range(0,len(dataA)):
    bitA.append(format(dataA[sA],'008b'))

for bSA in bitA:
    for bA in bSA:
        bitAS.append(bA)


with open("signalBBin.txt","w") as f:
    for bA in range(0,len(bitA)):
        f.write(bitA[bA] + "\n")