import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:mr_garage/utils/notification.controller.dart';
import 'package:mr_garage/view/pelanggan/pelanggan_main.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
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
                                    fontSize: 18,
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
                              builder: (BuildContext context) {
                                return Container(
                                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                                  height: 270,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Mau daftar jadi apa?',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: GlobalColors.textColor,
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => const RegisterPelangganPage()));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(130, 135),
                                              backgroundColor: HexColor('f8f8f8'),
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
                                                      builder: (context) => const RegisterMontirPage()));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(130, 135),
                                              backgroundColor: HexColor('f8f8f8'),
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
                                );
                              });
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
    final GlobalKey<FormState> _formKey = GlobalKey();
    final TextEditingController emailControllerA = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    bool? isChecked = true;
    bool isEmailFocusedA = false;
    bool isPasswordFocusedA = false;
    bool isEmailValidA = true;
    bool _obscureText = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(30),
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Form(
            key: _formKey,
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
                  controller: emailControllerA,
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
                  obscureText: _obscureText,
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
                        _obscureText ? FeatherIcons.eye : FeatherIcons.eyeOff,
                        size: 20,
                        color: GlobalColors.secondColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
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
                              isChecked = value;
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
                    if (emailControllerA.text.isEmpty || !isEmailValidA) {
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
                          });
                    } else if (passwordController.text.isEmpty) {
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
                                'Password belum diisi atau tidak valid',
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
                          });
                    } else {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => const PelangganMainPage()));
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
                  onPressed: () {},
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
                      const SizedBox(width: 10),
                      Text(
                        'Sign in with Google',
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
        );
      },
    );
  }

  bool validateEmail(String email) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }
}

/* ========= lupa password ========= */

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final TextEditingController emailControllerB = TextEditingController();
  bool isEmailFocusedB = false;
  bool isEmailValidB = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (BuildContext context) => const LandingPage()));
                  },
                  child: const Icon(FeatherIcons.arrowLeft),
                ),
                const SizedBox(height: 30),
                Text(
                  'Lupa password?',
                  style: GoogleFonts.openSans(
                      fontSize: 18, fontWeight: FontWeight.w600, color: GlobalColors.textColor),
                ),
                const SizedBox(height: 10),
                Text(
                  'Tenang, gausah panik. Masukan email kamu yang terdaftar untuk ganti password kamu.',
                  style: GoogleFonts.openSans(
                    fontSize: 13,
                    color: GlobalColors.thirdColor,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Email',
                  style: GoogleFonts.openSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isEmailFocusedB ? GlobalColors.mainColor : GlobalColors.secondColor,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailControllerB,
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                  ),
                  onChanged: (value) {
                    setState(() {
                      isEmailValidB = validateEmail(value);
                    });
                  },
                  onTap: () {
                    setState(() {
                      isEmailFocusedB = true;
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
                        color: isEmailFocusedB ? GlobalColors.mainColor : GlobalColors.secondColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 400),
                ElevatedButton(
                  onPressed: () {
                    if (emailControllerB.text.isEmpty || isEmailValidB) {
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
                          });
                    } else {}
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor,
                      minimumSize: const Size(355, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  child: Text(
                    'Kirim email',
                    style: GoogleFonts.openSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateEmail(String email) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }
}

/* ========= register pelanggan ========= */

class RegisterPelangganPage extends StatefulWidget {
  const RegisterPelangganPage({super.key});

  @override
  _RegisterPelangganPageState createState() => _RegisterPelangganPageState();
}

class _RegisterPelangganPageState extends State<RegisterPelangganPage> {
  int countdown = 60;
  Timer? timer;
  StreamController<int> countdownStream = StreamController<int>();

  Uint8List? _image;
  File? selectedImage;

  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
    );
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    countdownStream.close();
    super.dispose();
  }

  // list judul
  int _pageIndex = 0;
  final List<Map<String, dynamic>> _step = [
    {
      'judul': 'Daftar menjadi pelanggan',
      'deskripsi': 'Mari mulai dengan data pribadi kamu',
      'tombol': 'Selanjutnya',
    },
    {
      'judul': 'Verifikasi email',
      'deskripsi': 'Kami akan mengirimkan kode verifikasi\nkepada anda',
      'tombol': 'Verifikasi',
    },
    {
      'judul': 'Pilih foto',
      'deskripsi': 'Pilih foto untuk foto profil kamu',
      'tombol': 'Selesaikan pendaftaran',
    },
  ];

  // controller
  final GlobalKey<FormState> _step1FormKey = GlobalKey();
  final GlobalKey<FormState> _step2FormKey = GlobalKey();
  final GlobalKey<FormState> _step3FormKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController verificationCodeController = TextEditingController();

  String generatedVerificationCode = '';
  String? pin1, pin2, pin3, pin4;

  bool? isUsernameValid = true;
  bool? isEmailValid = true;
  bool isUsernameFocused = false;
  bool isEmailFocused = false;
  bool isPasswordFocused = false;
  bool _obscureText = true;

  String generateVerificationCode() {
    Random random = Random();
    int fourDigits = random.nextInt(9999);
    return fourDigits.toString().padLeft(4, '0');
  }

  void nextStep() async {
    if (_pageIndex == 0) {
      if (!_step1FormKey.currentState!.validate()) {
        return;
      }
      // validasi apakah field kosong atau tidak
      if (usernameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                CustomSnackBarContent(warningText: 'Nama pengguna atau email\natau kata sandi belum diisi'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      }

      // validasi nama pengguna
      if (usernameController.text.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                CustomSnackBarContent(warningText: 'Nama pengguna harus memiliki\n6 karakter atau lebih'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      } else if (usernameController.text.length > 15) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: CustomSnackBarContent(warningText: 'Nama pengguna melebihi batas\nyaitu 15 karakter'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      } else if (usernameController.text.contains('#') ||
          usernameController.text.contains('@') ||
          usernameController.text.contains('!') ||
          usernameController.text.contains(' ')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: CustomSnackBarContent(warningText: 'Nama pengguna tidak boleh ada\n!, @, #, dan spasi'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      }

      // validasi email
      if (!validateEmail(emailController.text)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: CustomSnackBarContent(warningText: 'Email tidak valid'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      }

      // validasi kata sandi
      if (passwordController.text.length < 8 || !passwordController.text.contains(new RegExp(r'[0-9]'))) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: CustomSnackBarContent(
                warningText:
                    'Kata sandi harus memiliki 8 karakter\natau lebih dan minimal mengandung 1 angka'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      }

      setState(() {
        _pageIndex = 1;
      });

      try {
        generatedVerificationCode = generateVerificationCode();
        // tampilkan notifikasi
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 1,
            channelKey: 'mr-garage_channel',
            title: 'Verifikasi kode',
            body: 'Kode verifikasi kamu adalah $generatedVerificationCode',
          ),
        );
      } catch (exception) {
        print('Error $e');
      }

      // validasi field verifikasi email
    } else if (_pageIndex == 1) {
      if (_step2FormKey.currentState!.validate()) {
        _step2FormKey.currentState!.save();

        if (pin1 != null && pin2 != null && pin3 != null && pin4 != null) {
          String enteredVerificationCode = '$pin1$pin2$pin3$pin4';
          if (enteredVerificationCode.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: CustomSnackBarContent(warningText: 'Kode verifikasi belum diisi'),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
            return setState(() {});
          }
          if (enteredVerificationCode != generatedVerificationCode) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: CustomSnackBarContent(warningText: 'Kode verifikasi salah'),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
            return setState(() {});
          }
        }
      }

      setState(() {
        _pageIndex = 2;
      });

      // validasi foto profil
    } else if (_pageIndex == 2) {
      if (_image == null) {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(30),
              height: 270,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('E82327'),
                    ),
                    child: const Icon(
                      FeatherIcons.alertTriangle,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Gak pakai foto profil?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: GlobalColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Kamu masih bisa atur profil kamu di halaman edit profil',
                    style: TextStyle(
                      fontSize: 13,
                      color: GlobalColors.thirdColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: GlobalColors.mainColor,
                            minimumSize: const Size(170, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: Text(
                          'Tidak',
                          style: GoogleFonts.openSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          handleRegistrationSubmit(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: GlobalColors.mainColor,
                          ),
                          minimumSize: const Size(170, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Yakin',
                          style: GoogleFonts.openSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: GlobalColors.mainColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      } else {
        handleRegistrationSubmit(context);
      }
    }
  }

  bool validateEmail(String email) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final RegExp domainRegex = RegExp(r'\.([a-zA-Z]{2,}|[a-zA-Z]{2}\.[a-zA-Z]{2})$');

    if (!regex.hasMatch(email)) {
      return false;
    }

    String domain = email.split('@')[1];
    if (!domainRegex.hasMatch(domain)) {
      return false;
    }

    return true;
  }

  Widget buildStep1Form() {
    return Form(
      key: _step1FormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text(
            'Nama pengguna',
            style: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isUsernameFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: usernameController,
            keyboardType: TextInputType.name,
            style: GoogleFonts.openSans(
              fontSize: 12,
            ),
            onTap: () {
              setState(() {
                isUsernameFocused = true;
                isEmailFocused = false;
                isPasswordFocused = false;
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
              hintText: 'Nama pengguna',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Icon(
                  FeatherIcons.user,
                  size: 20,
                  color: isUsernameFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Nama pengguna minimal 6 karakter atau lebih',
            style: GoogleFonts.openSans(
              fontSize: 12,
              color: GlobalColors.secondColor,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Email',
            style: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isEmailFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.openSans(
              fontSize: 12,
            ),
            onChanged: (value) {
              setState(() {
                isEmailValid = validateEmail(value);
              });
            },
            onTap: () {
              setState(() {
                isEmailFocused = true;
                isUsernameFocused = false;
                isPasswordFocused = false;
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
              hintText: 'contoh@mail.com',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Icon(
                  FeatherIcons.mail,
                  size: 20,
                  color: isEmailFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Email harus yang valid',
            style: GoogleFonts.openSans(
              fontSize: 12,
              color: GlobalColors.secondColor,
            ),
          ),
          const SizedBox(height: 15),
          Text('Kata sandi',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: isPasswordFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
              )),
          const SizedBox(height: 10),
          TextFormField(
            controller: passwordController,
            obscureText: _obscureText,
            style: GoogleFonts.openSans(fontSize: 12),
            onTap: () {
              setState(() {
                isPasswordFocused = true;
                isUsernameFocused = false;
                isEmailFocused = false;
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
                  color: isPasswordFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? FeatherIcons.eye : FeatherIcons.eyeOff,
                  size: 20,
                  color: GlobalColors.secondColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Kata sandi minimal harus 8 karakter dan 1 angka',
            style: GoogleFonts.openSans(
              fontSize: 12,
              color: GlobalColors.secondColor,
            ),
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }

  Widget buildStep2Form() {
    return Form(
      key: _step2FormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 90,
                width: 70,
                child: TextFormField(
                  style: GoogleFonts.openSans(fontSize: 40),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onSaved: (value) {
                    if (pin1 == null) {
                      pin1 = value;
                    } else if (pin2 == null) {
                      pin2 = value;
                    } else if (pin3 == null) {
                      pin3 = value;
                    } else if (pin4 == null) {
                      pin4 = value;
                    }
                  },
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
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
                  ),
                ),
              ),
              SizedBox(
                height: 90,
                width: 70,
                child: TextFormField(
                  style: GoogleFonts.openSans(fontSize: 40),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onSaved: (value) {
                    if (pin1 == null) {
                      pin1 = value;
                    } else if (pin2 == null) {
                      pin2 = value;
                    } else if (pin3 == null) {
                      pin3 = value;
                    } else if (pin4 == null) {
                      pin4 = value;
                    }
                  },
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
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
                  ),
                ),
              ),
              SizedBox(
                height: 90,
                width: 70,
                child: TextFormField(
                  style: GoogleFonts.openSans(fontSize: 40),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onSaved: (value) {
                    if (pin1 == null) {
                      pin1 = value;
                    } else if (pin2 == null) {
                      pin2 = value;
                    } else if (pin3 == null) {
                      pin3 = value;
                    } else if (pin4 == null) {
                      pin4 = value;
                    }
                  },
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
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
                  ),
                ),
              ),
              SizedBox(
                height: 90,
                width: 70,
                child: TextFormField(
                  style: GoogleFonts.openSans(fontSize: 40),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onSaved: (value) {
                    if (pin1 == null) {
                      pin1 = value;
                    } else if (pin2 == null) {
                      pin2 = value;
                    } else if (pin3 == null) {
                      pin3 = value;
                    } else if (pin4 == null) {
                      pin4 = value;
                    }
                  },
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
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
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Belum menerima kode? ',
                  style: GoogleFonts.openSans(
                    color: GlobalColors.thirdColor,
                    fontSize: 13,
                  ),
                ),
                if (countdown > 0)
                  TextSpan(
                    text: 'Tunggu $countdown detik',
                    style: GoogleFonts.openSans(
                      color: GlobalColors.mainColor,
                      fontSize: 13,
                    ),
                  )
                else
                  TextSpan(
                    text: 'Kirim lagi',
                    style: GoogleFonts.openSans(
                      color: GlobalColors.mainColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        generatedVerificationCode = generateVerificationCode();
                        // tampilkan notifikasi
                        AwesomeNotifications().createNotification(
                          content: NotificationContent(
                            id: 1,
                            channelKey: 'mr-garage_channel',
                            title: 'Verifikasi kode',
                            body: 'Kode verifikasi kamu adalah $generatedVerificationCode',
                            notificationLayout: NotificationLayout.Default,
                          ),
                        );
                        startCountdown();
                        setState(() {
                          countdown = 60;
                        });
                      },
                  ),
              ],
            ),
          ),
          const SizedBox(height: 160),
        ],
      ),
    );
  }

  Widget buildStep3Form() {
    return Form(
      key: _step3FormKey,
      child: Column(
        children: [
          const SizedBox(height: 140),
          Center(
            child: Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 90,
                        backgroundColor: GlobalColors.mainColor,
                        child: CircleAvatar(
                          radius: 87,
                          backgroundImage: MemoryImage(_image!),
                        ),
                      )
                    : CircleAvatar(
                        radius: 90,
                        backgroundColor: GlobalColors.mainColor,
                        child: const CircleAvatar(
                          radius: 87,
                          backgroundImage: AssetImage('assets/img/icon/user-icon.jpg'),
                        ),
                      ),
                Positioned(
                  bottom: 0,
                  left: 135,
                  child: GestureDetector(
                    onTap: () {
                      showImagePickerOption(context);
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: GlobalColors.mainColor,
                      ),
                      child: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 140),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> forms = [
      buildStep1Form(),
      buildStep2Form(),
      buildStep3Form(),
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(30),
                            height: 270,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor('E82327'),
                                  ),
                                  child: const Icon(
                                    FeatherIcons.arrowLeft,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Kembali ke halaman awal?',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: GlobalColors.textColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Semua upaya yang sudah kamu lakuin bakal ke reset',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: GlobalColors.thirdColor,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: GlobalColors.mainColor,
                                          minimumSize: const Size(170, 40),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          )),
                                      child: Text(
                                        'Tidak',
                                        style: GoogleFonts.openSans(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    OutlinedButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext context) => const LandingPage()));
                                        },
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                            color: GlobalColors.mainColor,
                                          ),
                                          minimumSize: const Size(170, 40),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Text(
                                          'Kembali',
                                          style: GoogleFonts.openSans(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: GlobalColors.mainColor,
                                          ),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: const Icon(FeatherIcons.arrowLeft),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (BuildContext context) => const LandingPage()));
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/img/logo/logo-mrgarage.png',
                        width: 40,
                      ),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Mr.Garage',
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            color: GlobalColors.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  _step[_pageIndex]['judul']!,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: GlobalColors.textColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _step[_pageIndex]['deskripsi']!,
                  style: GoogleFonts.openSans(fontSize: 13, color: GlobalColors.thirdColor),
                ),
                forms[_pageIndex],
                ElevatedButton(
                  onPressed: () {
                    nextStep();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor,
                      minimumSize: const Size(355, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  child: Text(
                    _step[_pageIndex]['tombol'],
                    style: GoogleFonts.openSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          height: 270,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Text(
                'Ambil foto untuk foto profil',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: GlobalColors.textColor,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _pickImageFromGallery();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(130, 135),
                      backgroundColor: HexColor('f8f8f8'),
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/icon/icons8-photo.png',
                          width: 50,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Galeri',
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
                      _pickImageFromCamera();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(130, 135),
                      backgroundColor: HexColor('f8f8f8'),
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/icon/icons8-camera.png',
                          width: 50,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Kamera',
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
        );
      },
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  Future _pickImageFromCamera() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}

/* ========= register montir ========= */

class RegisterMontirPage extends StatefulWidget {
  const RegisterMontirPage({super.key});

  @override
  _RegisterMontirPageState createState() => _RegisterMontirPageState();
}

class _RegisterMontirPageState extends State<RegisterMontirPage> {
  int countdown = 60;
  Timer? timer;
  StreamController<int> countdownStream = StreamController<int>();

  Uint8List? _image;
  File? selectedImage;

  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: NotificationController.onDismissActionReceivedMethod,
    );
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    countdownStream.close();
    super.dispose();
  }

  // list dropdown
  final List<String> categoryList = [
    'Bengkel motor',
    'Bengkel mobil',
    'Bengkel motor dan mobil',
  ];
  String? dropdownValue;

  // list judul
  int _pageIndex = 0;
  final List<Map<String, dynamic>> _step = [
    {
      'judul': 'Daftar menjadi montir',
      'deskripsi': 'Mari mulai dengan data pribadi kamu',
      'tombol': 'Selanjutnya',
    },
    {
      'judul': 'Daftar menjadi montir',
      'deskripsi': 'Kemudian, masukan data bengkel kamu',
      'tombol': 'Selanjutnya',
    },
    {
      'judul': 'Verifikasi email',
      'deskripsi': 'Kami akan mengirimkan kode verifikasi\nke kamu',
      'tombol': 'Verifikasi',
    },
    {
      'judul': 'Pilih foto',
      'deskripsi': 'Pilih foto untuk foto bengkel kamu',
      'tombol': 'Selesaikan pendaftaran',
    },
  ];

  // controller
  final GlobalKey<FormState> _step1FormKey = GlobalKey();
  final GlobalKey<FormState> _step2FormKey = GlobalKey();
  final GlobalKey<FormState> _step3FormKey = GlobalKey();
  final GlobalKey<FormState> _step4FormKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController workshopNameController = TextEditingController();
  final TextEditingController workshopLocationController = TextEditingController();
  final TextEditingController workshopCategoryController = TextEditingController();

  String generatedVerificationCode = '';
  String? pin1, pin2, pin3, pin4;

  bool? isUsernameValid = true;
  bool? isEmailValid = true;
  bool isUsernameFocused = false;
  bool isEmailFocused = false;
  bool isPasswordFocused = false;
  bool isWorkshopNameFocused = false;
  bool isWorkshopLocationFocused = false;
  bool isWorkshopCategoryFocused = false;
  bool _obscureText = true;

  String generateVerificationCode() {
    Random random = Random();
    int fourDigits = random.nextInt(9999);
    return fourDigits.toString().padLeft(4, '0');
  }

  void nextStep() async {
    if (_pageIndex == 0) {
      if (!_step1FormKey.currentState!.validate()) {
        return;
      }
      // validasi apakah field kosong atau tidak
      if (usernameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                CustomSnackBarContent(warningText: 'Nama pengguna atau email\natau kata sandi belum diisi'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      }

      // validasi nama pengguna
      if (usernameController.text.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                CustomSnackBarContent(warningText: 'Nama pengguna harus memiliki\n6 karakter atau lebih'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      } else if (usernameController.text.length > 15) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: CustomSnackBarContent(warningText: 'Nama pengguna melebihi batas\nyaitu 15 karakter'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      } else if (usernameController.text.contains('#') ||
          usernameController.text.contains('@') ||
          usernameController.text.contains('!') ||
          usernameController.text.contains(' ')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: CustomSnackBarContent(warningText: 'Nama pengguna tidak boleh ada\n!, @, #, dan spasi'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      }

      // validasi email
      if (!validateEmail(emailController.text)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: CustomSnackBarContent(warningText: 'Email tidak valid'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      }

      // validasi kata sandi
      if (passwordController.text.length < 8 || !passwordController.text.contains(RegExp(r'[0-9]'))) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: CustomSnackBarContent(
                warningText:
                    'Kata sandi harus memiliki 8 karakter\natau lebih dan minimal mengandung 1 angka'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      }

      setState(() {
        _pageIndex = 1;
      });

      // validasi field data montir
    } else if (_pageIndex == 1) {
      if (_step2FormKey.currentState!.validate()) {
        _step2FormKey.currentState!.save();

        if (workshopNameController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: CustomSnackBarContent(warningText: 'Nama bengkel belum diisi'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
          return;
        } else if (workshopLocationController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: CustomSnackBarContent(warningText: 'Lokasi bengkel belum diisi'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
          return;
        } else if (dropdownValue == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: CustomSnackBarContent(warningText: 'Silahkan pilih kategori bengkel kamu'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
          return;
        }

        if (workshopNameController.text.contains('!') ||
            workshopNameController.text.contains('@') ||
            workshopNameController.text.contains('#')) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: CustomSnackBarContent(warningText: 'Nama bengkel tidak boleh ada !, @, dan #'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
          return;
        }

        setState(() {
          _pageIndex = 2;
        });

        generatedVerificationCode = generateVerificationCode();
        // tampilkan notifikasi
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 1,
            channelKey: 'mr-garage_channel',
            title: 'Verifikasi kode',
            body: 'Kode verifikasi kamu adalah $generatedVerificationCode',
          ),
        );
      }

      // validasi verifikasi email
    } else if (_pageIndex == 2) {
      if (_step3FormKey.currentState!.validate()) {
        _step3FormKey.currentState!.save();

        if (pin1 != null && pin2 != null && pin3 != null && pin4 != null) {
          String enteredVerificationCode = '$pin1$pin2$pin3$pin4';
          if (enteredVerificationCode.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: CustomSnackBarContent(warningText: 'Kode verifikasi belum diisi'),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
            return setState(() {});
          }
          if (enteredVerificationCode != generatedVerificationCode) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: CustomSnackBarContent(warningText: 'Kode verifikasi salah'),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
            return setState(() {});
          }
        }
      }

      setState(() {
        _pageIndex = 3;
      });

      // validasi foto profil
    } else if (_pageIndex == 3) {
      if (_step4FormKey.currentState!.validate()) {
        _step4FormKey.currentState!.save();
        if (_image == null) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.all(30),
                height: 270,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor('E82327'),
                      ),
                      child: const Icon(
                        FeatherIcons.alertTriangle,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Gak pakai foto profil?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: GlobalColors.textColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Kamu masih bisa atur profil kamu di halaman edit profil',
                      style: TextStyle(
                        fontSize: 13,
                        color: GlobalColors.thirdColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: GlobalColors.mainColor,
                              minimumSize: const Size(170, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Text(
                            'Tidak',
                            style: GoogleFonts.openSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            handleRegistrationSubmit(context);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: GlobalColors.mainColor,
                            ),
                            minimumSize: const Size(170, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Yakin',
                            style: GoogleFonts.openSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: GlobalColors.mainColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        } else {
          handleRegistrationSubmit(context);
        }
      }
    }
  }

  bool validateEmail(String email) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final RegExp domainRegex = RegExp(r'\.([a-zA-Z]{2,}|[a-zA-Z]{2}\.[a-zA-Z]{2})$');

    if (!regex.hasMatch(email)) {
      return false;
    }

    String domain = email.split('@')[1];
    if (!domainRegex.hasMatch(domain)) {
      return false;
    }

    return true;
  }

  Widget buildStep1Form() {
    return Form(
      key: _step1FormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text(
            'Nama pengguna',
            style: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isUsernameFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: usernameController,
            keyboardType: TextInputType.name,
            style: GoogleFonts.openSans(
              fontSize: 12,
            ),
            onTap: () {
              setState(() {
                isUsernameFocused = true;
                isEmailFocused = false;
                isPasswordFocused = false;
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
              hintText: 'Nama pengguna',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Icon(
                  FeatherIcons.user,
                  size: 20,
                  color: isUsernameFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Nama pengguna minimal 6 karakter atau lebih',
            style: GoogleFonts.openSans(
              fontSize: 12,
              color: GlobalColors.secondColor,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Email',
            style: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isEmailFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.openSans(
              fontSize: 12,
            ),
            onChanged: (value) {
              setState(() {
                isEmailValid = validateEmail(value);
              });
            },
            onTap: () {
              setState(() {
                isEmailFocused = true;
                isUsernameFocused = false;
                isPasswordFocused = false;
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
              hintText: 'contoh@mail.com',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Icon(
                  FeatherIcons.mail,
                  size: 20,
                  color: isEmailFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Email harus yang valid',
            style: GoogleFonts.openSans(
              fontSize: 12,
              color: GlobalColors.secondColor,
            ),
          ),
          const SizedBox(height: 15),
          Text('Kata sandi',
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: isPasswordFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
              )),
          const SizedBox(height: 10),
          TextFormField(
            controller: passwordController,
            obscureText: _obscureText,
            style: GoogleFonts.openSans(fontSize: 12),
            onTap: () {
              setState(() {
                isPasswordFocused = true;
                isUsernameFocused = false;
                isEmailFocused = false;
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
                  color: isPasswordFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? FeatherIcons.eye : FeatherIcons.eyeOff,
                  size: 20,
                  color: GlobalColors.secondColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Kata sandi minimal harus 8 karakter dan 1 angka',
            style: GoogleFonts.openSans(
              fontSize: 12,
              color: GlobalColors.secondColor,
            ),
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }

  Widget buildStep2Form() {
    return Form(
      key: _step2FormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text(
            'Nama bengkel',
            style: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isWorkshopNameFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: workshopNameController,
            keyboardType: TextInputType.name,
            style: GoogleFonts.openSans(
              fontSize: 12,
            ),
            onTap: () {
              setState(() {
                isWorkshopNameFocused = true;
                isWorkshopLocationFocused = false;
                isWorkshopCategoryFocused = false;
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
              hintText: 'Nama bengkel',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Icon(
                  Icons.garage_outlined,
                  size: 20,
                  color: isWorkshopNameFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Alamat bengkel',
            style: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isEmailFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: workshopLocationController,
            keyboardType: TextInputType.streetAddress,
            style: GoogleFonts.openSans(
              fontSize: 12,
            ),
            onTap: () {
              setState(() {
                isWorkshopNameFocused = false;
                isWorkshopLocationFocused = true;
                isWorkshopCategoryFocused = false;
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
              hintText: 'Lokasi bengkel kamu',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Icon(
                  FeatherIcons.mapPin,
                  size: 20,
                  color: isWorkshopLocationFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Kategori bengkel',
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: GlobalColors.secondColor,
            ),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField2<String>(
            isExpanded: true,
            hint: Text(
              'Kategori bengkel kamu',
              style: GoogleFonts.openSans(fontSize: 12),
            ),
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
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.build_outlined,
                  size: 20,
                  color: isWorkshopLocationFocused ? GlobalColors.mainColor : GlobalColors.secondColor,
                ),
              ),
            ),
            value: dropdownValue,
            onChanged: (value) {
              print(value);
              setState(() {
                dropdownValue = value;
              });
            },
            items: categoryList
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        color: GlobalColors.textColor,
                      ),
                    ),
                  ),
                )
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Silahkan pilih kategori bengkel kamu';
              }
              return null;
            },
            onSaved: (value) {
              dropdownValue = value.toString();
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 15),
            ),
            iconStyleData: IconStyleData(
              icon: Icon(
                FeatherIcons.chevronDown,
                color: GlobalColors.secondColor,
              ),
              iconSize: 20,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }

  Widget buildStep3Form() {
    return Form(
      key: _step3FormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 90,
                width: 70,
                child: TextFormField(
                  style: GoogleFonts.openSans(fontSize: 40),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onSaved: (value) {
                    if (pin1 == null) {
                      pin1 = value;
                    } else if (pin2 == null) {
                      pin2 = value;
                    } else if (pin3 == null) {
                      pin3 = value;
                    } else if (pin4 == null) {
                      pin4 = value;
                    }
                  },
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
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
                  ),
                ),
              ),
              SizedBox(
                height: 90,
                width: 70,
                child: TextFormField(
                  style: GoogleFonts.openSans(fontSize: 40),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onSaved: (value) {
                    if (pin1 == null) {
                      pin1 = value;
                    } else if (pin2 == null) {
                      pin2 = value;
                    } else if (pin3 == null) {
                      pin3 = value;
                    } else if (pin4 == null) {
                      pin4 = value;
                    }
                  },
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
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
                  ),
                ),
              ),
              SizedBox(
                height: 90,
                width: 70,
                child: TextFormField(
                  style: GoogleFonts.openSans(fontSize: 40),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onSaved: (value) {
                    if (pin1 == null) {
                      pin1 = value;
                    } else if (pin2 == null) {
                      pin2 = value;
                    } else if (pin3 == null) {
                      pin3 = value;
                    } else if (pin4 == null) {
                      pin4 = value;
                    }
                  },
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
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
                  ),
                ),
              ),
              SizedBox(
                height: 90,
                width: 70,
                child: TextFormField(
                  style: GoogleFonts.openSans(fontSize: 40),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onSaved: (value) {
                    if (pin1 == null) {
                      pin1 = value;
                    } else if (pin2 == null) {
                      pin2 = value;
                    } else if (pin3 == null) {
                      pin3 = value;
                    } else if (pin4 == null) {
                      pin4 = value;
                    }
                  },
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
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
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Belum menerima kode? ',
                  style: GoogleFonts.openSans(
                    color: GlobalColors.thirdColor,
                    fontSize: 13,
                  ),
                ),
                if (countdown > 0)
                  TextSpan(
                    text: 'Tunggu $countdown detik',
                    style: GoogleFonts.openSans(
                      color: GlobalColors.mainColor,
                      fontSize: 13,
                    ),
                  )
                else
                  TextSpan(
                    text: 'Kirim lagi',
                    style: GoogleFonts.openSans(
                      color: GlobalColors.mainColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        generatedVerificationCode = generateVerificationCode();
                        // tampilkan notifikasi
                        AwesomeNotifications().createNotification(
                          content: NotificationContent(
                            id: 1,
                            channelKey: 'mr-garage_channel',
                            title: 'Verifikasi kode',
                            body: 'Kode verifikasi kamu adalah $generatedVerificationCode',
                            notificationLayout: NotificationLayout.Default,
                          ),
                        );
                        startCountdown();
                        setState(() {
                          countdown = 60;
                        });
                      },
                  ),
              ],
            ),
          ),
          const SizedBox(height: 160),
        ],
      ),
    );
  }

  Widget buildStep4Form() {
    return Form(
      key: _step4FormKey,
      child: Column(
        children: [
          const SizedBox(height: 140),
          Center(
            child: Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 90,
                        backgroundColor: GlobalColors.mainColor,
                        child: CircleAvatar(
                          radius: 87,
                          backgroundImage: MemoryImage(_image!),
                        ),
                      )
                    : CircleAvatar(
                        radius: 90,
                        backgroundColor: GlobalColors.mainColor,
                        child: const CircleAvatar(
                          radius: 87,
                          backgroundImage: AssetImage('assets/img/icon/user-icon.jpg'),
                        ),
                      ),
                Positioned(
                  bottom: 0,
                  left: 135,
                  child: GestureDetector(
                    onTap: () {
                      showImagePickerOption(context);
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: GlobalColors.mainColor,
                      ),
                      child: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 140),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> forms = [
      buildStep1Form(),
      buildStep2Form(),
      buildStep3Form(),
      buildStep4Form(),
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(30),
                            height: 270,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor('E82327'),
                                  ),
                                  child: const Icon(
                                    FeatherIcons.arrowLeft,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Kembali ke halaman awal?',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: GlobalColors.textColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Semua upaya yang sudah kamu lakuin bakal ke reset',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: GlobalColors.thirdColor,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: GlobalColors.mainColor,
                                          minimumSize: const Size(170, 40),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          )),
                                      child: Text(
                                        'Tidak',
                                        style: GoogleFonts.openSans(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    OutlinedButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext context) => const LandingPage()));
                                        },
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                            color: GlobalColors.mainColor,
                                          ),
                                          minimumSize: const Size(170, 40),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Text(
                                          'Kembali',
                                          style: GoogleFonts.openSans(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: GlobalColors.mainColor,
                                          ),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: const Icon(FeatherIcons.arrowLeft),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (BuildContext context) => const LandingPage()));
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/img/logo/logo-mrgarage.png',
                        width: 40,
                      ),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Mr.Garage',
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            color: GlobalColors.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  _step[_pageIndex]['judul']!,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: GlobalColors.textColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _step[_pageIndex]['deskripsi']!,
                  style: GoogleFonts.openSans(fontSize: 13, color: GlobalColors.thirdColor),
                ),
                forms[_pageIndex],
                ElevatedButton(
                  onPressed: () {
                    nextStep();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.mainColor,
                      minimumSize: const Size(355, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  child: Text(
                    _step[_pageIndex]['tombol'],
                    style: GoogleFonts.openSans(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          height: 270,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Text(
                'Ambil foto untuk foto profil',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: GlobalColors.textColor,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _pickImageFromGallery();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(130, 135),
                      backgroundColor: HexColor('f8f8f8'),
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/icon/icons8-photo.png',
                          width: 50,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Galeri',
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
                      _pickImageFromCamera();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(130, 135),
                      backgroundColor: HexColor('f8f8f8'),
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/icon/icons8-camera.png',
                          width: 50,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Kamera',
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
        );
      },
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  Future _pickImageFromCamera() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent({
    super.key,
    required this.warningText,
  });

  final String warningText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 90,
          decoration: BoxDecoration(color: HexColor('FAA300'), borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              const SizedBox(width: 60),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      'Peringatan!',
                      style: GoogleFonts.openSans(
                          fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      warningText,
                      style: GoogleFonts.openSans(fontSize: 13, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
              'assets/img/icon/bubbles.svg',
              height: 48,
              width: 40,
            ),
          ),
        ),
        Positioned(
          top: -10,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/img/icon/fail.svg',
                height: 40,
              ),
              Positioned(
                top: 3,
                child: Text(
                  '!',
                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

// register loading (ketika daftar sukses)
class RegisterLoading extends StatelessWidget {
  const RegisterLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(backgroundColor: GlobalColors.mainColor),
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
class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({super.key});

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

void navigateToRegisterLoading(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterLoading()));
}

void navigateToRegisterSuccess(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterSuccess()));
}

void handleRegistrationSubmit(BuildContext context) async {
  // Tampilkan halaman loading
  navigateToRegisterLoading(context);

  // Lakukan proses pendaftaran (misalnya pengiriman data ke server)
  await Future.delayed(const Duration(seconds: 6)); // Contoh penundaan simulasi

  // Setelah proses selesai, navigasi ke halaman berhasil
  navigateToRegisterSuccess(context);

  // Tunggu sebentar selama 3 detik
  await Future.delayed(const Duration(seconds: 3));

  // Navigasi ke halaman utama dan hapus semua rute sebelumnya
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const PelangganMainPage()), // Hapus semua rute sebelumnya
  );
}
