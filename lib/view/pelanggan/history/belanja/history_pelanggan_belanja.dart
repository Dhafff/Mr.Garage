import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/global.colors.dart';

class HistoryPelangganBelanja extends StatelessWidget {
  const HistoryPelangganBelanja({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
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
    );
  }
}
