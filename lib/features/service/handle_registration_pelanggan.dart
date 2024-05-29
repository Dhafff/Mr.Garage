import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mr_garage/view/auth/landing.view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path/path.dart' as p;

import '../../utils/global.colors.dart';
import '../../view/pelanggan/navbar/pelanggan_navbar.dart';

// register loading (ketika daftar sukses)
class RegisterPelangganLoading extends StatelessWidget {
  const RegisterPelangganLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: LoadingAnimationWidget.staggeredDotsWave(color: GlobalColors.mainColor, size: 50),
            ),
            const SizedBox(height: 20),
            Text(
              'Data kamu lagi di proses nih\ntunggu sebentar, ya.',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: GlobalColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// register success (ketika data udah masuk)
class RegisterPelangganSuccess extends StatelessWidget {
  const RegisterPelangganSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Icon(
              FeatherIcons.checkCircle,
              size: 40,
              color: Colors.green,
            )),
            const SizedBox(height: 20),
            Text(
              'Akun berhasil dibuat.',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// register tidak berhasil
class RegisterPelangganUnsuccess extends StatelessWidget {
  const RegisterPelangganUnsuccess({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Icon(
              FeatherIcons.alertCircle,
              size: 40,
              color: Colors.red,
            )),
            const SizedBox(height: 20),
            Text(
              'Akun gak berhasil dibuat :(',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void navigateToRegisterPelangganLoading(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterPelangganLoading()));
}

void navigateToRegisterPelangganSuccess(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterPelangganSuccess()));
}

void navigateToRegisterPelangganUnsuccess(BuildContext context, String message) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => RegisterPelangganUnsuccess(errorMessage: message)));
}

void navigateToLanding(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LandingPage()));
}

void navigateToHome(BuildContext context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => const PelangganNavBar()),
  );
}

Future<void> handleRegistrationPelangganSubmit(
    BuildContext context, String username, email, password, File selectedFile) async {
  // Tampilkan halaman loading
  navigateToRegisterPelangganLoading(context);

  // Lakukan proses pendaftaran di sini, meliputi username, email, password, dan foto profil (misalnya pengiriman data ke server)
  try {
    // Buat pengguna baru dengan email dan password
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? newUser = userCredential.user;
    if (newUser == null) {
      navigateToLanding(context);
      return; // Pastikan untuk keluar dari fungsi jika pengguna tidak ada
    }

    print('New user ID: ${newUser.uid}');

    // Upload foto profil ke Firebase Storage dan dapatkan URL gambar
    String photoUrl = await uploadProfilePhoto(username, selectedFile);
    print('Photo URL: $photoUrl');

    // Role pengguna
    String role = 'Pelanggan';

    // Tambahkan data pengguna ke Firestore
    await FirebaseFirestore.instance.collection('Users').doc(newUser.uid).set({
      'username': username,
      'email': email,
      'photoUrl': photoUrl,
      'role': role,
      'createAt': FieldValue.serverTimestamp(),
      'updateAt': FieldValue.serverTimestamp(),
      'active': true,
      'vehicles': [
        {
          'name': '',
          'type': '',
          'photoUrl': '',
        },
      ],
      // Anda bisa menambahkan lebih banyak data pengguna di sini
    });

    print('User data successfully written to Firestore');

    // Navigasi ke halaman berhasil
    navigateToRegisterPelangganSuccess(context);

    // Tunggu sebentar selama 3 detik
    await Future.delayed(const Duration(seconds: 3));

    // Navigasi ke halaman utama dan hapus semua rute sebelumnya
    navigateToHome(context);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      navigateToRegisterPelangganUnsuccess(context, 'Email sudah terpakai');
      await Future.delayed(const Duration(seconds: 3));
      navigateToLanding(context);
    } else {
      navigateToRegisterPelangganUnsuccess(context, '${e.message}');
      await Future.delayed(const Duration(seconds: 3));
      navigateToLanding(context);
    }
  } catch (error) {
    // Tangani kesalahan jika terjadi
    navigateToRegisterPelangganUnsuccess(context, '$error');

    await Future.delayed(const Duration(seconds: 3));

    navigateToLanding(context);
  }
}

Future<String> uploadProfilePhoto(String username, File selectedFile) async {
  UploadTask? uploadTask;

  final fileExtension = p.extension(selectedFile.path);

  final path = 'img/user/$username/profile$fileExtension';
  final file = File(selectedFile.path);

  final ref = FirebaseStorage.instance.ref().child(path);
  uploadTask = ref.putFile(file);

  final snapshot = await uploadTask.whenComplete(() {});
  final downloadUrl = await snapshot.ref.getDownloadURL();

  return downloadUrl;
}
