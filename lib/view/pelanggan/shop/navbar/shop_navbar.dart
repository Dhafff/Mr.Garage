import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mr_garage/view/pelanggan/shop/explore/shop_explore.dart';
import 'package:mr_garage/view/pelanggan/shop/shopping-cart/shop_shopping-cart.dart';
import 'package:mr_garage/view/pelanggan/shop/transaction/shop_transaction.dart';
import 'package:mr_garage/view/pelanggan/shop/wishlist/shop_wishlist.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../utils/global.colors.dart';

class ShopNavbar extends StatefulWidget {
  const ShopNavbar({super.key});

  @override
  State<ShopNavbar> createState() => _ShopNavbarState();
}

class _ShopNavbarState extends State<ShopNavbar> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      ShopExplore(),
      ShopShoppingCart(),
      ShopWishlist(),
      ShopTransaction(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(FeatherIcons.compass),
        title: ("Eksplor"),
        iconSize: 23,
        activeColorPrimary: GlobalColors.mainColor,
        inactiveColorPrimary: GlobalColors.secondColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FeatherIcons.shoppingCart),
        title: ("Keranjang"),
        iconSize: 23,
        activeColorPrimary: GlobalColors.mainColor,
        inactiveColorPrimary: GlobalColors.secondColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FeatherIcons.heart),
        title: ("Wishlist"),
        iconSize: 23,
        activeColorPrimary: GlobalColors.mainColor,
        inactiveColorPrimary: GlobalColors.secondColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FeatherIcons.fileText),
        title: ("Transaksi"),
        iconSize: 23,
        activeColorPrimary: GlobalColors.mainColor,
        inactiveColorPrimary: GlobalColors.secondColor,
      ),
    ];
  }

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
