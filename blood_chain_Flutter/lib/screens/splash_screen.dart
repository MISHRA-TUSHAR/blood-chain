import 'package:blood/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) {
            return Transform.scale(
              scale: controller.scale.value,
              child: Opacity(
                opacity: controller.opacity.value,
                child: Image.asset(
                  'assets/blood.png',
                  width: 200, // Adjust width and height as needed
                  height: 200,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SplashController extends GetxController {
  late final opacity = 1.0.obs;
  late final scale = 1.0.obs;

  @override
  void onInit() {
    super.onInit();
    animateOpacityAndScale();
  }

  void animateOpacityAndScale() async {
    await Future.delayed(const Duration(seconds: 2));
    opacity.value = 1.0;

    await Future.delayed(const Duration(seconds: 2));
    scale.value = 1.0;

    await Future.delayed(const Duration(seconds: 2));
    // Navigate to the login screen using GetX
    Get.off(() => LoginScreen());
  }
}
