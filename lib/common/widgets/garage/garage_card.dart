import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/global.colors.dart';

class GarageCard extends StatelessWidget {
  const GarageCard({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.garageTitle,
    required this.garageDesc,
    this.fit = BoxFit.cover,
  });

  final VoidCallback? onTap;
  final String imageUrl;
  final String garageTitle;
  final String garageDesc;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 145,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 145,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: _generateRandomColor(),
                border: Border.all(width: 5, color: HexColor('f5f5f5')),
              ),
              child: Stack(
                children: [
                  // Thumbnail
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Center(
                      child: Image.asset(
                        imageUrl,
                        fit: fit,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Details
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  garageTitle,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: GlobalColors.textColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  garageDesc,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.openSans(
                    fontSize: 10,
                    color: GlobalColors.secondColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
