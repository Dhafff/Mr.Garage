import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/global.colors.dart';

class HistoryPelangganServis extends StatelessWidget {
  const HistoryPelangganServis({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/img/illustrator/vector_null.png',
              width: 240,
              height: 180,
            ),
          ),
          Text(
            'Kendaraanmu belum pernah\ndi servis',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: GlobalColors.textColor,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Coba servis kendaraanmu, nanti riwayatnya\nmuncul di sini',
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
