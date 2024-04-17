import 'package:flutter/material.dart';

class RoundedBannerImage extends StatelessWidget {
  const RoundedBannerImage({
    super.key,
    this.border,
    this.padding,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 180,
    this.applyImageRadius = true,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.backgroundColor = Colors.transparent,
    this.isNetworkImage = false,
    this.borderRadius = 15,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final BoxFit? fit;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor,
          border: border,
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
