import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/global.colors.dart';

class MenuMain extends StatelessWidget {
  const MenuMain({
    super.key,
    required this.onPressed,
    this.isRounded = true,
    required this.iconMenu,
    required this.titleMenu,
  });

  final VoidCallback? onPressed;
  final bool isRounded;
  final IconData iconMenu;
  final String titleMenu;

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 100),
        backgroundColor: HexColor('f5f5f5'),
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: isRounded ? BorderRadius.circular(15) : BorderRadius.circular(0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconMenu,
            size: 22,
            color: GlobalColors.textColor,
          ),
          const SizedBox(height: 10),
          Text(
            titleMenu,
            style: GoogleFonts.openSans(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: HexColor('1e1e1e'),
            ),
          ),
        ],
      ),
    );
  }
}
