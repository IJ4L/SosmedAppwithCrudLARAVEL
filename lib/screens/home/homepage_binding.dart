import 'package:flutter_crud_laravel/screens/home/hompage_contrroller.dart';
import 'package:get/get.dart';

class Homebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Homecontroller>(() => Homecontroller());
  }
}
