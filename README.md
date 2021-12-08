# CovidConsult

## Daftar Isi

- [CovidConsult](#covidconsult)
  - [Daftar Isi](#daftar-isi)
  - [Kelompok C01](#kelompok-c01)
  - [Link download APK](#download-apk)
  - [Latar Belakang CovidConsult](#latar-belakang-covidconsult)
  - [Nama modul dan pembagiannya](#nama-modul-dan-pembagiannya)
  - [Persona](#persona)

## Kelompok C01
**Nama Anggota:**
1. Yelda Faizah Havara (2006464386)
2. Muhammad Asyraf (2006463244)
3. Muhammad Iqbal Asrif (2006473945)
4. Pradipta Davi Valendra (2006462664)
5. Tara Mazaya Lababan (2006473535)
6. Pramudiptha (2006482426)
7. P4tr1ck Al3x4nd3r (1906398710)

## Download APK
Untuk mendownload APK dapat melalui link [ini](https://github.com/YeldaFH/Covid-Consult/releases/)

## Latar Belakang CovidConsult

Pandemi Covid-19 telah membawa banyak perubahan dalam kehidupan manusia. Hampir seluruh kegiatan yang awalnya dilakukan secara _offline_ sekarang dilakukan secara _online_. Beberapa di antaranya adalah kegiatan belajar mengajar, transaksi jual beli, dan konsultasi kesehatan. Untuk itu, CovidConsult hadir sebagai salah satu jalan untuk memungkinkan terjadinya konsultasi kesehatan secara online. CovidConsult memungkinkan setiap orang mendapatkan konsultasi kesehatan dimanapun dan kapanpun bersama tenaga kesehatan yang dapat dipilih sendiri. CovidConsult juga akan menyediakan data terkait pandemi Covid-19. Dilengkapi dengan forum diskusi yang dapat digunakan pengguna untuk bertanya dan bertukar informasi mengenai berbagai yang berkaitan dengan kesehatan. Untuk memastikan forum ini berjalan sesuai dengan tujuan awalnya akan ada moderator yang mengawasi forum yang telah dibuat. Selain itu, terdapat halaman informasi obat yang memungkinkan pengguna mencari tahu informasi mengenai obat yang sedang dikonsumsi ataupun yang akan dibeli.

## Nama modul dan pembagiannya

1. Homepage ()
   1. Kritik & Saran (form)
   2. Beberapa stats dari CovidInfo (realtime)
   3. Searchable tabel kasus provinsi
   4. Artikel paling baru (ajax)
2. Konsultasi (Iqbal)
   1. Konsultasi diakses dokter (searchable - ajax)
   2. Konsultasi diakses user
3. Forum (Tara)
   1. Daftar Forum (searchable - ajax)
   2. Detail forum
4. Informasi Obat (Valen)
   1. Layout mirip E-commerce (Searchable - ajax)
5. Authentication (Login / Logout) (Yelda)
   1. Searchable database user-user (Admin view - ajax)
6. Profile (Pram)
   1. Password + Username (Changeable) 
   2. booking konsul (sortable)
7. Artikel (Asyraf)
   1. Searchable artikel-artikel

## Persona
1. Guest User
   1. Bisa liat homepage, CovidInfo,info obat, Forum, Konsultasi (**view-only**)
2. Login User
   1. Bisa posting di forum, booking di konsul, liat + otak-atik profile diri sendiri
   2. Bisa tambah kritik-saran di homepage
   3. and all above
3. Dokter / Tenaga kesehatan
   1. Bisa liat booking user, tambah obat
   2. and all above
4. Moderator Forum (Admin Django)
   1. Bisa delete forum, obat, artikel, kritik & saran
   2. Bisa liat database user di auth
   3. Liat kritik saran homepage dari user
   4. and all above
