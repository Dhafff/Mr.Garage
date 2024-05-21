import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/global.colors.dart';

class HistoryPelangganServis extends StatelessWidget {
  const HistoryPelangganServis({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  keyboardType: TextInputType.name,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height,
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: GlobalColors.garis, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: GlobalColors.mainColor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: GlobalColors.garis, width: 1),
                    ),
                    hintText: 'Cari riwayat servis',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Icon(
                        FeatherIcons.search,
                        size: 20,
                        color: GlobalColors.secondColor,
                      ),
                    ),
                  ),
                ),
                IconButton.outlined(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    side: BorderSide(
                      color: GlobalColors.garis,
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(13),
                  ),
                  icon: const Icon(Icons.sort),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
