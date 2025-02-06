import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      duration: const Duration(milliseconds: 3000),
      backgroundColor: ColorsConstant.white,
      childWidget: SafeArea(
        child: Center(
          child: Assets.images.logo.svg(
            width: MediaQuery.of(context).size.width * 0.9,
          ),
        ),
      ),
    );
  }
}
