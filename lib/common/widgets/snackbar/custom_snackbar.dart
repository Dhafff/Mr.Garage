import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent({
    super.key,
    required this.warningText,
  });

  final String warningText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 90,
          decoration: BoxDecoration(color: HexColor('FAA300'), borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              const SizedBox(width: 60),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      'Peringatan!',
                      style: GoogleFonts.openSans(
                          fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      warningText,
                      style: GoogleFonts.openSans(fontSize: 12, color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: SvgPicture.asset(
              'assets/img/icon/bubbles.svg',
              height: 48,
              width: 40,
            ),
          ),
        ),
        Positioned(
          top: -10,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/img/icon/fail.svg',
                height: 40,
              ),
              Positioned(
                top: 3,
                child: Text(
                  '!',
                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
