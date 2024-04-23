import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/global.colors.dart';
import '../landing.view.dart';

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
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const LandingPage(),
                      ),
                    );
                  },
                  child: const Icon(FeatherIcons.arrowLeft),
                ),
                const SizedBox(height: 30),
                Text(
                  'Lupa password?',
                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: GlobalColors.textColor,
                  ),
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
                const SizedBox(height: 500),
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
