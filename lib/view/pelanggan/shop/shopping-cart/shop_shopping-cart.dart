import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../navbar/pelanggan_navbar.dart';

class ShopShoppingCart extends StatefulWidget {
  const ShopShoppingCart({super.key});

  @override
  _ShopShoppingCartState createState() => _ShopShoppingCartState();
}

class _ShopShoppingCartState extends State<ShopShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  pushScreen(
                    context,
                    screen: const PelangganNavBar(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: const Icon(
                  FeatherIcons.arrowLeft,
                  size: 20,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                'Keranjang',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: GlobalColors.textColor,
                ),
              ),
            ],
          ),
        ),
        titleSpacing: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 60,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: const Column(
              children: [
                Center(
                  child: Text(
                    'Keranjang belum terisi',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
