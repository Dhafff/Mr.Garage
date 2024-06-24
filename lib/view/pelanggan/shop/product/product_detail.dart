// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mr_garage/common/widgets/comments/comments_product.dart';
import 'package:mr_garage/common/widgets/list_view_card/list_card_3.dart';
import 'package:mr_garage/common/widgets/modal/modal_add_details.dart';
import 'package:mr_garage/features/model/cart.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:mr_garage/view/pelanggan/navbar/pelanggan_navbar.dart';
import 'package:mr_garage/view/pelanggan/shop/navbar/shop_navbar.dart';
import 'package:mr_garage/view/pelanggan/shop/product/product_checkout.dart';
import 'package:provider/provider.dart';

import '../../../../common/widgets/product/product_card.dart';
import '../../../../features/model/product.dart';

// ignore: must_be_immutable
class ProductDetail extends StatefulWidget {
  ProductDetail({
    super.key,
    required this.previousPage,
    required this.imageUrl,
    required this.category,
    required this.productTitle,
    this.isFavorite = false,
    required this.productActualPrice,
    required this.discount,
    this.currencySign = 'Rp',
    required this.rating,
    required this.userRating,
    required this.userComment,
    required this.review,
    required this.reviewer,
    required this.sold,
    required this.descProduct,
    required this.sellerName,
    required this.sellerImg,
    required this.sellerLocation,
    required this.lastActive,
  });

  final String previousPage;
  final String imageUrl;
  final String category;
  final String productTitle;
  final String sellerName;
  final String sellerImg;
  final String sellerLocation;
  final String lastActive;
  final int productActualPrice;
  final double discount;
  final String currencySign;
  final double rating;
  final double userRating;
  final String userComment;
  final int review;
  final int sold;
  final String reviewer;
  final String descProduct;
  bool isFavorite;

  int get productDiscountPrice {
    return (productActualPrice * (1 - discount)).toInt();
  }

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final ProductShop _productShop = ProductShop();
  late Future<List<Product>> _productsFuture;
  bool isDiscount = false;

  @override
  void initState() {
    super.initState();
    _productsFuture = _productShop.fetchProducts();
    checkDiscount();
  }

  void checkDiscount() {
    if (widget.discount > 0.01) {
      setState(() {
        isDiscount = true;
      });
    } else {
      setState(() {
        isDiscount = false;
      });
    }
  }

  String timeAgo(DateTime lastActive) {
    final now = DateTime.now();
    final difference = now.difference(lastActive);

    if (difference.inMinutes < 60) {
      return 'Aktif ${difference.inMinutes} menit yang lalu';
    } else if (difference.inHours < 24) {
      return 'Aktif ${difference.inHours} jam yang lalu';
    } else {
      return 'Aktif ${difference.inDays} hari yang lalu';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: GestureDetector(
            onTap: () {
              if (widget.previousPage == 'PelangganHomePage') {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const PelangganNavBar(),
                  ),
                );
              } else if (widget.previousPage == 'ShopExplore') {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const ShopNavBar(),
                  ),
                );
              }
            },
            child: SizedBox(
              width: 25,
              height: 25,
              child: Icon(
                FeatherIcons.arrowLeft,
                color: GlobalColors.textColor,
                size: 20,
              ),
            ),
          ),
        ),
        title: Text(
          'Detail produk',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: GlobalColors.textColor,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.isFavorite = !widget.isFavorite;
                });
              },
              child: SizedBox(
                width: 25,
                height: 25,
                child: Icon(
                  widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                  color: widget.isFavorite ? Colors.red : GlobalColors.textColor,
                ),
              ),
            ),
          ),
        ],
        elevation: 0,
        titleSpacing: 10,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.category,
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: GlobalColors.secondColor,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.productTitle,
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: GlobalColors.textColor,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (widget.review > 0) ...[
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.yellow,
                  ),
                  const SizedBox(width: 5),
                ],
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 12,
                      color: GlobalColors.textColor,
                    ),
                    children: [
                      if (widget.review > 0) ...[
                        TextSpan(
                          text: '${widget.rating}',
                        ),
                        TextSpan(
                          text: ' (${widget.review} Ulasan) • ',
                          style: TextStyle(color: GlobalColors.secondColor),
                        ),
                      ],
                      if (widget.sold > 0) ...[
                        TextSpan(
                          text: 'Terjual ${widget.sold}',
                          style: TextStyle(color: GlobalColors.secondColor),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ListCard3(
              onTap: () {},
              image: widget.sellerImg,
              storeName: widget.sellerName,
              location: widget.sellerLocation,
              active: widget.lastActive,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tentang produk',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: GlobalColors.textColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    FeatherIcons.arrowRight,
                    size: 20,
                    color: GlobalColors.textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              widget.descProduct,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 12,
                color: GlobalColors.textColor2,
                height: 1.8,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ulasan produk',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: GlobalColors.textColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    FeatherIcons.arrowRight,
                    size: 20,
                    color: GlobalColors.textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CommentsProduct(
              userImg: 'assets/img/icon/user-icon.jpg',
              user: widget.reviewer,
              userComment: widget.userComment,
              rating: widget.userRating,
              date: '05 Nov 2023',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Produk lainnya',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: GlobalColors.textColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    FeatherIcons.arrowRight,
                    size: 20,
                    color: GlobalColors.textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            _buildProductListFutureBuilder(
              filter: (product) => product.discount > 0.4,
            ),
          ],
        ),
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
                    if (isDiscount == true)
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 20,
                            decoration: BoxDecoration(
                              color: isDiscount ? Colors.green : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                '${(widget.discount * 100).toStringAsFixed(0)}%',
                                style: GoogleFonts.openSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${widget.currencySign}${widget.productActualPrice}',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              fontSize: 10,
                              color: GlobalColors.secondColor,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    if (isDiscount == false)
                      Text(
                        'Harga',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 13,
                          color: GlobalColors.secondColor,
                        ),
                      ),
                    const SizedBox(height: 5),
                    if (isDiscount == true)
                      Text(
                        '${widget.currencySign}${widget.productDiscountPrice}',
                        style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: GlobalColors.textColor),
                      ),
                    if (isDiscount == false)
                      Text(
                        '${widget.currencySign}${widget.productActualPrice}',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    showModalAddDetails(context, 'Beli sekarang');
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: GlobalColors.mainColor,
                    ),
                    minimumSize: const Size(170, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Beli',
                    style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: GlobalColors.mainColor),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalAddDetails(context, 'Tambah ke keranjang');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColors.mainColor,
                    minimumSize: const Size(170, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Keranjang',
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
          ],
        ),
      ),
    );
  }

  void showModalAddDetails(BuildContext context, String text) {
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController catatanController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return ModalAddDetails(
          onTap: () async {
            final quantity = int.tryParse(quantityController.text) ?? 1;
            final cartItem = CartItem(
              id: '',
              imageUrl: widget.imageUrl,
              productTitle: widget.productTitle,
              note: catatanController.text.isEmpty ? '' : catatanController.text,
              price: isDiscount ? widget.productDiscountPrice : widget.productActualPrice,
              quantity: quantity,
            );
            Navigator.of(context).pop();
            addToCart(context, cartItem);
          },
          image: widget.imageUrl,
          titleProduct: widget.productTitle,
          price: isDiscount ? widget.productDiscountPrice : widget.productActualPrice,
          textButton: text,
          catatan: catatanController,
          quantityController: quantityController,
        );
      },
    );
  }

  void addToCart(BuildContext context, CartItem item) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(item);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Produk ditambahkan',
            style: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: GlobalColors.textColor,
            ),
          ),
          content: Text('${item.productTitle} telah ditambahkan ke keranjang.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShopNavBar()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProductListFutureBuilder({required bool Function(Product) filter}) {
    return FutureBuilder<List<Product>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingAnimationWidget.staggeredDotsWave(color: GlobalColors.mainColor, size: 50),
          );
        } else if (snapshot.hasError) {
          print('Error: ${snapshot.hasError}');
          return Center(
            child: Text(
              'Waduh, ada yang salah nih',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: GlobalColors.textColor2,
              ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'Waduh, produk gaada',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: GlobalColors.textColor2,
              ),
            ),
          );
        } else {
          final products = snapshot.data!.where(filter).toList();
          return _buildProductList(products);
        }
      },
    );
  }

  Widget _buildProductList(List<Product> products) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetail(
                    previousPage: 'ShopExplore',
                    imageUrl: product.imageUrl,
                    category: product.category,
                    productTitle: product.productTitle,
                    productActualPrice: product.price,
                    rating: product.rating,
                    userRating: product.userRating,
                    userComment: product.userComment,
                    review: product.review,
                    reviewer: product.reviewer,
                    sold: product.sold,
                    discount: product.discount,
                    descProduct: product.descProduct,
                    sellerName: product.seller.sellerName,
                    sellerImg: product.seller.sellerImg,
                    sellerLocation: product.seller.sellerLocation,
                    lastActive: timeAgo(product.seller.lastActive),
                  ),
                ),
              );
            },
            imageUrl: product.imageUrl,
            productTitle: product.productTitle,
            productPrice: product.price.toString(),
            productCategory: product.category,
            discount: (product.discount * 100).toStringAsFixed(0),
          );
        },
      ),
    );
  }
}
