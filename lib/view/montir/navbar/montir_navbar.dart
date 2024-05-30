import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:mr_garage/utils/global.colors.dart';
import 'package:mr_garage/view/montir/home/montir_homepage.dart';
import 'package:mr_garage/view/montir/message/montir_messagepage.dart';
import 'package:mr_garage/view/montir/workshop/workshop_page.dart';

class MontirNavBar extends StatefulWidget {
  const MontirNavBar({super.key});

  @override
  _MontirNavBarState createState() => _MontirNavBarState();
}

class _MontirNavBarState extends State<MontirNavBar> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          indicatorColor: GlobalColors.mainColor,
          destinations: const [
            NavigationDestination(icon: Icon(FeatherIcons.home), label: 'Beranda'),
            NavigationDestination(icon: Icon(Icons.build), label: 'Bengkel'),
            NavigationDestination(icon: Icon(FeatherIcons.fileText), label: 'Pesan'),
          ],
        ),
      ),
      body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screen = [
    const MontirHomePage(),
    const WorkshopPage(),
    const MontirMessagePage(),
  ];
}
