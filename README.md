# Modul2_Probstat_5025211043

**Anas Azhar_Probstat(A)\_5025211043**
<br><br>

### 1.

#### Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴
![tabel_1](https://user-images.githubusercontent.com/91374949/170879427-d5c438cc-09da-49ac-b321-6ceab978e244.png)

```
n = 9
dataSebelum = c(78, 75, 67, 77, 70, 72, 78,74, 77)
dataSesudah = c(100, 95, 70, 90, 90, 90, 89, 90, 100)
```

a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

Dapat langsung menggunakan function yang sudah disiapkan di bahasa R: <br>
```
print(sd(dataSebelum-dataSesudah))
```
Hasil yang didapatkan adalah sebagai berikut: <br>
![1a](https://user-images.githubusercontent.com/99221296/207402497-4fe5ce77-e206-416f-b4cf-07a182dba5d3.png)

b. carilah nilai t (p-value)

Dapat langsung menggunakan function yang sudah disiapkan di bahasa R: <br>
```
mean1 = mean(dataSebelum)
mean2 = mean(dataSesudah)

sd1 = sd(dataSebelum)
sd2 = sd(dataSesudah)

t = abs(mean1 - mean2) / sqrt((sd1^2 /n) + (sd2^2 /n))
print(t)
```

Hasil yang didapatkan adalah sebagai berikut:
![1b](https://user-images.githubusercontent.com/99221296/207402498-afa0ce86-7fd9-4a24-b977-3c9ec033b124.png)

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

Dapat langsung menggunakan function yang sudah disiapkan di bahasa R, dengan alternative greater karena uji hipotesis ini adalah one-tail
```
zsum.test(xbar, sdx, n, alternative = "greater", mu=20000)
```

Hasil yang didapatkan adalah sebagai berikut: <br>
![2b](https://user-images.githubusercontent.com/99221296/207402501-ac3f235a-3c26-4117-92f6-7f6e7bc30faa.png)

c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
<br>
`Karena didapatkan p-value mendekati 0 yang berarti kurang dari ConfidentLevel 0.05, maka kesimpulannya yaitu menolak H0 atau mobil dikemudikan rata-rata lebih dari 20000 kilometer per tahun.`
<br><br>

### 3.

#### Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

![tabel_3](https://user-images.githubusercontent.com/91374949/170879960-9b8ff295-d0f6-4d10-8b07-1aa7648a7fe2.png)

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

Hasil yang didapatkan adalah sebagai berikut: <br>
![3b](https://user-images.githubusercontent.com/99221296/207402506-06f778f1-5ba2-456a-a61e-4668a7ed39b9.png)


c. Lakukan Uji Statistik (df=2)

```
plotDist(dist='t', df=2, col="red")
```

Hasil yang didapatkan adalah sebagai berikut: <br>
![3c](https://user-images.githubusercontent.com/99221296/207402512-49f141d7-518f-44a4-9f1f-9d2a53a3c217.png)


d. Nilai kritikal

```
qt(0.025, 2, lower.tail = FALSE)
```

Hasil yang didapatkan adalah sebagai berikut: <br>
![3d](https://user-images.githubusercontent.com/99221296/207402517-6e3f873a-7402-46af-8b6e-cdda55927751.png)


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

Hasil yang didapatkan adalah sebagai berikut: <br>
![4a](https://user-images.githubusercontent.com/99221296/207402523-4519a04a-ea3d-4a10-8344-96e9a283a161.png)


b. carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?

```
bartlett.test(Length ~ Group, data = mydata)
```

Hasil yang didapatkan adalah sebagai berikut: <br>
![4b](https://user-images.githubusercontent.com/99221296/207402526-50b4c23e-030a-4fda-8935-b42ffc7791ee.png)


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

Hasil yang didapatkan adalah sebagai berikut: <br>
![4e](https://user-images.githubusercontent.com/99221296/207402530-10b87214-664d-4340-ab1a-c4f1cf61c4d4.png)


f. Visualisasikan data dengan ggplot2

```
ggplot2::ggplot(mydata, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey", colour = "black") + scale_x_discrete() + ylab("Length (cm)")
```

Hasil yang didapatkan adalah sebagai berikut: <br>
![4f](https://user-images.githubusercontent.com/99221296/207402536-c549deb2-ef60-48ff-8b18-2aeb23ff8144.png)


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

Hasil yang didapatkan adalah sebagai berikut: <br>
![5a](https://user-images.githubusercontent.com/99221296/207402541-8d407877-8140-4cff-b71c-78fb18ea5555.png)


b. Lakukan uji ANOVA dua arah untuk 2 faktor

```
mydata$Glass = as.factor(mydata$Glass)
mydata$Temp_Factor = as.factor(mydata$Temp)
anova = aov(Light ~ Glass*Temp_Factor, data=mydata)
summary(anova)
```

Hasil yang didapatkan adalah sebagai berikut: <br>
![5b](https://user-images.githubusercontent.com/99221296/207402545-cb9e903b-cfe6-41bc-a7a8-2b9244ce194c.png)


c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

```
mydata_summary = group_by(mydata, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(mydata_summary)
```

Hasil yang didapatkan adalah sebagai berikut: <br>
![5c](https://user-images.githubusercontent.com/99221296/207402548-a87b3fec-30c9-42c7-b591-55edd73be6c8.png)


d. Lakukan uji Tukey

```
tukey = TukeyHSD(anova)
print(tukey)
```

Hasil yang didapatkan adalah sebagai berikut: <br>
![5d](https://user-images.githubusercontent.com/99221296/207402554-f9bd5940-cb7d-436e-8446-d1c4c252bfb0.png)


e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

```
print(multcompLetters4(anova, tukey))
```

Hasil yang didapatkan adalah sebagai berikut: <br>
![5e](https://user-images.githubusercontent.com/99221296/207402490-e48efa50-947f-4c3f-b6aa-19270d902f43.png)

<br><br>
