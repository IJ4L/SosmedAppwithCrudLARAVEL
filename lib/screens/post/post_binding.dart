import 'package:flutter_crud_laravel/screens/post/post_controller.dart';
import 'package:get/get.dart';

class Postbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Postcontroller>(() => Postcontroller());
  }
}
