import 'package:get/get.dart';

class HomeVehicleController {
  static HomeVehicleController get instance => Get.find();

  final carouselCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }
}
