import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class OnboardingScreenController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);

  final imageList = [
    'assets/images/onboarding1.png',
    'assets/images/onboarding2.png',
    'assets/images/onboarding3.png',
  ];

  String title = '';
  String subtitle = '';
  int currentPage = 0;

  @override
  void onInit() {
    super.onInit();
    title = "Meningkatkan Hutan, Menghijaukan Bumi";
    subtitle =
        "menjaga bumi dengan meningkatkan hutan dan mengurangi emisi karbon";
  }

  String getTitle() {
    return title;
  }

  String getSubtitle() {
    return subtitle;
  }

  void updateContent(int index) {
    if (index == 0) {
      title = "Meningkatkan Hutan, Menghijaukan Bumi";
      subtitle =
          "menjaga bumi dengan meningkatkan hutan dan mengurangi emisi karbon";
    } else if (index == 1) {
      title = "Membangun Masa Depan Berkelanjutan";
      subtitle =
          "Menciptakan masa depan yang berkelanjutan melalui solusi hijau dan keberlanjutan lingkungan";
    } else if (index == 2) {
      title = "Karunia Alam untuk Masa Depan yang lebih Hijau";
      subtitle =
          "Menjaga alam sebagai karunia, untuk menciptakan masa depan yang lebih hijau";
    }
  }

  void goToNextPage() {
    int nextPage = currentPage + 1;
    if (nextPage < imageList.length) {
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      update();
    } else {
      final box = GetStorage();
      box.write('onboarding_completed', true);

      Get.offAllNamed(Routes.LOGIN);
    }
  }

  void skipPage() {
    final box = GetStorage();
    box.write('onboarding_completed', true);

    Get.offAllNamed(Routes.LOGIN);
  }

  void onChangePage(int index) {
    currentPage = index;
    updateContent(index);
    update();
  }

}
