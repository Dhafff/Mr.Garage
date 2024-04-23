import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mr_garage/utils/global.colors.dart';

class ShopCategories extends StatelessWidget {
  const ShopCategories({
    super.key,
    required this.onTap,
    required this.iconUrl,
    required this.categoriesTitle,
  });

  final VoidCallback? onTap;
  final String iconUrl;
  final String categoriesTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: HexColor('F4F4F4'),
              ),
              child: Center(
                child: Image.asset(
                  iconUrl,
                  width: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              categoriesTitle,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.openSans(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: GlobalColors.thirdColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
