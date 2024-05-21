import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mr_garage/features/service/auth_service.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:mr_garage/view/auth/forgot_password/forgot_password_page.dart';
import 'package:mr_garage/view/pelanggan/navbar/pelanggan_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'register/register_montir.dart';
import 'register/register_pelanggan.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // final _pageController = PageController();
  bool isSmall(BuildContext context) => MediaQuery.of(context).size.height <= 2200;
  bool isMedium(BuildContext context) => MediaQuery.of(context).size.height > 2200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                HexColor('33CCFF'),
                GlobalColors.backLoginColor,
                HexColor('00B8F5'),
              ],
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/img/logo/logo-mrgarage.png',
                                width: 40,
                              ),
                              const SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: Text(
                                  'Mr.Garage',
                                  style: GoogleFonts.openSans(
                                    fontSize: 16,
                                    color: GlobalColors.textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/illustrator/vector_landing.png',
                          width: 216,
                          height: 180,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Servis kendaraanmu',
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: GlobalColors.textColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'kapanpun, di manapun',
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: GlobalColors.textColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.29,
                  padding: const EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
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
                              return SizedBox(
                                height: 300,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 5),
                                    Container(
                                      height: 5,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Daftar',
                                            style: GoogleFonts.openSans(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: GlobalColors.textColor),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'Mau daftar jadi apa?',
                                            style: GoogleFonts.openSans(
                                              fontSize: 13,
                                              color: GlobalColors.thirdColor,
                                            ),
                                          ),
                                          const SizedBox(height: 30),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => const RegisterPelangganPage(),
                                                    ),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: const Size(165, 135),
                                                  backgroundColor: HexColor('eeeeee'),
                                                  shadowColor: Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/img/icon/icons8-user.png',
                                                      width: 50,
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      'Pelanggan',
                                                      style: GoogleFonts.openSans(
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w600,
                                                        color: HexColor('1e1e1e'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => const RegisterMontirPage(),
                                                    ),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: const Size(165, 135),
                                                  backgroundColor: HexColor('eeeeee'),
                                                  shadowColor: Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/img/icon/icons8-mechanic.png',
                                                      width: 50,
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      'Montir',
                                                      style: GoogleFonts.openSans(
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w600,
                                                        color: HexColor('1e1e1e'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: GlobalColors.mainColor,
                          minimumSize: const Size(355, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Daftar',
                          style: GoogleFonts.openSans(
                              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Divider(
                              color: GlobalColors.garis,
                              thickness: 0.5,
                              indent: 60,
                              endIndent: 10,
                            ),
                          ),
                          Text(
                            'atau',
                            style: GoogleFonts.openSans(
                              fontSize: 12,
                              color: GlobalColors.thirdColor,
                            ),
                          ),
                          Flexible(
                            child: Divider(
                              color: GlobalColors.garis,
                              thickness: 0.5,
                              indent: 10,
                              endIndent: 60,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      OutlinedButton(
                        onPressed: () {
                          _showLoginModal(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: GlobalColors.mainColor,
                          ),
                          minimumSize: const Size(355, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Masuk',
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: GlobalColors.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* ========= login modal ========= */

  void _showLoginModal(BuildContext context) {
    // controller
    final GlobalKey<FormState> formKey = GlobalKey();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    // login method
    void loginUser() async {
      // loading circle
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingAnimationWidget.staggeredDotsWave(color: GlobalColors.mainColor, size: 50),
                const SizedBox(height: 15),
                Text(
                  'Tunggu sebentar...',
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      );

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      } on FirebaseAuthException catch (e) {
        Navigator.of(context).pop;
        if (e.code == 'user-not-found') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: Text(
                  'Pesan',
                  style: GoogleFonts.openSans(
                      fontSize: 15, fontWeight: FontWeight.w600, color: GlobalColors.textColor),
                ),
                content: Text(
                  'Email salah',
                  style: GoogleFonts.openSans(fontSize: 13, color: GlobalColors.thirdColor),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor,
                      minimumSize: const Size(250, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Baik',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  )
                ],
              );
            },
          );
          return;
        } else if (e.code == 'wrong-password') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Pesan',
                  style: GoogleFonts.openSans(
                      fontSize: 15, fontWeight: FontWeight.w600, color: GlobalColors.textColor),
                ),
                content: Text(
                  'Kata sandi salah',
                  style: GoogleFonts.openSans(fontSize: 13, color: GlobalColors.thirdColor),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor,
                      minimumSize: const Size(250, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Baik',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  )
                ],
              );
            },
          );
          return;
        }
      }
    }

    bool? isChecked = true;
    bool isEmailFocusedA = false;
    bool isPasswordFocusedA = false;
    bool isEmailValidA = true;
    bool obscureText = true;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            children: [
              const SizedBox(height: 5),
              Container(
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(FeatherIcons.x),
                      ),
                      const SizedBox(height: 30),
                      Text('Masuk',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: GlobalColors.textColor,
                          )),
                      const SizedBox(height: 10),
                      Text(
                        'Masuk ke Mr.Garage',
                        style: GoogleFonts.openSans(fontSize: 13, color: GlobalColors.thirdColor),
                      ),
                      const SizedBox(height: 50),
                      Text('Email',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: isEmailFocusedA ? GlobalColors.mainColor : GlobalColors.secondColor,
                          )),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                        ),
                        onChanged: (value) {
                          setState(() {
                            isEmailValidA = validateEmail(value);
                          });
                        },
                        onTap: () {
                          setState(() {
                            isEmailFocusedA = true;
                            isPasswordFocusedA = false;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height,
                            maxWidth: MediaQuery.of(context).size.width,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: GlobalColors.garis,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: GlobalColors.mainColor,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: GlobalColors.garis,
                              width: 1,
                            ),
                          ),
                          hintText: 'contoh@mail.com',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Icon(
                              FeatherIcons.mail,
                              size: 20,
                              color: isEmailFocusedA ? GlobalColors.mainColor : GlobalColors.secondColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text('Kata sandi',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: isPasswordFocusedA ? GlobalColors.mainColor : GlobalColors.secondColor,
                          )),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: passwordController,
                        obscureText: obscureText,
                        style: GoogleFonts.openSans(fontSize: 12),
                        onTap: () {
                          setState(() {
                            isPasswordFocusedA = true;
                            isEmailFocusedA = false;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height,
                            maxWidth: MediaQuery.of(context).size.width,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: GlobalColors.garis, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: GlobalColors.mainColor, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: GlobalColors.garis, width: 1),
                          ),
                          hintText: '********',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Icon(
                              FeatherIcons.key,
                              size: 20,
                              color: isPasswordFocusedA ? GlobalColors.mainColor : GlobalColors.secondColor,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText ? FeatherIcons.eye : FeatherIcons.eyeOff,
                              size: 20,
                              color: GlobalColors.secondColor,
                            ),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value ?? false;
                                  });
                                },
                              ),
                              Text(
                                'Ingat saya',
                                style: GoogleFonts.openSans(
                                  fontSize: 13,
                                  color: GlobalColors.textColor,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (BuildContext context) => const ForgotPage()),
                              );
                            },
                            child: Text(
                              'Lupa password?',
                              style: GoogleFonts.openSans(
                                color: GlobalColors.mainColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 35),
                      ElevatedButton(
                        onPressed: () {
                          if (emailController.text.isEmpty || !isEmailValidA) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Pesan',
                                    style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: GlobalColors.textColor),
                                  ),
                                  content: Text(
                                    'Email belum diisi atau tidak valid',
                                    style: GoogleFonts.openSans(fontSize: 13, color: GlobalColors.thirdColor),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: GlobalColors.mainColor,
                                        minimumSize: const Size(250, 50),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: const Text(
                                        'Baik',
                                        style: TextStyle(fontSize: 15, color: Colors.white),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          } else if (passwordController.text.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Pesan',
                                    style: GoogleFonts.openSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: GlobalColors.textColor),
                                  ),
                                  content: Text(
                                    'Password belum diisi',
                                    style: GoogleFonts.openSans(fontSize: 13, color: GlobalColors.thirdColor),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: GlobalColors.mainColor,
                                        minimumSize: const Size(250, 50),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: const Text(
                                        'Baik',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          } else {
                            loginUser();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: GlobalColors.mainColor,
                            minimumSize: const Size(355, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        child: Text(
                          'Masuk',
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Divider(
                              color: GlobalColors.garis,
                              thickness: 0.5,
                              indent: 60,
                              endIndent: 10,
                            ),
                          ),
                          Text(
                            'atau',
                            style: GoogleFonts.openSans(
                              fontSize: 12,
                              color: GlobalColors.thirdColor,
                            ),
                          ),
                          Flexible(
                            child: Divider(
                              color: GlobalColors.garis,
                              thickness: 0.5,
                              indent: 10,
                              endIndent: 60,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      OutlinedButton(
                        onPressed: () {
                          AuthService().signInWithGoogle();
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: GlobalColors.mainColor,
                          ),
                          minimumSize: const Size(355, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/img/logo/google_icon.png',
                              width: 30,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Masuk dengan Google',
                              style: TextStyle(
                                fontSize: 15,
                                color: GlobalColors.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool validateEmail(String email) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  void navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const PelangganNavBar()),
    );
  }
}
