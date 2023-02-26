import 'package:flutter/material.dart';
import 'package:flutter_crud_laravel/constans/colors.dart';
import 'package:flutter_crud_laravel/routes/app_pages.dart';
import 'package:get/get.dart';

import '../widgets/buttonauth.dart';
import '../widgets/textfieldmaker.dart';
import 'authentication_controller.dart';

class Loginpage extends GetView<Authcontroller> {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bottomColor,
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Get.height * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 36),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  spaceheight(0.015),
                  textfildMaker(
                    'Email',
                    controller.email,
                  ),
                  spaceheight(0.015),
                  textfildMaker(
                    'Password',
                    controller.password,
                  ),
                  spaceheight(0.015),
                  GestureDetector(
                    onTap: () => controller.loginUser(),
                    child: buttonmaker('Masuk'),
                  ),
                  spaceheight(0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Belum punya akun? '),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.REGISTER),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: bottomColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox spaceheight(double jarak) {
    return SizedBox(
      height: Get.height * jarak,
    );
  }
}
