import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_garage/common/widgets/list_view_card/list_card_4.dart';
import 'package:mr_garage/common/widgets/modal/modal_add_details.dart';
import 'package:mr_garage/common/widgets/modal/modal_chooser_2.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:provider/provider.dart';

import '../../../../common/widgets/snackbar/custom_snackbar.dart';
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
    final cartProvider = Provider.of<CartProvider>(context);

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
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.19,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: GlobalColors.garis,
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 15,
                        color: GlobalColors.secondColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Rp${cartProvider.totalPrice}', // Total semua produk
                      style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: GlobalColors.textColor),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/img/icon/icons8-money.png',
                  width: 50,
                ),
              ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: GlobalColors.mainColor,
                minimumSize: Size(MediaQuery.of(context).size.width, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Beli sekarang',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: ListView.separated(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListCard4(
            edit: () {
              Navigator.of(context).pop();
              _showEditModal(context, item, cartProvider);
            },
            delete: () {
              Navigator.of(context).pop();
              _showDeleteModal(
                context,
                () {
                  cartProvider.removeItem(item.id);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: CustomSnackBarContent(
                        backgroundColor: Colors.green,
                        titleMessage: 'Produk dihapus',
                        textMessage: 'Produk berhasil dihapus!',
                        icon: FeatherIcons.checkCircle,
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  );
                },
              );
            },
            imageUrl: item.imageUrl,
            productTitle: item.productTitle,
            price: item.price,
            quantity: item.quantity,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 15);
        },
      ),
    );
  }

  _showEditModal(BuildContext context, CartItem item, CartProvider cartProvider) {
    final TextEditingController catatan = TextEditingController(text: item.note);
    final TextEditingController quantityController = TextEditingController(text: item.quantity.toString());
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return ModalAddDetails(
          image: item.imageUrl,
          titleProduct: item.productTitle,
          price: item.price,
          textButton: 'Ubah',
          onTap: () {
            final quantity = int.tryParse(quantityController.text);
            final updatedItem = item.copy(
              quantity: quantity,
              note: catatan.text,
            );
            cartProvider.updateItem(updatedItem);
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: CustomSnackBarContent(
                  backgroundColor: Colors.green,
                  titleMessage: 'Produk diubah',
                  textMessage: 'Produk berhasil diubah!',
                  icon: FeatherIcons.checkCircle,
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            );
          },
          catatan: catatan,
          quantityController: quantityController,
        );
      },
    );
  }

  _showDeleteModal(BuildContext context, VoidCallback delete) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return ModalChooser2(
          icon: FeatherIcons.trash,
          modalTitle: 'Hapus produk',
          modalDesc: 'Kamu beneran ingin hapus produknya dari keranjang?',
          color1: GlobalColors.mainColor,
          button1: 'Tidak',
          onPressed1: () {
            Navigator.of(context).pop();
          },
          color2: Colors.red,
          button2: 'Hapus',
          onPressed2: delete,
        );
      },
    );
  }
}
