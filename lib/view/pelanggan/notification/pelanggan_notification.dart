import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mr_garage/common/widgets/notification/notification_card.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../utils/global.colors.dart';
import '../navbar/pelanggan_navbar.dart';

class PelangganNotification extends StatelessWidget {
  const PelangganNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const PelangganNavBar(),
                    withNavBar: false,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: Icon(FeatherIcons.arrowLeft),
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
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
            color: GlobalColors.garis,
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              children: [
                NotificationCard(
                    onTap: () {},
                    icon: Icons.build_outlined,
                    notificationTitle: 'Servis kendaraan',
                    notificationDesc: 'Sedang di servis • 30 menit yang lalu'),
                NotificationCard(
                    onTap: () {},
                    icon: FeatherIcons.shoppingCart,
                    notificationTitle: 'CVT X-ride 125',
                    notificationDesc: 'Barang dikirim • 53 menit yang lalu'),
                NotificationCard(
                    onTap: () {},
                    icon: Symbols.auto_towing,
                    notificationTitle: 'Derek kendaraan',
                    notificationDesc: 'Selesai di derek • 1 hari yang lalu'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
