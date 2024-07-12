import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wodoo33/modules/splash/controller/splash_controller.dart';
import 'package:wodoo33/utils/constant/app_images.dart';
import 'package:wodoo33/utils/widgets/main_text.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.bg,
            width: Get.width,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: AnimatedBuilder(
                    animation: controller.animation,
                    builder: (context, child) {
                      return AnimatedOpacity(
                        opacity: controller.animation.value,
                        duration: const Duration(seconds: 2),
                        child: Image.asset(AppImages.logo),
                      );
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 40.0),
                child: MainText(
                  text: 'Powered By Mawdoo3.',
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
