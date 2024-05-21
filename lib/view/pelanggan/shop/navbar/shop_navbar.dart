import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mr_garage/view/pelanggan/shop/explore/shop_explore.dart';
import 'package:mr_garage/view/pelanggan/shop/shopping-cart/shop_shopping-cart.dart';
import 'package:mr_garage/view/pelanggan/shop/transaction/shop_transaction.dart';
import 'package:mr_garage/view/pelanggan/shop/wishlist/shop_wishlist.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../../utils/global.colors.dart';

class ShopNavbar extends StatefulWidget {
  const ShopNavbar({super.key});

  @override
  State<ShopNavbar> createState() => _ShopNavbarState();
}

class _ShopNavbarState extends State<ShopNavbar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: const ShopExplore(),
            item: ItemConfig(
              icon: const Icon(FeatherIcons.compass),
              title: "Eksplor",
              activeForegroundColor: GlobalColors.mainColor,
              inactiveForegroundColor: GlobalColors.secondColor,
              iconSize: 21,
            ),
          ),
          PersistentTabConfig(
            screen: const ShopShoppingCart(),
            item: ItemConfig(
              icon: const Icon(FeatherIcons.shoppingCart),
              title: "Keranjang",
              activeForegroundColor: GlobalColors.mainColor,
              inactiveForegroundColor: GlobalColors.secondColor,
              iconSize: 21,
            ),
          ),
          PersistentTabConfig(
            screen: const ShopWishlist(),
            item: ItemConfig(
              icon: const Icon(FeatherIcons.heart),
              title: "Wishlist",
              activeForegroundColor: GlobalColors.mainColor,
              inactiveForegroundColor: GlobalColors.secondColor,
              iconSize: 21,
            ),
          ),
          PersistentTabConfig(
            screen: const ShopTransaction(),
            item: ItemConfig(
              icon: const Icon(FeatherIcons.fileText),
              title: "Transaksi",
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
