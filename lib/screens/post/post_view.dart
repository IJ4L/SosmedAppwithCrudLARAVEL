import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_crud_laravel/constans/colors.dart';
import 'package:flutter_crud_laravel/screens/home/hompage_contrroller.dart';
import 'package:flutter_crud_laravel/screens/post/post_controller.dart';
import 'package:get/get.dart';

import '../widgets/buttonauth.dart';

class Postview extends GetView<Postcontroller> {
  const Postview({super.key});

  @override
  Widget build(BuildContext context) {
    final refresh = Get.find<Homecontroller>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Posting',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            GetBuilder<Postcontroller>(
              builder: (controller) => Container(
                height: Get.width * 0.6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: controller.pickedImage != null
                        ? bottomColor
                        : Colors.black,
                  ),
                ),
                child: controller.pickedImage != null
                    ? Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: FileImage(
                                  File(controller.pickedImage!.path),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: InkWell(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              onTap: () => controller.resetImage(),
                              child: Container(
                                height: Get.width * 0.12,
                                width: Get.width * 0.12,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () => controller.getImage(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.add_a_photo_outlined,
                              size: 30,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Add Photo',
                            )
                          ],
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextField(
              controller: controller.txtControllerBody,
              decoration: const InputDecoration(
                hintText: 'Teks',
                hintStyle: TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            GestureDetector(
              onTap: () {
                controller.createPosts();
                refresh.retrievePosts();
              },
              child: buttonmaker('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}
