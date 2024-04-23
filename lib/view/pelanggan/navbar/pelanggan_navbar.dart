import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:mr_garage/view/pelanggan/home/pelanggan_homepage.dart';
import 'package:mr_garage/view/pelanggan/home/pelanggan_searchpage.dart';

class PelangganNavBar extends StatefulWidget {
  const PelangganNavBar({super.key});

  @override
  _PelangganNavBarState createState() => _PelangganNavBarState();
}

class _PelangganNavBarState extends State<PelangganNavBar> {
  // navigation bar
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [PelangganHomePage(), PelangganSearchPage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(FeatherIcons.home),
        title: ("Beranda"),
        iconSize: 23,
        activeColorPrimary: GlobalColors.mainColor,
        inactiveColorPrimary: GlobalColors.secondColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FeatherIcons.search),
        title: ("Pencarian"),
        iconSize: 23,
        activeColorPrimary: GlobalColors.mainColor,
        inactiveColorPrimary: GlobalColors.secondColor,
      ),
    ];
  }

  // konten pelanggan
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }
}
