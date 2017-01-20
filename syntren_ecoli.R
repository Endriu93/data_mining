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

x<-data(SyntrenEcoli)
x<-discretize(SyntrenEcoli)  

# number - iloœæ biklastrów do znalezienia
# method - algorytm
# delta - maksymalne ró¿nice miêdzy wartoœciami w klastrze
bccc <- biclust(x, method=BCCC(), delta = 0.1, alpha=10, number=10) 

png(filename="SyntrenEcoli_CC.png")
# wykres klastrów
heatmapBC(x,bccc,0)
dev.off()

#--------------------------------------------------- 
# algorytm 2: Xmotifs - XMotifs Biclustering 
#---------------------------------------------------

x<-data(SyntrenEcoli)
x<-discretize(SyntrenEcoli)  

# number - iloœæ biklastrów do znalezienia
# method - algorytm
# delta - maksymalne ró¿nice miêdzy wartoœciami w klastrze
# ns - liczba wybranych kolumn
# nd - liczba powtórzeñ
# 
Xmotif <- biclust(x, method=BCXmotifs(), ns=5, nd=100, sd=5, alpha=0.01, number=100) 

png(filename="SyntrenEcoli_XMotifs.png")
# wykres klastrów
heatmapBC(x,Xmotif,0)
dev.off()

jaccardind(Xmotif,bccc)
