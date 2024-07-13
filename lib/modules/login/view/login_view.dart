import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wodoo33/modules/login/controller/login_controller.dart';
import 'package:wodoo33/modules/login/widgets/sign_in_method_widget.dart';
import 'package:wodoo33/utils/constant/app_images.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.bg,
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: size.height * 0.1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImages.logo),
                  const SizedBox(height: 40),
                  Wrap(
                    spacing: 20.0,
                    runSpacing: 10.0,
                    children: [
                      SignInMethodWidget(
                        title: 'Sign in with Google',
                        icon: AppImages.google,
                        controller: controller,
                        onTap: () => controller.handleGoogleSignIn(),
                      ),
                      SignInMethodWidget(
                        title: 'Sign in with Facebook',
                        icon: AppImages.facebook,
                        controller: controller,
                        onTap: () => controller,
                      ),
                      SignInMethodWidget(
                        title: 'Sign in with Apple',
                        icon: AppImages.apple,
                        controller: controller,
                        onTap: () => controller,
                      ),
                      SignInMethodWidget(
                        title: 'Sign in with Snapchat',
                        icon: AppImages.snap,
                        controller: controller,
                        onTap: () => controller,
                      ),
                      SignInMethodWidget(
                        title: 'Sign in with Tiktok',
                        icon: AppImages.tiktok,
                        controller: controller,
                        onTap: () => controller,
                      ),
                    ],
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
