import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_garage/common/widgets/categories/shop_categories.dart';
import 'package:mr_garage/features/model/product.dart';
import 'package:mr_garage/view/pelanggan/navbar/pelanggan_navbar.dart';
import 'package:mr_garage/view/pelanggan/shop/product/product_detail.dart';

import '../../../../common/widgets/images/rounded_banner_images.dart';
import '../../../../common/widgets/product/product_card.dart';
import '../../../../common/widgets/shimmer/skelton.dart';
import '../../../../utils/global.colors.dart';

class ShopExplore extends StatefulWidget {
  const ShopExplore({super.key});

  @override
  _ShopExploreState createState() => _ShopExploreState();
}

class _ShopExploreState extends State<ShopExplore> {
  final ProductShop _productShop = ProductShop();
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = _productShop.fetchProducts();
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
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PelangganNavBar(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Icon(
                        FeatherIcons.arrowLeft,
                        size: 20,
                        color: GlobalColors.textColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Belanja',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: GlobalColors.textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.name,
                style: GoogleFonts.openSans(
                  fontSize: 12,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: GlobalColors.garis, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: GlobalColors.mainColor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: GlobalColors.garis, width: 1),
                  ),
                  hintText: 'Mau beli apa?',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Icon(
                      FeatherIcons.search,
                      size: 20,
                      color: GlobalColors.secondColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 130,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: Column(
            children: [
              // -- Banner ad carousel
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  initialPage: 0,
                  aspectRatio: 2.0,
                ),
                items: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: RoundedBannerImage(
                      imageUrl: 'assets/img/banner/banner-1.jpg',
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: RoundedBannerImage(
                      imageUrl: 'assets/img/banner/banner-2.jpg',
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: RoundedBannerImage(
                      imageUrl: 'assets/img/banner/banner-3.jpg',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // -- Categories
              SizedBox(
                height: 109,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    ShopCategories(
                      onTap: () {},
                      iconUrl: 'assets/img/icon/icons8-petrol.png',
                      categoriesTitle: 'Oli',
                    ),
                    const SizedBox(width: 15),
                    ShopCategories(
                      onTap: () {},
                      iconUrl: 'assets/img/icon/icons8-tire-track.png',
                      categoriesTitle: 'Ban',
                    ),
                    const SizedBox(width: 15),
                    ShopCategories(
                      onTap: () {},
                      iconUrl: 'assets/img/icon/icons8-car-battery.png',
                      categoriesTitle: 'Aki',
                    ),
                    const SizedBox(width: 15),
                    ShopCategories(
                      onTap: () {},
                      iconUrl: 'assets/img/icon/icons8-light.png',
                      categoriesTitle: 'Lampu',
                    ),
                    const SizedBox(width: 15),
                    ShopCategories(
                      onTap: () {},
                      iconUrl: 'assets/img/icon/icons8-brake-discs.png',
                      categoriesTitle: 'Rem',
                    ),
                    const SizedBox(width: 15),
                    ShopCategories(
                      onTap: () {},
                      iconUrl: 'assets/img/icon/icons8-more.png',
                      categoriesTitle: 'Lainnya',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Penawaran khusus
              _buildSectionTitle('Penawaran khusus'),
              const SizedBox(height: 10),
              _buildProductListFutureBuilder(
                filter: (product) => product.discount > 0.4,
              ),

              const SizedBox(height: 20),

              // Suku cadang favorit
              _buildSectionTitle('Suku cadang favorit'),
              const SizedBox(height: 10),
              _buildProductListFutureBuilder(
                filter: (product) => product.rating > 4.6 && product.sold > 40,
              ),

              const SizedBox(height: 20),

              // Promo hari ini
              _buildSectionTitle('Promo hari ini'),
              const SizedBox(height: 10),
              _buildProductListFutureBuilder(
                filter: (product) => product.discount <= 0.3,
              ),

              const SizedBox(height: 20),

              // Rekomendasi buat kamu
              _buildSectionTitle('Rekomendasi buat kamu'),
              const SizedBox(height: 10),
              _buildProductListFutureBuilder(
                filter: (product) => product.seller.sellerLocation == 'Kota Bandung',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.openSans(
            color: GlobalColors.textColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: GlobalColors.mainColor,
            minimumSize: const Size(80, 30),
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Lihat semua',
            style: GoogleFonts.openSans(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductListFutureBuilder({required bool Function(Product) filter}) {
    return FutureBuilder<List<Product>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Skelton(
            width: 145,
            height: 145,
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
