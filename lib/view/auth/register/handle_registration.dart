import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/global.colors.dart';
import '../../pelanggan/navbar/pelanggan_navbar.dart';

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

void navigateToHome(BuildContext context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => const PelangganNavBar()),
  );
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
  navigateToHome(context);
}
