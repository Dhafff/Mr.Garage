import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mr_garage/view/pelanggan/history/history_pelanggan_tab.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:mr_garage/view/pelanggan/home/pelanggan_homepage.dart';
import 'package:mr_garage/view/pelanggan/home/pelanggan_searchpage.dart';

import '../../../utils/global.colors.dart';

class PelangganNavBar extends StatefulWidget {
  const PelangganNavBar({super.key});

  @override
  _PelangganNavBarState createState() => _PelangganNavBarState();
}

class _PelangganNavBarState extends State<PelangganNavBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: const PelangganHomePage(),
            item: ItemConfig(
              icon: const Icon(FeatherIcons.home),
              title: "Beranda",
              activeForegroundColor: GlobalColors.mainColor,
              inactiveForegroundColor: GlobalColors.secondColor,
              iconSize: 21,
            ),
          ),
          PersistentTabConfig(
            screen: const PelangganSearchPage(),
            item: ItemConfig(
              icon: const Icon(FeatherIcons.search),
              title: "Pencarian",
              activeForegroundColor: GlobalColors.mainColor,
              inactiveForegroundColor: GlobalColors.secondColor,
              iconSize: 21,
            ),
          ),
          PersistentTabConfig(
            screen: const HistoryPelangganTab(),
            item: ItemConfig(
              icon: const Icon(FeatherIcons.fileText),
              title: "Riwayat",
              activeForegroundColor: GlobalColors.mainColor,
              inactiveForegroundColor: GlobalColors.secondColor,
              iconSize: 21,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}
