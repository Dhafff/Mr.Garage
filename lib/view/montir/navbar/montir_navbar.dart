import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:mr_garage/view/montir/home/montir_homepage.dart';
import 'package:mr_garage/view/montir/message/montir_messagepage.dart';
import 'package:mr_garage/view/montir/workshop/workshop_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MontirNavBar extends StatefulWidget {
  const MontirNavBar({super.key});

  @override
  _MontirNavBarState createState() => _MontirNavBarState();
}

class _MontirNavBarState extends State<MontirNavBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar Demo',
      home: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: const MontirHomePage(),
            item: ItemConfig(
              icon: const Icon(FeatherIcons.home),
              title: "Beranda",
              activeForegroundColor: GlobalColors.mainColor,
              inactiveForegroundColor: GlobalColors.secondColor,
              iconSize: 22,
            ),
          ),
          PersistentTabConfig(
            screen: const WorkshopPage(),
            item: ItemConfig(
              icon: const Icon(Icons.build_outlined),
              title: "Messages",
              activeForegroundColor: GlobalColors.mainColor,
              inactiveForegroundColor: GlobalColors.secondColor,
              iconSize: 22,
            ),
          ),
          PersistentTabConfig(
            screen: const MontirMessagePage(),
            item: ItemConfig(
              icon: const Icon(FeatherIcons.mail),
              title: "Pesan",
              activeForegroundColor: GlobalColors.mainColor,
              inactiveForegroundColor: GlobalColors.secondColor,
              iconSize: 22,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style3BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}
