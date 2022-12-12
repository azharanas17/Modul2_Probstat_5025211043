#nomer 1
#n = 9; x = [78, 75, 67, 77, 70, 72, 78, 74, 77]; y = [100, 95, 70, 90, 90, 90, 89, 90, 100]
n = 9
dataSebelum = c(78, 75, 67, 77, 70, 72, 78,74, 77)
dataSesudah = c(100, 95, 70, 90, 90, 90, 89, 90, 100)

#a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel!
print(sd(dataSebelum-dataSesudah))

#b. Carilah nilai t (p-value)
mean1 = mean(dataSebelum)
mean2 = mean(dataSesudah)

sd1 = sd(dataSebelum)
sd2 = sd(dataSesudah)

t = abs(mean1 - mean2) / sqrt((sd1^2 /n) + (sd2^2 /n))
print(t)

#c. Apakah terdapat pengaruh yang signifikan? 𝛼=5%; H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”
t.test(dataSesudah, dataSebelum, paired = TRUE)
paste("Karena didapatkan p-value 0.00006003 yang berarti kurang dari ConfidentLevel 0.05, maka kesimpulannya yaitu menolak H0 atau ada pengaruh yang signifikan secara statistika dalam hal saturasi oksigen, sebelum dan sesudah melakukan aktivitas A.")


#------------------------------------------------
#nomer 2
mu = 20000
n = 100
xbar = 23500
sdx = 3900

#a. Apakah Anda setuju dengan klaim tersebut?
paste("Setuju.")

#b. Jelaskan maksud dari output yang dihasilkan!
library(BSDA)
zsum.test(xbar, sdx, n, alternative = "greater", mu=20000)

#c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
paste("Karena didapatkan p-value mendekati 0 yang berarti kurang dari ConfidentLevel 0.05, maka kesimpulannya yaitu menolak H0 atau mobil dikemudikan rata-rata lebih dari 20000 kilometer per tahun.")


#------------------------------------------------
#nomer 3
# 𝛼= 0.05; Jumlah Saham(Bandung=19, Bali=27); Sampel Mean(Bandung=3.64, Bali=2.79); Sampelsd(Bandung=1.67, Bali=1.32)
n1 = 19
mean1 = 3.64
sd1 = 1.67

n2 = 27
mean2 = 2.79
sd2 = 1.32

#a. H0 dan H1
paste("H0 : μ Bandung == μ Bali")
paste("H1 : μ Bandung ≠ μ Bali")

#b. Hitung sample statistik
tsum.test(mean1, sd1, n1, mean2, sd2, n2, var.equal = TRUE)

#c. Lakukan uji statistik
plotDist(dist='t', df=2, col="red")

#d. Nilai kritikal
qt(0.025, 2, lower.tail = FALSE)

#e. Keputusan
paste("Menolak H0")

#f. Kesimpulan
paste("Karena didapatkan selisih dari rata-rata yang tidak sama dengan 0, maka kesimpulannya yaitu menolak H0 atau rata-rata saham Bandung dan Bali tidak sama.")


#------------------------------------------------
#nomer 4
# H0: Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama
mydata = read.table("onewayanova.txt", h=T)
attach(mydata)

#a. Buatlah masing masing jenis spesies menjadi  3 subjek "Grup". Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.
mydata$Group = as.factor(mydata$Group)
mydata$Group = factor(mydata$Group, labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))
class(mydata$Group)

grupKucingOren = subset(mydata, Group == "Kucing Oren")
grupKucingHitam = subset(mydata, Group == "Kucing Hitam")
grupKucingPutih = subset(mydata, Group == "Kucing Putih")

#b. periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan?
bartlett.test(Length ~ Group, data = mydata)
#  Apa hipotesis dan kesimpulan yang dapat diambil ?
paste("Kesimpulan yang dapat diambil adalah setelah diperiksa didapatkan nilai p-value yaitu 0.8054.")

#c. Untuk uji ANOVA, buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1
model1 = lm(Length ~ Group, data = mydata)
anova(model1)

#d. Berapakah nilai-p? Apa yang dapat disimpulkan dari H0?
paste("")

#e. Verifikasilah jawaban model 1 dengan Post-hooc test TukeyHSD ,  dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.
anov = aov(model1)
tukey = TukeyHSD(model1)
print(tukey)

#f. Visualisasikan data dengan ggplot2 
ggplot2::ggplot(mydata, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey", colour = "black") + scale_x_discrete() + ylab("Length (cm)")


#------------------------------------------------
#nomer 5
#eksperimen dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop.

#a. Buatlah plot sederhana untuk visualisasi data 

#b. Lakukan uji ANOVA dua arah untuk 2 faktor

#c.Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi) 

#d. Lakukan uji Tukey

#e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey