import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mr_garage/view/auth/landing.view.dart';

import '../../utils/global.colors.dart';
import '../montir/navbar/montir_navbar.dart';
import '../pelanggan/navbar/pelanggan_navbar.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingAnimationWidget.staggeredDotsWave(color: GlobalColors.mainColor, size: 50),
                ],
              ),
            );
          }
          // ... jika user sudah login
          if (snapshot.hasData) {
            return FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance.collection('Users').doc(snapshot.data!.uid).get(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingAnimationWidget.staggeredDotsWave(color: GlobalColors.mainColor, size: 50),
                      ],
                    ),
                  );
                }

                if (userSnapshot.hasError) {
                  print('Terjadi kesalahan: ${userSnapshot.error}');
                }

                // Periksa peran pengguna
                if (userSnapshot.data != null && userSnapshot.data!.exists) {
                  var userData = userSnapshot.data!.data() as Map<String, dynamic>;
                  var role = userData['role']; // Ambil peran pengguna dari Firestore

                  // Tampilkan halaman sesuai peran pengguna
                  if (role == 'montir') {
                    return const MontirNavBar();
                  } else {
                    return const PelangganNavBar();
                  }
                } else {
                  return const LandingPage();
                }
              },
            );
            // ... jika belum
          } else {
            return const LandingPage();
          }
        },
      ),
    );
  }
}
