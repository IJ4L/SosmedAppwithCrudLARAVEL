import 'package:flutter/material.dart';

import '../../constans/colors.dart';

TextField textfildMaker(String txt, TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: txt,
      hintStyle: const TextStyle(color: Colors.grey),
      fillColor: inputTextColor,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
