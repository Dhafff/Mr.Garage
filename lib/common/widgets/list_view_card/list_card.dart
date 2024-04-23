import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/global.colors.dart';

class ListCardService extends StatelessWidget {
  const ListCardService({
    super.key,
    required this.onTap,
    required this.color,
    required this.subtitleList,
  });

  final VoidCallback? onTap;
  final Color color;
  final String subtitleList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: GlobalColors.garis,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.build_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Servis kendaraan',
                        style: GoogleFonts.openSans(
                            fontSize: 13, fontWeight: FontWeight.w600, color: GlobalColors.textColor),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitleList,
                        style: GoogleFonts.openSans(
                          fontSize: 11,
                          color: GlobalColors.thirdColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                FeatherIcons.arrowRight,
                size: 20,
                color: GlobalColors.textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
