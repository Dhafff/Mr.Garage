import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mr_garage/utils/global.colors.dart';

// ignore: must_be_immutable
class ProductCard extends StatefulWidget {
  ProductCard({
    super.key,
    required this.onTap,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    required this.productTitle,
    this.currencySign = 'Rp',
    required this.productPrice,
    required this.productCategory,
    required this.discount,
    this.isFavorite = false,
  });
  final VoidCallback? onTap;
  final String imageUrl;
  final BoxFit fit;
  final String productTitle;
  final String productPrice;
  final String currencySign;
  final String discount;
  final String productCategory;
  bool isFavorite;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isDiscount = false;

  @override
  void initState() {
    super.initState();
    checkDiscount();
  }

  void checkDiscount() {
    if (widget.discount.isNotEmpty && widget.discount != '0') {
      setState(() {
        isDiscount = true;
      });
    } else {
      setState(() {
        isDiscount = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        width: 145,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 145,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _generateRandomColor(),
                border: Border.all(width: 5, color: HexColor('f5f5f5')),
              ),
              child: Stack(
                children: [
                  // Thumbnail
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Center(
                      child: Image.asset(
                        widget.imageUrl,
                        fit: widget.fit,
                      ),
                    ),
                  ),

                  // Fav icon
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.isFavorite = !widget.isFavorite;
                          });
                        },
                        icon: Icon(
                          widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 20,
                          color: widget.isFavorite ? Colors.red : GlobalColors.textColor,
                        ),
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
                  widget.productTitle,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    color: GlobalColors.textColor,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.currencySign + widget.productPrice,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: GlobalColors.textColor,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 20,
                      decoration: BoxDecoration(
                        color: isDiscount ? Colors.green : Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '${widget.discount}%',
                          style: GoogleFonts.openSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Untuk ${widget.productCategory}',
                  style: GoogleFonts.openSans(
                    color: GlobalColors.secondColor,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _generateRandomColor() {
    final List<Color> colors = [
      const Color(0xFFD9D9D9),
      const Color(0xFFBBDEF9),
      const Color(0xFFEFD8BE),
      const Color(0xFFF9DD8F),
      const Color(0xFFFFE6E6),
      const Color(0xFFD1BB9E),
      const Color(0xFFF2C18D),
      const Color(0xFFB4B4B8),
      const Color(0xFFDC8686),
      const Color(0xFFC5EBAA),
    ];

    final Random random = Random();
    return colors[random.nextInt(colors.length)];
  }
}
