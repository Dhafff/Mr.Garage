import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mr_garage/view/pelanggan/shop/explore/shop_explore.dart';
import 'package:mr_garage/view/pelanggan/shop/shopping-cart/shop_shopping-cart.dart';
import 'package:mr_garage/view/pelanggan/shop/transaction/shop_transaction.dart';
import 'package:mr_garage/view/pelanggan/shop/wishlist/shop_wishlist.dart';

import '../../../../utils/global.colors.dart';

class ShopNavBar extends StatefulWidget {
  const ShopNavBar({super.key});

  @override
  _ShopNavBarState createState() => _ShopNavBarState();
}

class _ShopNavBarState extends State<ShopNavBar> {
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
              icon: const Icon(FeatherIcons.compass),
              label: 'Ekplor',
              selectedIcon: Icon(
                FeatherIcons.compass,
                color: GlobalColors.mainColor,
              ),
            ),
            NavigationDestination(
              icon: const Icon(FeatherIcons.shoppingCart),
              label: 'Keranjang',
              selectedIcon: Icon(
                FeatherIcons.shoppingCart,
                color: GlobalColors.mainColor,
              ),
            ),
            NavigationDestination(
              icon: const Icon(FeatherIcons.heart),
              label: 'Wishlist',
              selectedIcon: Icon(
                FeatherIcons.heart,
                color: GlobalColors.mainColor,
              ),
            ),
            NavigationDestination(
              icon: const Icon(FeatherIcons.fileText),
              label: 'Transaksi',
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
          ShopExplore(),
          ShopShoppingCart(),
          ShopWishlist(),
          ShopTransaction(),
        ],
      ),
    );
  }
}
