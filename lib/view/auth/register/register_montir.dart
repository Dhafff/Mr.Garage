import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common/widgets/snackbar/custom_snackbar.dart';
import '../../../utils/global.colors.dart';
import '../../../utils/notification.controller.dart';
import '../landing.view.dart';
import '../../../features/service/handle_registration_montir.dart' as handler;

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
    final bool isValid = EmailValidator.validate(emailController.text.trim());
    if (_pageIndex == 0) {
      if (!_step1FormKey.currentState!.validate()) {
        return;
      }
      // validasi apakah field kosong atau tidak
      if (usernameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomSnackBarContent(
              backgroundColor: HexColor('FAA300'),
              titleMessage: 'Peringatan',
              textMessage: 'Nama pengguna atau email atau kata sandi belum diisi',
              icon: Icons.warning_outlined,
            ),
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
          SnackBar(
            content: CustomSnackBarContent(
              backgroundColor: HexColor('FAA300'),
              titleMessage: 'Peringatan',
              textMessage: 'Nama pengguna harus 6 karakter atau lebih',
              icon: Icons.warning_outlined,
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      } else if (usernameController.text.length > 15) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomSnackBarContent(
              backgroundColor: HexColor('FAA300'),
              titleMessage: 'Peringatan',
              textMessage: 'Nama pengguna tidak boleh lebih dari 15 karakter',
              icon: Icons.warning_outlined,
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      } else if (usernameController.text.contains('#') ||
          usernameController.text.contains('@') ||
          usernameController.text.contains('!')) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomSnackBarContent(
              backgroundColor: HexColor('FAA300'),
              titleMessage: 'Peringatan',
              textMessage: 'Nama pengguna mengandung !, @, dan #',
              icon: Icons.warning_outlined,
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        );
        return;
      }

      // validasi email
      if (!isValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomSnackBarContent(
              backgroundColor: HexColor('FAA300'),
              titleMessage: 'Peringatan',
              textMessage: 'Email tidak valid',
              icon: Icons.warning_outlined,
            ),
          ),
        );
        return;
      }

      // validasi kata sandi
      if (passwordController.text.length < 8 || !passwordController.text.contains(RegExp(r'[0-9]'))) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomSnackBarContent(
              backgroundColor: HexColor('FAA300'),
              titleMessage: 'Peringatan',
              textMessage: 'Kata sandi harus 8 karakter atau lebih dan minimal ada 1 angka',
              icon: Icons.warning_outlined,
            ),
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
            SnackBar(
              content: CustomSnackBarContent(
                backgroundColor: HexColor('FAA300'),
                titleMessage: 'Peringatan',
                textMessage: 'Nama bengkel belum diisi',
                icon: Icons.warning_outlined,
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
          return;
        } else if (workshopLocationController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: CustomSnackBarContent(
                backgroundColor: HexColor('FAA300'),
                titleMessage: 'Peringatan',
                textMessage: 'Lokasi bengkel belum diisi',
                icon: Icons.warning_outlined,
              ),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          );
          return;
        } else if (dropdownValue == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: CustomSnackBarContent(
                backgroundColor: HexColor('FAA300'),
                titleMessage: 'Peringatan',
                textMessage: 'Silahkan pilih kategori bengkel kamu',
                icon: Icons.warning_outlined,
              ),
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
            SnackBar(
              content: CustomSnackBarContent(
                backgroundColor: HexColor('FAA300'),
                titleMessage: 'Peringatan',
                textMessage: 'Nama bengkel tidak boleh ada !, @, dan #',
                icon: Icons.warning_outlined,
              ),
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
      /*
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
      */

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
                            handler.handleRegistrationMontirSubmit(context);
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
          handler.handleRegistrationMontirSubmit(context);
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
                    } else
                      pin4 ??= value;
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
                    } else
                      pin4 ??= value;
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
                    } else
                      pin4 ??= value;
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
                    } else
                      pin4 ??= value;
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
                                              builder: (BuildContext context) => const LandingPage(),
                                            ),
                                          );
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
                      'Ambil foto',
                      style: GoogleFonts.openSans(
                          fontSize: 18, fontWeight: FontWeight.w600, color: GlobalColors.textColor),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Ambil foto untuk foto profil',
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
                          onPressed: () async {
                            Map<Permission, PermissionStatus> statuss = await [
                              Permission.photos,
                            ].request();
                            if (statuss[Permission.photos]!.isGranted) {
                              _pickImageFromGallery();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: CustomSnackBarContent(
                                    backgroundColor: HexColor('FAA300'),
                                    titleMessage: 'Peringatan',
                                    textMessage: 'Akses ditolak',
                                    icon: Icons.warning_outlined,
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                              );
                            }
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
                          onPressed: () async {
                            Map<Permission, PermissionStatus> statuss = await [
                              Permission.camera,
                            ].request();
                            if (statuss[Permission.camera]!.isGranted) {
                              _pickImageFromCamera();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: CustomSnackBarContent(
                                    backgroundColor: HexColor('FAA300'),
                                    titleMessage: 'Peringatan',
                                    textMessage: 'Akses ditolak',
                                    icon: Icons.warning_outlined,
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ),
                              );
                            }
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
              ),
            ],
          ),
        );
      },
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  Future _pickImageFromCamera() async {
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera).then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imgFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9,
            ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Pangkas gambar',
          toolbarColor: GlobalColors.mainColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Pangkas gambar'),
      ],
    );
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        selectedImage = File(croppedFile.path);
      });
    }
  }
}
