import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/global.colors.dart';
import '../../navbar/pelanggan_navbar.dart';

class ShopTransaction extends StatefulWidget {
  const ShopTransaction({super.key});

  @override
  _ShopTransactionState createState() => _ShopTransactionState();
}

class _ShopTransactionState extends State<ShopTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PelangganNavBar(),
                    ),
                  );
                },
                child: const Icon(
                  FeatherIcons.arrowLeft,
                  size: 20,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                'Transaksi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: GlobalColors.textColor,
                ),
              ),
            ],
          ),
        ),
        titleSpacing: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 60,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/illustrator/vector_box.png',
              width: 240,
              height: 180,
            ),
            const SizedBox(height: 20),
            Text(
              'Kamu belum pernah belanja',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: GlobalColors.textColor,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Ayo belanja berbagai kebutuhan\nkendaraanmu di Mr.Garage!',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 13,
                color: GlobalColors.thirdColor,
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
