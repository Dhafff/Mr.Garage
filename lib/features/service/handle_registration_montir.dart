import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view/montir/navbar/montir_navbar.dart';
import '../../utils/global.colors.dart';

// register loading (ketika daftar sukses)
class RegisterMontirLoading extends StatelessWidget {
  const RegisterMontirLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(
                backgroundColor: GlobalColors.garis,
                color: GlobalColors.mainColor,
              ),
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
class RegisterMontirSuccess extends StatelessWidget {
  const RegisterMontirSuccess({super.key});

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

void navigateToRegisterMontirLoading(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterMontirLoading()));
}

void navigateToRegisterMontirSuccess(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterMontirSuccess()));
}

void navigateToHome(BuildContext context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => const MontirNavBar()),
  );
}

void handleRegistrationMontirSubmit(BuildContext context) async {
  // Tampilkan halaman loading
  navigateToRegisterMontirLoading(context);

  // Lakukan proses pendaftaran (misalnya pengiriman data ke server)
  await Future.delayed(const Duration(seconds: 6)); // Contoh penundaan simulasi

  // Setelah proses selesai, navigasi ke halaman berhasil
  navigateToRegisterMontirSuccess(context);

  // Tunggu sebentar selama 3 detik
  await Future.delayed(const Duration(seconds: 3));

  // Navigasi ke halaman utama dan hapus semua rute sebelumnya
  navigateToHome(context);
}
