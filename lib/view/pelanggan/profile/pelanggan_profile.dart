import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mr_garage/common/widgets/modal/modal_chooser_2.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:mr_garage/view/pelanggan/navbar/pelanggan_navbar.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../auth/landing.view.dart';

class PelangganProfile extends StatefulWidget {
  const PelangganProfile({super.key});

  @override
  State<PelangganProfile> createState() => _PelangganProfileState();
}

class _PelangganProfileState extends State<PelangganProfile> {
  String photoUrl = '';
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    fetchPhotoUrl();
  }

  Future<void> fetchPhotoUrl() async {
    String fetchedPhotoUrl = await getPhotoUrlFromFirestore();
    setState(() {
      photoUrl = fetchedPhotoUrl;
    });
  }

  Future<String> getPhotoUrlFromFirestore() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Users').where('userId', isEqualTo: user?.uid).get();

    if (querySnapshot.docs.isNotEmpty) {
      var userDoc = querySnapshot.docs.first;
      var userData = userDoc.data() as Map<String, dynamic>;
      if (userData.containsKey('photoUrl')) {
        return userData['photoUrl'];
      }
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              pushScreen(
                context,
                screen: const PelangganNavBar(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.slideRight,
              );
            },
            icon: Icon(
              FeatherIcons.arrowLeft,
              color: GlobalColors.textColor,
            ),
          ),
        ),
        title: Text(
          'Profil',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: GlobalColors.textColor,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        titleSpacing: 15,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: GlobalColors.garis,
                            child: CircleAvatar(
                              radius: 55,
                              backgroundImage: photoUrl.isNotEmpty
                                  ? NetworkImage(photoUrl) as ImageProvider
                                  : const AssetImage('assets/img/icon/user-icon.jpg'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: [
                            StreamBuilder<User?>(
                              stream: FirebaseAuth.instance.authStateChanges(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Text(
                                    '...',
                                    style: GoogleFonts.openSans(
                                      color: GlobalColors.textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                                if (snapshot.hasData) {
                                  return FutureBuilder(
                                    future: FirebaseFirestore.instance
                                        .collection('Users')
                                        .doc(snapshot.data!.uid)
                                        .get(),
                                    builder:
                                        (BuildContext context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
                                      if (userSnapshot.connectionState == ConnectionState.waiting) {
                                        return Text(
                                          '...',
                                          style: GoogleFonts.openSans(
                                            color: GlobalColors.textColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      }

                                      // Ambil nama pengguna dari Firestore
                                      if (userSnapshot.data!.exists) {
                                        var userData = userSnapshot.data!.data() as Map<String, dynamic>;
                                        var fullName = userData['username'];

                                        // Tampilkan nama pengguna di dalam App Bar
                                        return Text(
                                          fullName,
                                          style: GoogleFonts.openSans(
                                            color: GlobalColors.textColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      } else {
                                        return Text(
                                          '-',
                                          style: GoogleFonts.openSans(
                                            color: GlobalColors.textColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      }
                                    },
                                  );
                                } else {
                                  return Text(
                                    'Tamu',
                                    style: GoogleFonts.openSans(
                                      color: GlobalColors.textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }
                              },
                            ),
                            const SizedBox(height: 8),
                            StreamBuilder<User?>(
                              stream: FirebaseAuth.instance.authStateChanges(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Text(
                                    '...',
                                    style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      color: GlobalColors.thirdColor,
                                    ),
                                  );
                                }
                                if (snapshot.hasData) {
                                  return FutureBuilder(
                                    future: FirebaseFirestore.instance
                                        .collection('Users')
                                        .doc(snapshot.data!.uid)
                                        .get(),
                                    builder:
                                        (BuildContext context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
                                      if (userSnapshot.connectionState == ConnectionState.waiting) {
                                        return Text(
                                          '...',
                                          style: GoogleFonts.openSans(
                                            fontSize: 15,
                                            color: GlobalColors.thirdColor,
                                          ),
                                        );
                                      }

                                      // Ambil nama pengguna dari Firestore
                                      if (userSnapshot.data!.exists) {
                                        var userData = userSnapshot.data!.data() as Map<String, dynamic>;
                                        var role = userData['role'];

                                        // Tampilkan nama pengguna di dalam App Bar
                                        return Text(
                                          role,
                                          style: GoogleFonts.openSans(
                                            fontSize: 15,
                                            color: GlobalColors.thirdColor,
                                          ),
                                        );
                                      } else {
                                        return Text(
                                          '-',
                                          style: GoogleFonts.openSans(
                                            fontSize: 15,
                                            color: GlobalColors.thirdColor,
                                          ),
                                        );
                                      }
                                    },
                                  );
                                } else {
                                  return Text(
                                    'Entah',
                                    style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      color: GlobalColors.thirdColor,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        width: double.infinity,
                        height: 73,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 1,
                            color: GlobalColors.garis,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      FeatherIcons.mail,
                                      size: 18,
                                      color: GlobalColors.thirdColor,
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      'Email',
                                      style: GoogleFonts.openSans(
                                        fontSize: 13,
                                        color: GlobalColors.thirdColor,
                                      ),
                                    ),
                                  ],
                                ),
                                StreamBuilder(
                                  stream: FirebaseAuth.instance.authStateChanges(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return Text(
                                        '...',
                                        style: GoogleFonts.openSans(
                                          fontSize: 13,
                                          color: GlobalColors.thirdColor,
                                        ),
                                      );
                                    }
                                    if (snapshot.hasData) {
                                      return FutureBuilder(
                                        future: FirebaseFirestore.instance
                                            .collection('Users')
                                            .doc(snapshot.data!.uid)
                                            .get(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<DocumentSnapshot> userSnapshot) {
                                          if (userSnapshot.connectionState == ConnectionState.waiting) {
                                            return Text(
                                              '...',
                                              style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                color: GlobalColors.thirdColor,
                                              ),
                                            );
                                          }

                                          // Ambil nama pengguna dari Firestore
                                          if (userSnapshot.data!.exists) {
                                            var userData = userSnapshot.data!.data() as Map<String, dynamic>;
                                            var email = userData['email'];

                                            // Tampilkan nama pengguna di dalam App Bar
                                            return Text(
                                              email,
                                              style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                color: GlobalColors.textColor,
                                              ),
                                            );
                                          } else {
                                            return Text(
                                              '-',
                                              style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                color: GlobalColors.textColor,
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    } else {
                                      return Text(
                                        'mail',
                                        style: GoogleFonts.openSans(
                                          fontSize: 13,
                                          color: GlobalColors.textColor,
                                        ),
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 217,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1, color: GlobalColors.garis),
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: GlobalColors.mainColor,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: const Icon(
                                          Symbols.person_edit_rounded,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        'Edit profil',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: GlobalColors.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    FeatherIcons.arrowRight,
                                    size: 20,
                                    color: GlobalColors.thirdColor,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: GlobalColors.mainColor,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: const Icon(
                                          Symbols.settings,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        'Pengaturan akun',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: GlobalColors.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    FeatherIcons.arrowRight,
                                    size: 20,
                                    color: GlobalColors.thirdColor,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: GlobalColors.mainColor,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: const Icon(
                                          Symbols.info,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        'Tentang aplikasi',
                                        style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: GlobalColors.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    FeatherIcons.arrowRight,
                                    size: 20,
                                    color: GlobalColors.thirdColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/img/logo/logo-mrgarage.png',
                            width: 35,
                          ),
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              'Mr.Garage',
                              style: GoogleFonts.openSans(
                                fontSize: 15,
                                color: GlobalColors.textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Versi Beta 0.1',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 13,
                          color: GlobalColors.secondColor,
                        ),
                      ),
                      const SizedBox(height: 30),
                      OutlinedButton(
                        onPressed: () {
                          _showLogoutModal(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.red,
                          ),
                          minimumSize: const Size(355, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Keluar',
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showLogoutModal(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (BuildContext context) {
        return ModalChooser2(
          icon: FeatherIcons.logOut,
          modalTitle: 'Keluar?',
          modalDesc: 'Kamu beneran nih mau keluar?',
          color1: GlobalColors.mainColor,
          button1: 'Tidak',
          onPressed1: () {
            Navigator.of(context).pop();
          },
          button2: 'Keluar',
          color2: Colors.red,
          onPressed2: () async {
            await logout(context);
          },
        );
      },
    );
  }

  Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LandingPage()));
    } catch (e) {
      print('Error logging out: $e');
    }
  }
}
