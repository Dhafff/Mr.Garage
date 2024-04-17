import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:mr_garage/view/pelanggan/home/pelanggan_homepage.dart';
import 'package:mr_garage/view/pelanggan/home/pelanggan_searchpage.dart';

class PelangganMainPage extends StatefulWidget {
  const PelangganMainPage({super.key});

  @override
  _PelangganHomePageState createState() => _PelangganHomePageState();
}

class _PelangganHomePageState extends State<PelangganMainPage> {
  // navigation bar
  int indexPage = 0;
  final screens = [
    PelangganHomePage(),
    PelangganSearchPage(),
  ];

  // konten pelanggan
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: GlobalColors.garis, width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 95, vertical: 20),
          child: GNav(
            gap: 10,
            color: GlobalColors.thirdColor,
            activeColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            tabBackgroundColor: GlobalColors.mainColor,
            textStyle: GoogleFonts.openSans(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            onTabChange: (index) {
              setState(() {
                this.indexPage = index;
              });
            },
            tabs: const [
              GButton(
                icon: FeatherIcons.home,
                text: 'Beranda',
              ),
              GButton(
                icon: FeatherIcons.search,
                text: 'Pencarian',
              ),
            ],
          ),
        ),
      ),
      body: screens[indexPage],
    );
  }
}
