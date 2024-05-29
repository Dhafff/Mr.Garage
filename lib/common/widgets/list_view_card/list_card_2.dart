import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/global.colors.dart';

class ListCard2 extends StatelessWidget {
  const ListCard2({
    super.key,
    required this.onTap,
    this.color = Colors.blue,
    required this.imgUrl,
    required this.titleList,
  });

  final VoidCallback? onTap;
  final Color color;
  final String imgUrl;
  final String titleList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
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
                    child: Image.asset(
                      imgUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    titleList,
                    style: GoogleFonts.openSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: GlobalColors.textColor,
                    ),
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
