import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_crud_laravel/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../constans/string.dart';
import '../../models/apiResponseModel.dart';

class Postcontroller extends GetxController {
  late TextEditingController txtControllerBody = TextEditingController();
  bool _loading = false;
  late ImagePicker imagePicker;

  XFile? pickedImage;

  Future getImage() async {
    try {
      final checkDataImage =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (checkDataImage != null) {
        pickedImage = checkDataImage;
      }
      update();
    } catch (err) {
      pickedImage = null;
      update();
    }
  }

  void createPosts() async {
    File file = File(pickedImage!.path);
    String? image = pickedImage == null ? null : getStringImage(file);
    ApiResponse response = await createPost(txtControllerBody.text, image);

    if (response.error == null) {
      Get.back();
    } else if (response.error == unauthorized) {
      logout().then((value) => Get.toNamed(Routes.LOGIN));
    } else {
      _loading = !_loading;
    }
  }

  Future<ApiResponse> createPost(String body, String? image) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      String token = await getToken();
      final response = await http.post(
        Uri.parse(postsURL),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: image != null ? {'body': body, 'image': image} : {'body': body},
      );

      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body);
          break;
        case 422:
          final errors = jsonDecode(response.body)['errors'];
          apiResponse.error = errors[errors.keys.elementAt(0)][0];
          break;
        case 401:
          apiResponse.error = unauthorized;
          break;
        default:
          apiResponse.error = somethingWentWrong;
          break;
      }
    } catch (e) {
      apiResponse.error = serverError;
    }
    return apiResponse;
  }

  Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('token') ?? '';
  }

  String? getStringImage(File? file) {
    if (file == null) return null;
    return base64Encode(file.readAsBytesSync());
  }

  Future<bool> logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.remove('token');
  }

  void resetImage() {
    pickedImage = null;
    update();
  }

  @override
  void onInit() {
    imagePicker = ImagePicker();
    txtControllerBody = TextEditingController();
    super.onInit();
  }
}
