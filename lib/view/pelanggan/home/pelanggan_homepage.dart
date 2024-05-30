import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mr_garage/common/widgets/garage/garage_card.dart';
import 'package:mr_garage/common/widgets/modal/modal_add_vehicle.dart';
// import 'package:mr_garage/common/widgets/list_view_card/list_card.dart';
import 'package:mr_garage/common/widgets/modal/modal_chooser.dart';
import 'package:mr_garage/common/widgets/product/product_card.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:mr_garage/view/auth/landing.view.dart';
import 'package:mr_garage/common/widgets/images/rounded_banner_images.dart';
import 'package:mr_garage/features/vehicle/controller/home_vehicle_controller.dart';
// import 'package:mr_garage/common/widgets/vehicle/vehicle_vertical_scrollable.dart';
import 'package:mr_garage/view/pelanggan/notification/pelanggan_notification.dart';
import 'package:mr_garage/view/pelanggan/profile/pelanggan_profile.dart';
import 'package:mr_garage/view/pelanggan/service/service_garage.dart';
import 'package:mr_garage/view/pelanggan/shop/navbar/shop_navbar.dart';

import '../../../common/widgets/menu/menu.dart';
import '../message/pelanggan_message.dart';

class PelangganHomePage extends StatefulWidget {
  const PelangganHomePage({super.key});

  @override
  _PelangganHomeState createState() => _PelangganHomeState();
}

class _PelangganHomeState extends State<PelangganHomePage> {
  // variable
  String photoUrl = '';
  User? user = FirebaseAuth.instance.currentUser;

  // controller vehicle
  final controllerVehicle = Get.put(HomeVehicleController());

  // inisialisasi waktu
  final ValueNotifier<String> waktuNotifier = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    waktuNotifier.value = getWaktuSekarang();
    updateWaktu();
    fetchPhotoUrl();
  }

  Future<void> fetchPhotoUrl() async {
    String fetchedPhotoUrl = await getPhotoUrlFromFirestore();
    setState(() {
      photoUrl = fetchedPhotoUrl;
    });
  }

  Future<String> getPhotoUrlFromFirestore() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Users').where('userId', isEqualTo: user?.uid).get();

    if (querySnapshot.docs.isNotEmpty) {
      var userDoc = querySnapshot.docs.first;
      var userData = userDoc.data() as Map<String, dynamic>;
      if (userData.containsKey('photoUrl')) {
        return userData['photoUrl'];
      }
    }

    return '';
  }

  updateWaktu() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      waktuNotifier.value = getWaktuSekarang();
    });
    waktuNotifier.value = getWaktuSekarang(); // Set nilai awal
  }

  String getWaktuSekarang() {
    DateTime now = DateTime.now();
    int jam = now.hour;

    if (jam >= 0 && jam < 12) {
      return 'Selamat pagi';
    } else if (jam >= 12 && jam < 15) {
      return 'Selamat siang';
    } else if (jam >= 15 && jam < 18) {
      return 'Selamat sore';
    } else {
      return 'Selamat malam';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<String>(
                valueListenable: waktuNotifier,
                builder: (context, waktu, child) {
                  return Text(
                    getWaktuSekarang(),
                    style: GoogleFonts.openSans(
                      color: GlobalColors.secondColor,
                      fontSize: 12,
                    ),
                  );
                },
              ),
              const SizedBox(height: 5),
              StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text(
                      '...',
                      style: GoogleFonts.openSans(
                        color: GlobalColors.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  if (snapshot.hasData) {
                    return FutureBuilder(
                      future: FirebaseFirestore.instance.collection('Users').doc(snapshot.data!.uid).get(),
                      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
                        if (userSnapshot.connectionState == ConnectionState.waiting) {
                          return Text(
                            '...',
                            style: GoogleFonts.openSans(
                              color: GlobalColors.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        if (userSnapshot.hasError) {
                          return Text(
                            'Terjadi kesalahan: ${userSnapshot.error}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.openSans(
                              color: GlobalColors.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }

                        // Ambil nama pengguna dari Firestore
                        if (userSnapshot.data!.exists) {
                          var userData = userSnapshot.data!.data() as Map<String, dynamic>;
                          var fullName = userData['username'];
                          List<String> nameParts = fullName.split(" ");
                          var username = nameParts[0];

                          // Tampilkan nama pengguna di dalam App Bar
                          return Text(
                            username,
                            style: GoogleFonts.openSans(
                              color: GlobalColors.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else {
                          return Text(
                            '-',
                            style: GoogleFonts.openSans(
                              color: GlobalColors.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                      },
                    );
                  } else {
                    return Text(
                      'Tamu',
                      style: GoogleFonts.openSans(
                        color: GlobalColors.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PelangganMessage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: GlobalColors.mainColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      FeatherIcons.mail,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: GlobalColors.mainColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          FeatherIcons.bell,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PelangganNotification(),
                          ),
                        );
                      },
                    ),
                    // Positioned(
                    //   top: -2,
                    //   right: -5,
                    //   child: CircleAvatar(
                    //     radius: 9,
                    //     backgroundColor: Colors.white,
                    //     child: CircleAvatar(
                    //       radius: 7,
                    //       backgroundColor: HexColor('E82327'),
                    //       child: const Text(
                    //         '2',
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.w600),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: GlobalColors.garis,
                        width: 1,
                      ),
                      image: DecorationImage(
                        image: photoUrl.isNotEmpty
                            ? NetworkImage(photoUrl) as ImageProvider<Object>
                            : const AssetImage('assets/img/icon/user-icon.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PelangganProfile(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: GlobalColors.garis, width: 1.0),
              ),
            ),
          ),
        ),
        toolbarHeight: 70, // Atur tinggi AppBar sesuai kebutuhan
        titleSpacing: 0, // Hilangkan jarak antara judul dan leading icon
        automaticallyImplyLeading: false, // Hilangkan leading icon secara otomatis
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Column(
            children: [
              // -- Container kendaraan
              Container(
                width: double.infinity,
                height: 120,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: GlobalColors.mainColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Image.asset(
                            'assets/img/illustrator/vector_null_2.png',
                            width: 60,
                            height: 49,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Kendaraan belum\nditambahkan',
                            style: GoogleFonts.openSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: GlobalColors.textColor2,
                            ),
                          ),
                        ],
                      ),

                      // .. Uncomment kalo ada kendaraan
                      // child: Row(
                      //   children: [
                      //     const SizedBox(width: 5),
                      //     Center(
                      //       child: Obx(
                      //         () => Column(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             for (int i = 0; i < 2; i++)
                      //               Container(
                      //                 width: 3,
                      //                 height: controllerVehicle.carouselCurrentIndex.value == i ? 15 : 10,
                      //                 decoration: BoxDecoration(
                      //                   color: controllerVehicle.carouselCurrentIndex.value == i
                      //                       ? GlobalColors.mainColor
                      //                       : HexColor('e5e5e5'),
                      //                   borderRadius: BorderRadius.circular(3),
                      //                 ),
                      //                 margin: const EdgeInsets.only(bottom: 3),
                      //               ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 5),
                      //     CarouselSlider(
                      //       items: [
                      //         VehicleVerticalScrollable(
                      //           onTap: () {},
                      //           imageUrl: 'assets/img/vehicle/vehicle-1.png',
                      //           vehicleCategory: 'Motor',
                      //           vehicleName: 'X-ride 125',
                      //         ),
                      //         VehicleVerticalScrollable(
                      //           onTap: () {},
                      //           imageUrl: 'assets/img/vehicle/vehicle-2.png',
                      //           vehicleCategory: 'Mobil',
                      //           vehicleName: 'Kijang Innova',
                      //         ),
                      //       ],
                      //       options: CarouselOptions(
                      //         aspectRatio: 2.23,
                      //         onPageChanged: (index, _) => controllerVehicle.updatePageIndicator(index),
                      //         viewportFraction: 1,
                      //         initialPage: 0,
                      //         autoPlay: false,
                      //         enableInfiniteScroll: true,
                      //         scrollDirection: Axis.vertical,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        showModalAddVehicle();
                      },
                      child: SizedBox(
                        width: 55,
                        height: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Icon(
                                FeatherIcons.plus,
                                size: 15,
                                color: GlobalColors.mainColor,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Tambah',
                              style: GoogleFonts.openSans(
                                  color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // -- Menu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuMain(
                    onPressed: () {
                      _showModalService();
                    },
                    iconMenu: Icons.build_outlined,
                    titleMenu: 'Servis',
                  ),
                  MenuMain(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ShopNavBar(),
                        ),
                      );
                    },
                    iconMenu: FeatherIcons.shoppingCart,
                    titleMenu: 'Belanja',
                  ),
                  MenuMain(
                    onPressed: () {},
                    iconMenu: Symbols.auto_towing_rounded,
                    titleMenu: 'Derek',
                  ),
                ],
              ),
              const SizedBox(height: 20),

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

              // Riwayat
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: GlobalColors.mainColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          FeatherIcons.fileText,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Riwayat',
                        style: GoogleFonts.openSans(
                          color: GlobalColors.textColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  // .. Catatan: undo comment kalo udah kehubung firebase
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: GlobalColors.mainColor,
                  //     minimumSize: const Size(80, 30),
                  //     shadowColor: Colors.transparent,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  //   child: Text(
                  //     'Lihat semua',
                  //     style: GoogleFonts.openSans(
                  //       fontSize: 10,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/img/illustrator/vector_null.png',
                        width: 170,
                        height: 130,
                      ),
                    ),
                    Text(
                      'Kendaraan kamu belum\npernah di servis',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: GlobalColors.textColor2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: GlobalColors.mainColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          FeatherIcons.shoppingCart,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Penawaran khusus',
                        style: GoogleFonts.openSans(
                          color: GlobalColors.textColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
                  )
                ],
              ),

              const SizedBox(height: 15),

              // Produk Promo Slider
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

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: GlobalColors.mainColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.garage_outlined,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Bengkel terdekat',
                        style: GoogleFonts.openSans(
                          color: GlobalColors.textColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
                  )
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 233,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    GarageCard(
                      onTap: () {},
                      imageUrl: 'assets/img/bengkel/bengkel-1.png',
                      garageTitle: 'Bengkel Ajwa',
                      garageDesc: 'Jl. Telekomunikasi No.203 Bojongsoang, Bandung',
                    ),
                    const SizedBox(width: 20),
                    GarageCard(
                      onTap: () {},
                      imageUrl: 'assets/img/bengkel/bengkel-2.jpg',
                      garageTitle: 'Tambal ban sukapura',
                      garageDesc: 'Jl. Sukapura No.69 Dayeuhkolot, Bandung',
                    ),
                    const SizedBox(width: 20),
                    GarageCard(
                      onTap: () {},
                      imageUrl: 'assets/img/bengkel/bengkel-3.jpg',
                      garageTitle: 'Bengkel Jaya Motor',
                      garageDesc: 'Jl. Raya Bojongsoang No.50 Bojongsoang, Bandung',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToLandingPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LandingPage(),
      ),
    );
  }

  _showModalService() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (BuildContext context) {
        return ModalChooser(
          modalTitle: 'Servis',
          modalDesc: 'Mau servis di mana hari ini?',
          imgUrl1: 'assets/img/icon/icons8-garage.png',
          imgLabel1: 'Bengkel',
          onPressed1: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ServiceGarage(),
              ),
            );
          },
          imgUrl2: 'assets/img/icon/icons8-home.png',
          imgLabel2: 'Rumah',
          onPressed2: () {},
        );
      },
    );
  }

  showModalAddVehicle() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return ModalAddVehicle();
      },
    );
  }
}
