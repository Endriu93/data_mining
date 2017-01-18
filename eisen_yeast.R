library("biclust") 

# heatmap macierzy z domyœlnie wykonan¹ klasteryzacj¹
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

# number - iloœæ biklastrów do znalezienia
# method - algorytm
# delta - maksymalne ró¿nice miêdzy wartoœciami w klastrze
bccc <- biclust(x, method=BCCC(), delta = 0.1, alpha=10, number=10) 

png(filename="EISENYeast_CC.png")
# wykres klastrów
heatmapBC(x,bccc,0)
dev.off()

#--------------------------------------------------- 
# algorytm 2: Xmotifs - XMotifs Biclustering 
#---------------------------------------------------

x<-data(EisenYeast)
x<-discretize(EisenYeast)  

# number - iloœæ biklastrów do znalezienia
# method - algorytm
# delta - maksymalne ró¿nice miêdzy wartoœciami w klastrze
# ns - liczba wybranych kolumn
# nd - liczba powtórzeñ
# 
Xmotif <- biclust(x, method=BCXmotifs(), ns=5, nd=100, sd=5, alpha=0.01, number=100) 

png(filename="EISENYeast_XMotifs.png")
# wykres klastrów
heatmapBC(x,Xmotif,0)
dev.off()

#--------------------------------------------------- 
# algorytm 3: Questmotif - a Bicluster algorithm for questionairs 
#---------------------------------------------------

x<-data(EisenYeast)
x<-discretize(EisenYeast) 

# number - iloœæ biklastrów do znalezienia
# method - algorytm
# delta - maksymalne ró¿nice miêdzy wartoœciami w klastrze
# ns - liczba wybranych kolumn
# nd - liczba powtórzeñ
# 
quest <- biclust(x, method=BCQuest(), ns=5, nd=100, sd=5, alpha=0.01, number=100) 

png(filename="EISENYeast_QUEST.png")
# wykres klastrów
heatmapBC(x,quest,0)
dev.off()

jaccardind(bccc,quest)
jaccardind(quest,Xmotif)
jaccardind(Xmotif,bccc)
