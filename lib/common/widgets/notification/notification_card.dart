import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_garage/utils/global.colors.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.onTap,
    required this.icon,
    required this.notificationTitle,
    required this.notificationDesc,
  });

  final VoidCallback? onTap;
  final IconData icon;
  final String notificationTitle;
  final String notificationDesc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 80,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: GlobalColors.mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      icon,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notificationTitle,
                        style: GoogleFonts.openSans(
                            fontSize: 13, fontWeight: FontWeight.w600, color: GlobalColors.textColor),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        notificationDesc,
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
                FeatherIcons.chevronDown,
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
