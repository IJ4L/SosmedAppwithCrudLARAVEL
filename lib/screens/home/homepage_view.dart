import 'package:flutter/material.dart';
import 'package:flutter_crud_laravel/routes/app_pages.dart';
import 'package:flutter_crud_laravel/screens/home/hompage_contrroller.dart';
import 'package:get/get.dart';

import '../../constans/colors.dart';

class Homepage extends GetView<Homecontroller> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: RefreshIndicator(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: Get.height * 0.065,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: bottomColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search_outlined,
                                color: bottomColor,
                              ),
                              SizedBox(
                                width: Get.width * 0.04,
                              ),
                              const Text(
                                'Pencarian',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: bottomColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Container(
                      height: Get.height * 0.065,
                      width: Get.height * 0.065,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: bottomColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Obx(
                  () => Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => Container(
                        height: Get.height * 0.26,
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.red),
                      ),
                      separatorBuilder: (_, index) => const SizedBox(
                        height: 16,
                      ),
                      itemCount: controller.postList.length,
                    ),
                  ),
                ),
              ],
            ),
            onRefresh: () {
              return controller.retrievePosts();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.toNamed(Routes.POST),
      ),
    );
  }
}
