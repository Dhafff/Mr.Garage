import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/global.colors.dart';

class ModalEmail extends StatelessWidget {
  const ModalEmail({
    super.key,
    required this.modalTitle,
    required this.modalDesc,
    this.color1 = Colors.blue,
    required this.button1,
    required this.onPressed1,
    this.color2 = Colors.blue,
    required this.button2,
    required this.onPressed2,
    this.color3 = Colors.blue,
    required this.button3,
    required this.onPressed3,
  });

  final String modalTitle;
  final String modalDesc;
  final Color color1;
  final String button1;
  final VoidCallback? onPressed1;
  final Color color2;
  final String button2;
  final VoidCallback? onPressed2;
  final Color color3;
  final String button3;
  final VoidCallback? onPressed3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: 282,
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
          Text(
            modalTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: GlobalColors.textColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            modalDesc,
            style: TextStyle(
              fontSize: 13,
              color: GlobalColors.thirdColor,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: onPressed1,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: color1,
              ),
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              button1,
              style: GoogleFonts.openSans(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: color1,
              ),
            ),
          ),
          OutlinedButton(
            onPressed: onPressed2,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: color2,
              ),
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              button2,
              style: GoogleFonts.openSans(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: color2,
              ),
            ),
          ),
          OutlinedButton(
            onPressed: onPressed3,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: color3,
              ),
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              button3,
              style: GoogleFonts.openSans(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: color3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
