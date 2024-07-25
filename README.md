# Repository KSM PVD 61

Git adalah version control system yang digunakan untuk mengembangkan software secara bersama-bersama. Fungsi utama git yaitu mengatur versi dari source code program dengan mengasih tanda baris dan code mana yang ditambah atau diganti. Untuk menginstallnya silahkan download dari [Website resminya](https://git-scm.com/).

Untuk dokumentasi resminya bisa diakses [disini](https://git-scm.com/docs).

## Konfigurasi Git

#### Lihat Konfigurasi
```
git config --list
git config --global --list
git config --local --list
```

#### Global
Jika diatur **global**, konfigurasi akan berlaku pada semua repository
```git
git config --global user.name "namamu"
git config --global user.email "emailmu"
 ```

#### Local Git
Jika diatur **local**, konfigurasi hanya akan berlaku pada repository tempat kalian melakukan konfigurasi

```git
git config --local user.name "namamu"
git config --local user.email "emailmu"
```

## Perintah Perintah Dasar

#### Git Init
Digunakan untuk membuat repository pada komputer lokal yang nantinya ada disimpan di folder .git
```git
git init
```

#### Git Clone
Digunakan untuk membuat salinan repository ke komputer lokal. Perintah yang digunakan `git clone url-repository`. Contohnya, untuk clone repository ini gunakan perintah:
```git
git clone https://git.stis.ac.id/pvd-pkl-60/ksm-pvd-60.git
```

#### Git Status
Digunakan untuk melihat perubahan yang telah dilakukan sejak commit/checkpoint terakhir

	git status

#### Git Add dan Git Commit
Git add digunakan untuk memasukan perubahan ke staging area dan git commit digunakan untuk membuat checkpoint terhadap perubahan
```git
git add .
git commit -m "Pesan commit disini"
```
**Catatan** : Bila perintah commit telah dijalankan (dari direktori kerja), file akan di-commit ke HEAD, namun belum terkirim ke remote repository.

#### Git Amend
Digunakan untuk menambahkan perubahan pada commit/checkpoint terakhir (tidak membuat checkpoint baru). Hal ini biasa dilakukan ketika hanya terjadi perubahan yang sedikit atau tidak signifikan, misalnya penambahan komentar, memperbaiki typo, dan lain-lain

	git commit --amend -m "update pesan commit"
    
#### Git Log
Digunakan untuk melihat commit/checkpoint yang telah dilakukan

	git log 
    
#### Git Checkout
Digunakan untuk pindah ke commit/checkpoint sebelumnya

	git checkout hash-code

#### Git Push
Digunakan untuk mengirimkan perubahan file setelah di commit ke remote repository.
```git
git push
git push -u origin master
```

#### Git Pull
Digunakan untuk mengambil perubahan yang terjadi pada remote repository

	git pull
    

## Branch

#### Melihat Branch
	git branch -a

#### Membuat Branch
	git branch branch-name
    
#### Pindah Branch
	git checkout branch-name
    
#### Hapus Branch
	git branch -d branch-name
    
#### Merge Branch
Sebelum melakukan merge, pastikan HEAD sudah ada pada branch tujuan. Misalnya ingin melakukan merge ke master maka pindah dulu ke branch master kemudain melakukan merge.

	git checkout master
    git merge branch-name






