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

``` markdown
dart run flutter_native_splash:create
```

Lalu, masukan lagi kode untuk menginisialisasi `flutter_native_icons` agar icon aplikasi berubah menjadi logo `Mr.Garage` dengan masukan kode berikut dan klik enter:

``` markdown
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
    - assets/
    - assets/animation/
    - assets/img/
    - assets/img/logo/
    - assets/img/banner/
    - assets/img/vehicle/
    - assets/img/icon/
    - assets/img/illustrator/
    ##- assets/img/folder_baru_kamu/  -- Simpan alamatnya disini
```

## Import Plugin Flutter
Jika kamu ingin import pluggin flutter, taruh di bagian `dependencies` di file `pubspec.yaml`.

```yaml
dependencies:
  cupertino_icons: ^1.0.6
  # Simpan pluggin disini
```

## Akhir Kata
Untuk saat ini, cukup sampai sini saya menjelaskan. Saya belum memasukan tata cara push ke GitHub, nanti saya coba jelaskan di kemudian hari.

Terimakasih. Saya harap `readme` ini membantu kamu untuk ngoding aplkasi `Mr.Garage`.
