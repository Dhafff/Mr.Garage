import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mr_garage/view/pelanggan/history/history_pelanggan_tab.dart';
import 'package:mr_garage/view/pelanggan/home/pelanggan_homepage.dart';
import 'package:mr_garage/view/pelanggan/home/pelanggan_searchpage.dart';

import '../../../utils/global.colors.dart';

class PelangganNavBar extends StatefulWidget {
  const PelangganNavBar({super.key});

  @override
  _PelangganNavBarState createState() => _PelangganNavBarState();
}

class _PelangganNavBarState extends State<PelangganNavBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: GlobalColors.garis, width: 1.0),
          ),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          height: 70,
          elevation: 0,
          backgroundColor: Colors.white,
          selectedIndex: currentPageIndex,
          indicatorColor: GlobalColors.mainColor.withOpacity(0.1),
          destinations: [
            NavigationDestination(
              icon: const Icon(FeatherIcons.home),
              label: 'Beranda',
              selectedIcon: Icon(
                FeatherIcons.home,
                color: GlobalColors.mainColor,
              ),
            ),
            NavigationDestination(
              icon: const Icon(FeatherIcons.search),
              label: 'Pencarian',
              selectedIcon: Icon(
                FeatherIcons.search,
                color: GlobalColors.mainColor,
              ),
            ),
            NavigationDestination(
              icon: const Icon(FeatherIcons.fileText),
              label: 'Riwayat',
              selectedIcon: Icon(
                FeatherIcons.fileText,
                color: GlobalColors.mainColor,
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: const [
          PelangganHomePage(),
          PelangganSearchPage(),
          HistoryPelangganTab(),
        ],
      ),
    );
  }
}
