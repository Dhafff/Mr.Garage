import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_garage/utils/global.colors.dart';

class VehicleVerticalScrollable extends StatelessWidget {
  const VehicleVerticalScrollable({
    super.key,
    required this.onTap,
    required this.imageUrl,
    this.width = 80,
    this.height = 73,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    required this.vehicleCategory,
    required this.vehicleName,
  });

  final VoidCallback? onTap;
  final String imageUrl;
  final double? width, height;
  final String vehicleCategory;
  final String vehicleName;
  final bool isNetworkImage;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.54,
        height: 75,
        child: Row(
          children: [
            Image(
              image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
              width: width,
              height: height,
              fit: fit,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text(
                  vehicleCategory.toUpperCase(),
                  style: GoogleFonts.openSans(
                    color: GlobalColors.secondColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    wordSpacing: 5,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  vehicleName,
                  style: GoogleFonts.openSans(
                    color: GlobalColors.textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
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
