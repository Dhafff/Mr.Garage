import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/global.colors.dart';

class ModalChooser extends StatelessWidget {
  const ModalChooser({
    super.key,
    required this.modalTitle,
    required this.modalDesc,
    required this.imgUrl1,
    required this.imgLabel1,
    required this.onPressed1,
    required this.imgUrl2,
    required this.imgLabel2,
    required this.onPressed2,
  });

  final String modalTitle;
  final String modalDesc;
  final String imgUrl1;
  final String imgLabel1;
  final VoidCallback? onPressed1;
  final String imgUrl2;
  final String imgLabel2;
  final VoidCallback? onPressed2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
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
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  modalTitle,
                  style: GoogleFonts.openSans(
                      fontSize: 18, fontWeight: FontWeight.w600, color: GlobalColors.textColor),
                ),
                const SizedBox(height: 10),
                Text(
                  modalDesc,
                  style: GoogleFonts.openSans(
                    fontSize: 13,
                    color: GlobalColors.thirdColor,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: onPressed1,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 135),
                        backgroundColor: HexColor('eeeeee'),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            imgUrl1,
                            width: 50,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            imgLabel1,
                            style: GoogleFonts.openSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: HexColor('1e1e1e'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: onPressed2,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 135),
                        backgroundColor: HexColor('eeeeee'),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            imgUrl2,
                            width: 50,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            imgLabel2,
                            style: GoogleFonts.openSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: HexColor('1e1e1e'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
