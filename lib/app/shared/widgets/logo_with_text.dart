import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:svg_flutter/svg_flutter.dart';


class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        SvgPicture.asset(
          'assets/svg/ESS.svg',
          width: 150,
        ).animate().move(
              duration: 700.ms,
            ),
      ],
    );
  }
}