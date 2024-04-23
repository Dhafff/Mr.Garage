# Mr.Garage - Aplikasi Servis Kendaraan

Di readme ini, saya akan menjelaskan mengenai aplikasi, di mulai dari tata cara pemasangan kodingan/aplikasi flutter di komputer kamu, hingga apa saja yang harus anda koding dan menaruh kodingan tersebut di folder apa.

## Pendahuluan

Download aplikasi flutter (di button code, pilih download zip).

![Download Aplikasi](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExcnpwZ3NzeGxteXZtbHhmcXVtZGhjeWV2c3hrd2E2c3RlM3ZyMGk0cyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ABwL3b68E26LsqALSX/giphy.gif)

Lalu simpan di folder yang kamu inginkan. Contoh:

```markdown
C:\Tugas\Pemrograman Perangkat Berpenggerak\(taruh disini)
```

Setelah itu, buka code editor kesayangan kalian, lalu buka folder `mr_garage` di code editor-nya.

Jika sudah, pergi ke file `pubspec.yaml` lalu save file tersebut, atau pergi ke terminal, lalu masukan kode berikut dan klik enter:

```markdown
flutter pub get
```

Setelah kamu running code tersebut, kamu perlu masukan lagi kode untuk inisialisasi `flutter_native_splash` dengan masukan kode berikut dan klik enter:

```markdown
dart run flutter_native_splash:create
```

Lalu, masukan lagi kode untuk menginisialisasi `flutter_native_icons` agar icon aplikasi berubah menjadi logo `Mr.Garage` dengan masukan kode berikut dan klik enter:

```markdown
dart run flutter_launcher_icons
```

Terakhir, pilih terlebih dahulu emulator device yang akan anda gunakan untuk debugging. Penjelasan lengkap: https://stackoverflow.com/questions/49280884/how-to-set-up-devices-for-visual-studio-code-for-a-flutter-emulator

Setelah memilih device untuk debugging, aplikasi siap untuk dijalankan.

## Tempat untuk file kodingan kamu

Untuk menaruh file kodingan anda sesuai jobdesk, kamu perlu lakukan hal berikut, sesuai jobdesknya:

- Untuk anggota yang mengerjakan fitur `Servis`, silahkan taruh di folder `service`, alamat foldernya: `lib/view/pelanggan/service/file_anda.dart`
- Untuk anggota yang mengerjakan fitur `Derek`, silahkan taruh di folder `towing`, alamat foldernya: `lib/view/pelanggan/towing/file_anda.dart`
- Untuk anggota yang mengerjakan fitur `Beranda` dan `Pencarian`, silahkan taruh di folder `home`, alamat foldernya: `lib/view/pelanggan/home/file_anda.dart`
- Untuk anggota yang mengerjakan fitur `Belanja`, silahkan taruh di folder `shop`, alamat foldernya: `lib/view/pelanggan/shop/file_anda.dart`
- Untuk anggota yang mengerjakan fitur `Profil`, silahkan taruh di folder `profile`, alamat foldernya: `lib/view/pelanggan/profile/file_anda.dart`
- Untuk anggota yang mengerjakan fitur `Riwayat`, silahkan taruh di folder `history`, alamat foldernya: `lib/view/pelanggan/history/file_anda.dart`
- Untuk anggota yang mengerjakan fitur `Notifikasi`, silahkan taruh di folder `notification`, alamat foldernya: `lib/view/pelanggan/notification/file_anda.dart`

## Assets

Untuk menaruh asset seperti `img` dan lainnya, taruh di folder `assets/img/`. Jika kamu membuat folder baru, inisialisasi folder yang baru kamu buat di `pubspec.yaml` dengan scroll ke bawah sampai ketemu `assets`. Setelahnya, taruh path/alamat folder baru kamu. Contoh:

```yaml
assets:
<<<<<<< HEAD
  - assets/
  - assets/animation/
  - assets/img/
  - assets/img/logo/
  - assets/img/banner/
  - assets/img/vehicle/
  - assets/img/icon/
  - assets/img/illustrator/
  #- assets/img/folder_baru_kamu/  -- Simpan alamatnya disini
```

## Import plugin flutter

Jika kamu ingin import pluggin flutter, taruh di bagian `dependencies` di file `pubspec.yaml`.

```yaml
dependencies:
  cupertino_icons: ^1.0.6
  # Simpan pluggin disini
```

Lalu save.

## Penggunaan warna

Untuk projek ini, disediakan `utils` yang berisi utility mengenai warna, notifikasi, dan ambil foto. Saya akan menjelaskan mengenai penggunaan warna di proyek ini.

Untuk penggunaan warna, telah disediakan 6 warna, antara lain:
- Warna utama, dengan hex code `#007EA7` (Biru). Jika dibutuhkan, kalian cukup panggil kode `GlobalColors.mainColor` untuk mengubah warna. Contoh:
```dart
  Container(
   decoration: BoxDecoration(
   gradient: LinearGradient(
   begin: Alignment.topCenter,
   end: Alignment.bottomCenter,
   colors: GlobalColors.mainColor, // Warna yang kalian ingin ubah
  )
```
- Warna kedua, dengan hex code `#969696` (Abu agak terang), panggil kode `GlobalColors.secondColor` untuk mengubah warna.
- Warna ketiga, dengan hex code `#797979` (Abu agak gelap), panggil kode `GlobalColors.thirdColor` untuk mengubah warna.
- Warna teks, dengan hex code `#00171F` (Hitam-biru), panggil kode `GlobalColors.textColor` untuk mengubah warna.
- Warna garis, dengan hex code `#EEEEEE` (Abu terang), panggil kode `GlobalColors.garis` untuk mengubah warna.
- Terakhir, warna biru kedua atau warna sekunder, dengan hex code `#0AC2FF` (Biru terang), panggil kode `GlobalColors.backLoginColor` untuk mengubah warna.

## Penggunaan kamera

Jika anda diberi jobdesk yang salah satunya ambil foto, silahkan ikuti tata cara berikut.
- Inisialisasi 2 variable untuk menaruh `Uint8List` sebagai tempat foto dan `File` sebagai file fotonya.
  ```dart
  Uint8List? _image
  File? selectedImage;
  ```
- Buat 2 buah `CircleAvatar` untuk menaruh foto yang sudah dipilih. Lalu, buat sebuah pengkondisian apabila foto ada atau tidak ada. (Catatan: taruh di dalam Column)
  ```dart
  _image != null
   ? CircleAvatar(
    radius: 90,
    backgroundImage: MemoryImage(_image!), // Jika foto sudah di add atau di tambahkan
   )
   : CircleAvatar(
    radius: 90,
    backgroundImage: AssetImage('assets/img/icon/user-icon.jpg'), // Jika foto belum di tambahkan
   ),
  ```
- Lalu, buat sebuah tombol untuk mengambil foto yang diinginkan. Contoh, saya menggunakan `ElevatedButton` untuk mengambil gambar.
  ```dart
  ElevatedButton(
   onPressed: () {
    _pickImageFromGallery(); // Ambil method untuk mengambil gambar (Kodingan ada di bawah). Contoh, saya menggunakan method _pickImageFromGallery untuk mengambil foto dari galeri
   }
   // kodingan selanjutnya
  )
  ```
- Setelahnya, buat sebuah method mengambil gambar. Untuk method disini dibagi menjadi 2, yaitu `_pickImageFromGallery` dan `_pickImageFromCamera`.
  - `_pickImageFromGallery`. Ambil gambar di galeri.
  ```dart
  Future _pickImageFromGallery() async {
   final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
   if (returnImage == null) return;
   setState(() {
     selectedImage = File(returnImage.path);
     _image = File(returnImage.path).readAsBytesSync();
   });
   Navigator.of(context).pop();
  }
  ```
  
  - `_pickImageFromCamera`. Ambil gambar menggunakan camera.
  ```dart
  Future _pickImageFromCamera() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
  ```
  Catatan: Taruh method diluar Widget.

## Push ke GitHub

Jika jobdesk kamu sudah selesai dan ingin push ke GitHub, ikuti langkah ini.
- Buka Git Bash
  
  Buka Git Bash kamu di folder utama Mr.Garage, dengan cara klik kanan di dalam folder utama Mr.Garage, pilih `open Git Bash here`
  
- Konfigurasi Git

  Jika kamu belum melakukan konfigurasi, silahkan konfigurasi dengan username dan email kamu.
  
  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "youremail@example.com"
  ```
    
- Tambah branch
  
  Tambahkan branch untuk menyimpan perubahan kamu ke dalam branch kamu sendiri.
  ```bash
  git branch [nama_kamu]
  ```
  Jika sudah menambahkan branch, pindah ke branch yang sudah kamu buat.
  ```bash
  git checkout [branch_kamu]
  ```
  
- Tambah perubahan
  
  Jika kamu menambahkan perubahan di kodingan, lakukan `git add [file kamu]`. Contoh saya ingin menambahkan file `montir_homepage.dart`
  ```bash
  git add lib/view/montir/home/montir_homepage.dart
  ```
  Jika kamu ingin menambahkan seluruh folder yang berisi file kodingan kamu, gunakan '*' untuk menambahkan semua file yang ada di dalam folder.
  ```bash
  git add lib/view/pelanggan/service/*
  ```
  
- Commit
  
  Setelah menambahkan perubahan/file/kodingan, lakukan `git commit` untuk commit perubahan yang telah dibuat.
  ```bash
  git commit -m "menambahkan file montir_homepage.dart di folder montir/home"
  ```
  
- Remote repository
  
  Setelah melakukan commit, tambahkan repository ini ke dalam Git Bash kamu.
  ```bash
  git remote add origin https://github.com/Dhafff/Mr.Garage-Mobile.git
  ```
  
- Push
  
  Setelah melakukan remote repository, push ke branch kamu di repositori.
  ```bash
  git push -u origin [branch_kamu]
  ```
  
- Pindah branch
  
  Setelah melakukan push, pindah ke branch `main`
  ```bash
  git checkout main
  ```
  
- Gabung branch kamu ke `main`
  
  Setelah pindah branch, gabung branch kamu ke `main`
  ```bash
  git merge [branch_kamu]
  ```
  
- Push main
  
  Terakhir, push perubahan yg telah kamu buat ke repository
  ```bash
  git push origin main
  ```

  Catatan: Setelah push di main, pindah lagi ke branch kamu dengan cara `git checkout [branch_kamu]`.
  Jika ada kendala, silahkan hubungi saya di grup.

## Akhir Kata

Untuk saat ini, cukup sampai sini saya menjelaskan. Jika ada kendala atau kurang paham, silahkan kontak saya untuk informasi lebih lanjut.

Terimakasih. Saya harap readme ini membantu kamu untuk ngoding aplkasi Mr.Garage.
