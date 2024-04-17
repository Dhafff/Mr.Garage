import 'package:flutter/material.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:mr_garage/view/auth/landing.view.dart';
import 'package:mr_garage/common/widgets/images/rounded_banner_images.dart';
import 'package:mr_garage/features/vehicle/controller/home_vehicle_controller.dart';
import 'package:mr_garage/common/widgets/vehicle/vehicle_vertical_scrollable.dart';

class PelangganHomePage extends StatefulWidget {
  const PelangganHomePage({super.key});

  @override
  _PelangganHomeState createState() => _PelangganHomeState();
}

class _PelangganHomeState extends State<PelangganHomePage> {
  // controller vehicle
  final controllerVehicle = Get.put(HomeVehicleController());

  // inisialisasi waktu
  final ValueNotifier<String> waktuNotifier = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    waktuNotifier.value = getWaktuSekarang();
    updateWaktu();
  }

  updateWaktu() {
    Timer.periodic(Duration(minutes: 1), (timer) {
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
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<String>(
                valueListenable: waktuNotifier,
                builder: (context, waktu, child) {
                  return Text(
                    getWaktuSekarang(), // Hanya menampilkan waktu tanpa koma
                    style: GoogleFonts.openSans(
                      color: GlobalColors.secondColor,
                      fontSize: 12,
                    ),
                  );
                },
              ),
              const SizedBox(height: 5),
              Text(
                'Dhafa',
                style: GoogleFonts.openSans(
                  color: GlobalColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: GlobalColors.mainColor, borderRadius: BorderRadius.circular(15)),
                        child: const Icon(
                          FeatherIcons.bell,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {},
                    ),
                    Positioned(
                      top: -2,
                      right: -5,
                      child: CircleAvatar(
                        radius: 9,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: HexColor('E82327'),
                          child: const Text(
                            '2',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
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
                      image: const DecorationImage(
                        image: AssetImage('assets/img/icon/user-icon.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
        toolbarHeight: 70, // Atur tinggi AppBar sesuai kebutuhan
        titleSpacing: 0, // Hilangkan jarak antara judul dan leading icon
        automaticallyImplyLeading: false, // Hilangkan leading icon secara otomatis
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: GlobalColors.garis,
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Column(
              children: [
                // -- Container kendaraan
                Container(
                  width: double.infinity,
                  height: 120,
                  padding: EdgeInsets.all(10),
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
                            const SizedBox(width: 5),
                            Center(
                              child: Obx(
                                () => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    for (int i = 0; i < 2; i++)
                                      Container(
                                        width: 3,
                                        height: controllerVehicle.carouselCurrentIndex.value == i ? 15 : 10,
                                        decoration: BoxDecoration(
                                          color: controllerVehicle.carouselCurrentIndex.value == i
                                              ? GlobalColors.mainColor
                                              : HexColor('e5e5e5'),
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        margin: EdgeInsets.only(bottom: 3),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            CarouselSlider(
                              items: [
                                VehicleVerticalScrollable(
                                  onTap: () {},
                                  imageUrl: 'assets/img/vehicle/vehicle-1.png',
                                  vehicleCategory: 'Motor',
                                  vehicleName: 'X-ride 125',
                                ),
                                VehicleVerticalScrollable(
                                  onTap: () {},
                                  imageUrl: 'assets/img/vehicle/vehicle-2.png',
                                  vehicleCategory: 'Mobil',
                                  vehicleName: 'Kijang Innova',
                                ),
                              ],
                              options: CarouselOptions(
                                aspectRatio: 2.23,
                                onPageChanged: (index, _) => controllerVehicle.updatePageIndicator(index),
                                viewportFraction: 1,
                                initialPage: 0,
                                autoPlay: false,
                                enableInfiniteScroll: true,
                                scrollDirection: Axis.vertical,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
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
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 100),
                        backgroundColor: HexColor('f5f5f5'),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.build_outlined,
                            size: 22,
                            color: GlobalColors.textColor,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Servis',
                            style: GoogleFonts.openSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: HexColor('1e1e1e'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 100),
                        backgroundColor: HexColor('f5f5f5'),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FeatherIcons.shoppingCart,
                            size: 22,
                            color: GlobalColors.textColor,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Belanja',
                            style: GoogleFonts.openSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: HexColor('1e1e1e'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 100),
                        backgroundColor: HexColor('f5f5f5'),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/img/icon/auto_towing.svg',
                            width: 22,
                            height: 22,
                            color: GlobalColors.textColor,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Derek',
                            style: GoogleFonts.openSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: HexColor('1e1e1e'),
                            ),
                          ),
                        ],
                      ),
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
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: RoundedBannerImage(
                        imageUrl: 'assets/img/banner/banner-1.jpg',
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: RoundedBannerImage(
                        imageUrl: 'assets/img/banner/banner-2.jpg',
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
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
                Container(
                  width: double.infinity,
                  height: 75,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: GlobalColors.garis,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: HexColor('F2BE00'),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.build_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Servis kendaraan',
                                  style: GoogleFonts.openSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: GlobalColors.textColor),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '7 Nov 2022 • Sedang di servis',
                                  style: GoogleFonts.openSans(
                                    fontSize: 11,
                                    color: GlobalColors.thirdColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 75,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: GlobalColors.garis,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: HexColor('E82327'),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.build_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Servis kendaraan',
                                  style: GoogleFonts.openSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: GlobalColors.textColor),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '5 Nov 2022 • Servis dibatalkan',
                                  style: GoogleFonts.openSans(
                                    fontSize: 11,
                                    color: GlobalColors.thirdColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 75,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: GlobalColors.garis,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: HexColor('2FDD92'),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.build_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Servis kendaraan',
                                  style: GoogleFonts.openSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: GlobalColors.textColor),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '7 Nov 2022 • Servis berhasil',
                                  style: GoogleFonts.openSans(
                                    fontSize: 11,
                                    color: GlobalColors.thirdColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LandingPage()));
                  },
                  child: Text('Logout'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
