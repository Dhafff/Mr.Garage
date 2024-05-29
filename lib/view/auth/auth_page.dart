import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mr_garage/view/auth/landing.view.dart';

import '../../utils/global.colors.dart';
import '../montir/navbar/montir_navbar.dart';
import '../pelanggan/navbar/pelanggan_navbar.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  Future<bool> _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: _checkInternetConnection(),
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
          } else if (snapshot.hasError || !snapshot.data!) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 50,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Tidak ada koneksi internet',
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return StreamBuilder<User?>(
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
                if (snapshot.hasData) {
                  return FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance.collection('Users').doc(snapshot.data!.uid).get(),
                    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
                      if (userSnapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LoadingAnimationWidget.staggeredDotsWave(
                                  color: GlobalColors.mainColor, size: 50),
                            ],
                          ),
                        );
                      }

                      if (userSnapshot.hasError) {
                        print('Terjadi kesalahan: ${userSnapshot.error}');
                        return const Center(
                          child: Text('Terjadi kesalahan'),
                        );
                      }

                      if (userSnapshot.data != null && userSnapshot.data!.exists) {
                        var userData = userSnapshot.data!.data() as Map<String, dynamic>;
                        var role = userData['role'];

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
                } else {
                  return const LandingPage();
                }
              },
            );
          }
        },
      ),
    );
  }
}
