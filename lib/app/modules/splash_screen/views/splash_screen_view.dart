import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/widgets/logo_with_text.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      initState: (_) {
        Timer(const Duration(seconds: 3), () {
          controller.checkOnboardingStatus();
        });
      },
      builder: (_) {
        return const Material(
          child: LogoWithText(),
        );
      },
    );
  }
}
