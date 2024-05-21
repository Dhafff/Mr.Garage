import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent({
    super.key,
    required this.titleMessage,
    required this.textMessage,
    required this.backgroundColor,
    required this.icon,
  });

  final String titleMessage;
  final String textMessage;
  final Color backgroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 90,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              const SizedBox(width: 60),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      titleMessage,
                      style: GoogleFonts.openSans(
                          fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      textMessage,
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
                child: Icon(
                  icon,
                  size: 15,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
