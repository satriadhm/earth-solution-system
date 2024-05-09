import 'package:earth_solution_system/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class SplashScreenController extends GetxController {
  Future<void> checkOnboardingStatus() async {
    final box = GetStorage();

    bool onboardingCompleted = box.read('onboarding_completed') ?? false;
    print(onboardingCompleted);
    if (onboardingCompleted) {
      Get.offAllNamed(Routes.SPLASH_SCREEN);
    }
  }
}
