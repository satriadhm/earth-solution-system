import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/widgets/content_onboarding.dart';
import '../../../shared/widgets/image_slider.dart';
import '../controllers/onboarding_screen_controller.dart';
class OnboardingView extends GetView<OnboardingScreenController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingScreenController>(
      builder: (context) {
        return Scaffold(
          body: Stack(
            children: [
              ImageSlider(
                imageList: controller.imageList,
                controller: controller.pageController,
                itemCount: controller.imageList.length,
                onPageChanged: controller.onChangePage,
              ),
              Content(
               currentPage: controller.currentPage,
               imageList: controller.imageList,
               subtitle: controller.getSubtitle(),
               title: controller.getTitle(),
               nextPage: controller.goToNextPage,
               skipPage: controller.skipPage,
              ),
            ],
          ),
        );
      }
    );
  }
}