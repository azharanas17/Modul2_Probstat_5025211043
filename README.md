# Modul2_Probstat_5025211043

**Anas Azhar_Probstat(A)\_5025211043**
<br><br>

### 1.

#### Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴

```
n = 9
dataSebelum = c(78, 75, 67, 77, 70, 72, 78,74, 77)
dataSesudah = c(100, 95, 70, 90, 90, 90, 89, 90, 100)
```

a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

```
print(sd(dataSebelum-dataSesudah))
```

<!-- Gambar -->

b. carilah nilai t (p-value)

```
mean1 = mean(dataSebelum)
mean2 = mean(dataSesudah)

sd1 = sd(dataSebelum)
sd2 = sd(dataSesudah)

t = abs(mean1 - mean2) / sqrt((sd1^2 /n) + (sd2^2 /n))
print(t)
```

<!-- Gambar -->

c. Apakah terdapat pengaruh yang signifikan? 𝛼=5%; H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴
<br>
`Karena didapatkan p-value 0.00006003 yang berarti kurang dari ConfidentLevel 0.05, maka kesimpulannya yaitu menolak H0 atau ada pengaruh yang signifikan secara statistika dalam hal saturasi oksigen, sebelum dan sesudah melakukan aktivitas A.`
<br><br>

### 2.

#### Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer.

```
mu = 20000
n = 100
xbar = 23500
sdx = 3900
```

a. Apakah Anda setuju dengan klaim tersebut?
<br>
`Setuju.`
<br><br>

b. Jelaskan maksud dari output yang dihasilkan!

```
zsum.test(xbar, sdx, n, alternative = "greater", mu=20000)
```

c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
<br>
`Karena didapatkan p-value mendekati 0 yang berarti kurang dari ConfidentLevel 0.05, maka kesimpulannya yaitu menolak H0 atau mobil dikemudikan rata-rata lebih dari 20000 kilometer per tahun.`
<br><br>

### 3.

#### Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

<!-- Gambar -->

#### Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah :

```
n1 = 19
mean1 = 3.64
sd1 = 1.67

n2 = 27
mean2 = 2.79
sd2 = 1.32
```

a. H0 dan H1
<br>
`H0 : μ Bandung == μ Bali`
<br>
`H1 : μ Bandung ≠ μ Bali`
<br><br>

b. Hitung Sampel Statistik

```
tsum.test(mean1, sd1, n1, mean2, sd2, n2, var.equal = TRUE)
```

c. Lakukan Uji Statistik (df=2)

```
plotDist(dist='t', df=2, col="red")
```

d. Nilai kritikal

```
qt(0.025, 2, lower.tail = FALSE)
```

e. Keputusan
<br>
`Menolak H0`
<br><br>

f. Kesimpulan
<br>
`Karena didapatkan selisih dari rata-rata yang tidak sama dengan 0, maka kesimpulannya yaitu menolak H0 atau rata-rata saham Bandung dan Bali tidak sama.`
<br><br>

### 4.

#### Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing.

#### Jika :

#### diketahui dataset https://intip.in/datasetprobstat1

#### H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama

```
mydata = read.table("onewayanova.txt", h=T)
attach(mydata)
```

a. Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

```
mydata$Group = as.factor(mydata$Group)
mydata$Group = factor(mydata$Group, labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))
class(mydata$Group)

grupKucingOren = subset(mydata, Group == "Kucing Oren")
grupKucingHitam = subset(mydata, Group == "Kucing Hitam")
grupKucingPutih = subset(mydata, Group == "Kucing Putih")
```

b. carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?

```
bartlett.test(Length ~ Group, data = mydata)
```

Hipotesis yang dapat diambil:
<br>
`Kesimpulan yang dapat diambil adalah setelah diperiksa didapatkan nilai p-value yaitu 0.8054.`
<br><br>

c. Untuk uji ANOVA, buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.

```
model1 = lm(Length ~ Group, data = mydata)
anova(model1)
```

d. Dari Hasil Poin C , Berapakah nilai-p ?
<br>
`Dari Bartlett test of homogeneity of variances, nilai p-value yang didapatkan adalah 0.8054`
<br><br>

e. Verifikasilah jawaban model 1 dengan Post-hooc test TukeyHSD , dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

```
anov = aov(model1)
tukey = TukeyHSD(model1)
print(tukey)
```

f. Visualisasikan data dengan ggplot2

```
ggplot2::ggplot(mydata, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey", colour = "black") + scale_x_discrete() + ylab("Length (cm)")
```

<br><br>

### 5.

#### Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut:

```
mydata = read.csv("GTL.csv")
```

a. Buatlah plot sederhana untuk visualisasi data

```
pl = ggplot2::ggplot(data=mydata, aes(x=Temp, y=Light, shape=factor(Glass))) + geom_point()
pl + facet_grid(. ~ Glass)
```

b. Lakukan uji ANOVA dua arah untuk 2 faktor

```
mydata$Glass = as.factor(mydata$Glass)
mydata$Temp_Factor = as.factor(mydata$Temp)
anova = aov(Light ~ Glass*Temp_Factor, data=mydata)
summary(anova)
```

c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

```
mydata_summary = group_by(mydata, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(mydata_summary)
```

d. Lakukan uji Tukey

```
tukey = TukeyHSD(anova)
print(tukey)
```

e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

```
print(multcompLetters4(anova, tukey))
```

<br><br>
