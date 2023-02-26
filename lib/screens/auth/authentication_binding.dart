import 'package:flutter_crud_laravel/screens/auth/authentication_controller.dart';
import 'package:get/get.dart';

class Authbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Authcontroller>(() => Authcontroller());
  }
}
