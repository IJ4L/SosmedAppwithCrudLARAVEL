import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constans/colors.dart';

Container buttonmaker(String title) {
  return Container(
    height: Get.height * 0.065,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: bottomColor,
    ),
    child: Center(
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
