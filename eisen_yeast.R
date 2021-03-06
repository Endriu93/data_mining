library("biclust") 

# heatmap macierzy z domy�lnie wykonan� klasteryzacj�
#heatmap(x,bicResult = NULL)

####################################################
# test zbioru BicatYeast: 
# rozmiar zbioru: rows: 419, columns: 70
# opis zbioru:
####################################################

#--------------------------------------------------- 
# algorytm 1: CC - Chung & Church Algorithm
#---------------------------------------------------

x<-data(EisenYeast)
x<-discretize(EisenYeast)  

# number - ilo�� biklastr�w do znalezienia
# method - algorytm
# delta - maksymalne r�nice mi�dzy warto�ciami w klastrze
bccc <- biclust(x, method=BCCC(), delta = 0.1, alpha=10, number=10) 

png(filename="EISENYeast_CC.png")
# wykres klastr�w
heatmapBC(x,bccc,0)
dev.off()

#--------------------------------------------------- 
# algorytm 2: Xmotifs - XMotifs Biclustering 
#---------------------------------------------------

x<-data(EisenYeast)
x<-discretize(EisenYeast)  

# number - ilo�� biklastr�w do znalezienia
# method - algorytm
# delta - maksymalne r�nice mi�dzy warto�ciami w klastrze
# ns - liczba wybranych kolumn
# nd - liczba powt�rze�
# 
Xmotif <- biclust(x, method=BCXmotifs(), ns=5, nd=100, sd=5, alpha=0.01, number=100) 

png(filename="EISENYeast_XMotifs.png")
# wykres klastr�w
heatmapBC(x,Xmotif,0)
dev.off()

#--------------------------------------------------- 
# algorytm 3: Questmotif - a Bicluster algorithm for questionairs 
#---------------------------------------------------

x<-data(EisenYeast)
x<-discretize(EisenYeast) 

# number - ilo�� biklastr�w do znalezienia
# method - algorytm
# delta - maksymalne r�nice mi�dzy warto�ciami w klastrze
# ns - liczba wybranych kolumn
# nd - liczba powt�rze�
# 
quest <- biclust(x, method=BCQuest(), ns=5, nd=100, sd=5, alpha=0.01, number=100) 

png(filename="EISENYeast_QUEST.png")
# wykres klastr�w
heatmapBC(x,quest,0)
dev.off()

jaccardind(bccc,quest)
jaccardind(quest,Xmotif)
jaccardind(Xmotif,bccc)
