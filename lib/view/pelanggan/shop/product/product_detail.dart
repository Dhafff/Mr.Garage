import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_garage/common/widgets/comments/comments_product.dart';
import 'package:mr_garage/common/widgets/list_view_card/list_card_2.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:mr_garage/view/pelanggan/navbar/pelanggan_navbar.dart';
import 'package:mr_garage/view/pelanggan/shop/navbar/shop_navbar.dart';
import 'package:mr_garage/view/pelanggan/shop/product/product_checkout.dart';

import '../../../../common/widgets/product/product_card.dart';

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
    required this.productDiscountPrice,
    this.currencySign = 'Rp',
    required this.rating,
    required this.userRating,
    required this.review,
    required this.reviewer,
    required this.sold,
    required this.discount,
    required this.descProduct,
  });

  final String previousPage;
  final String imageUrl;
  final String category;
  final String productTitle;
  final String productActualPrice;
  final String productDiscountPrice;
  final String currencySign;
  final double rating;
  final double userRating;
  final int review;
  final int sold;
  final String reviewer;
  final String discount;
  final String descProduct;
  bool isFavorite;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isDiscount = false;

  @override
  void initState() {
    super.initState();
    checkDiscount();
  }

  void checkDiscount() {
    if (widget.discount.isNotEmpty && widget.discount != '0') {
      setState(() {
        isDiscount = true;
      });
    } else {
      setState(() {
        isDiscount = false;
      });
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
                  image: AssetImage(widget.imageUrl),
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
            ListCard2(
              onTap: () {},
              imgUrl: 'assets/img/icon/icons8-voucher.png',
              titleList: 'Pasang kuponnya yuk',
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
              userComment:
                  'Untuk barang alhamdulillah bagus, cvt nya jg berfungsi dengan baik. Mantap lah pokoknya',
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
            SizedBox(
              height: 233,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  ProductCard(
                    onTap: () {},
                    imageUrl: 'assets/img/product/cvt.jpg',
                    productTitle: 'Cvt Yamaha X-ride',
                    productPrice: '1.000.000',
                    productCategory: 'motor',
                    discount: '50',
                  ),
                  const SizedBox(width: 20),
                  ProductCard(
                    onTap: () {},
                    imageUrl: 'assets/img/product/ban_michellin.jpg',
                    productTitle: 'Ban Michellin Pilot Ring',
                    productPrice: '480.000',
                    productCategory: 'motor',
                    discount: '20',
                  ),
                  const SizedBox(width: 20),
                  ProductCard(
                    onTap: () {},
                    imageUrl: 'assets/img/product/ban_bridgestone.jpg',
                    productTitle: 'Bridgestone Dueler',
                    productPrice: '975.000',
                    productCategory: 'mobil',
                    discount: '35',
                  ),
                  const SizedBox(width: 20),
                  ProductCard(
                    onTap: () {},
                    imageUrl: 'assets/img/product/aki_gs.jpg',
                    productTitle: 'Aki Mobil Innova Diesel',
                    productPrice: '1.293.000',
                    productCategory: 'mobil',
                    discount: '40',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.18,
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
                                '${widget.discount}%',
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
                            widget.currencySign + widget.productActualPrice,
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
                    if (isDiscount == true)
                      Text(
                        widget.currencySign + widget.productDiscountPrice,
                        style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: GlobalColors.textColor),
                      ),
                    if (isDiscount == false)
                      Text(
                        widget.currencySign + widget.productActualPrice,
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductCheckout(
                          previousAction: 'Beli',
                          imgUrl: widget.imageUrl,
                        ),
                      ),
                    );
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
                  onPressed: () {},
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
}
