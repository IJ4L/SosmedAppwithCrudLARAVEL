import 'package:flutter/material.dart';
import 'package:flutter_crud_laravel/routes/app_pages.dart';
import 'package:flutter_crud_laravel/routes/app_routes.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN,
      getPages: AppPages.routes,
    );
  }
}
