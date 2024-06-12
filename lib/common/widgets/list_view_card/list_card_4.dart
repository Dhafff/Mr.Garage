import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/global.colors.dart';

class ListCard4 extends StatelessWidget {
  const ListCard4({
    super.key,
    required this.edit,
    required this.delete,
    required this.imageUrl,
    required this.productTitle,
    required this.price,
    required this.quantity,
  });

  final VoidCallback edit;
  final VoidCallback delete;
  final String imageUrl;
  final String productTitle;
  final int price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85,
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
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: GlobalColors.textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Rp$price • $quantity item',
                      style: GoogleFonts.openSans(
                        fontSize: 13,
                        color: GlobalColors.thirdColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.white,
                  builder: (context) {
                    return SizedBox(
                      height: 280,
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          Container(
                            height: 5,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: edit,
                                  child: Row(
                                    children: [
                                      Icon(
                                        FeatherIcons.edit3,
                                        size: 30,
                                        color: GlobalColors.textColor2,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ubah produk',
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: GlobalColors.textColor),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Ubah detail produk',
                                            style: GoogleFonts.openSans(
                                              fontSize: 11,
                                              color: GlobalColors.secondColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  onTap: delete,
                                  child: Row(
                                    children: [
                                      Icon(
                                        FeatherIcons.trash,
                                        size: 30,
                                        color: GlobalColors.textColor2,
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Hapus produk',
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: GlobalColors.textColor),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Hapus produk dari keranjang',
                                            style: GoogleFonts.openSans(
                                              fontSize: 11,
                                              color: GlobalColors.secondColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Icon(
                FeatherIcons.moreVertical,
                size: 20,
                color: GlobalColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
