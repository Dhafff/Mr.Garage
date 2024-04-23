import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_garage/utils/global.colors.dart';

class PelangganSearchPage extends StatefulWidget {
  const PelangganSearchPage({super.key});

  @override
  _PelangganSearchState createState() => _PelangganSearchState();
}

class _PelangganSearchState extends State<PelangganSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pencarian',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: GlobalColors.textColor,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.name,
                style: GoogleFonts.openSans(
                  fontSize: 12,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                    maxWidth: MediaQuery.of(context).size.width,
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
                  hintText: 'Cari layanan, suku cadang, bengkel, dll',
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
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 140,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/img/illustrator/vector_null.png',
                width: 240,
                height: 180,
              ),
            ),
            Text(
              'Kamu belum cari\napa-apa',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: GlobalColors.textColor,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Coba cari sesuatu, deh. Nanti\ndi tampilin di sini.',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 13,
                color: GlobalColors.thirdColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
