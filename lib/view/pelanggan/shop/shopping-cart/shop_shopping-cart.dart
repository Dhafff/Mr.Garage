import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:provider/provider.dart';

import '../../../../features/model/cart.dart';
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PelangganNavBar(),
                    ),
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
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.items.isEmpty) {
            return _buildEmptyCart();
          } else {
            return _buildCartList(cartProvider.items);
          }
        },
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/illustrator/vector_box.png',
            width: 240,
            height: 180,
          ),
          const SizedBox(height: 20),
          Text(
            'Keranjang belum terisi',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: GlobalColors.textColor,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Ayo belanja berbagai kebutuhan\nkendaraanmu di Mr.Garage!',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: 13,
              color: GlobalColors.thirdColor,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartList(List<CartItem> cartItems) {
    final cartProvider = Provider.of<CartProvider>(context);
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(item.imageUrl),
            radius: 30,
          ),
          title: Text(
            item.productTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: GlobalColors.textColor,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rp ${item.price}',
                style: TextStyle(
                  color: GlobalColors.textColor,
                ),
              ),
              // if (item.note.isNotEmpty)
              //   Text(
              //     'Catatan: ${item.note}',
              //     style: TextStyle(
              //       color: GlobalColors.thirdColor,
              //     ),
              //   ),
              Text(
                'Quantity: ${item.quantity}',
                style: TextStyle(
                  color: GlobalColors.textColor,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              cartProvider.removeItem(item.id);
            },
          ),
        );
      },
    );
  }
}
