import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/global.colors.dart';

class ModalChooser2 extends StatelessWidget {
  const ModalChooser2({
    super.key,
    required this.icon,
    required this.modalTitle,
    required this.modalDesc,
    this.color1 = Colors.black,
    required this.button1,
    required this.onPressed1,
    this.color2 = Colors.black,
    required this.button2,
    required this.onPressed2,
  });

  final IconData icon;
  final String modalTitle;
  final String modalDesc;
  final Color color1;
  final String button1;
  final VoidCallback? onPressed1;
  final Color color2;
  final String button2;
  final VoidCallback? onPressed2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: 270,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HexColor('E82327'),
            ),
            child: Icon(
              icon,
              size: 15,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            modalTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: GlobalColors.textColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            modalDesc,
            style: TextStyle(
              fontSize: 13,
              color: GlobalColors.thirdColor,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: onPressed1,
                style: ElevatedButton.styleFrom(
                    backgroundColor: color1,
                    minimumSize: const Size(170, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text(
                  button1,
                  style: GoogleFonts.openSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: onPressed2,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: color2,
                  ),
                  minimumSize: const Size(170, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  button2,
                  style: GoogleFonts.openSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: color2,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
