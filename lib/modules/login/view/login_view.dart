import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wodoo33/modules/login/controller/login_controller.dart';
import 'package:wodoo33/modules/login/widgets/sign_in_method_widget.dart';
import 'package:wodoo33/utils/constant/app_images.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: Get.height * 0.2),
              child: Column(
                children: [
                  Image.asset(AppImages.logo),
                  const SizedBox(height: 40),
                  SignInMethodWidget(
                    title: 'Sign in with Google',
                    icon: AppImages.google,
                    controller: controller,
                    onTap: () {
                      controller.handleGoogleSignIn();
                      // Get.offAll(() => const HomeView(),
                      //     binding: HomeBinding());
                    },
                  ),
                  SignInMethodWidget(
                    title: 'Sign in with Facebook',
                    icon: AppImages.facebook,
                    controller: controller,
                  ),
                  SignInMethodWidget(
                    title: 'Sign in with Apple',
                    icon: AppImages.apple,
                    controller: controller,
                  ),
                  SignInMethodWidget(
                    title: 'Sign in with Snapchat',
                    icon: AppImages.snap,
                    controller: controller,
                  ),
                  SignInMethodWidget(
                    title: 'Sign in with Tiktok',
                    icon: AppImages.tiktok,
                    controller: controller,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
