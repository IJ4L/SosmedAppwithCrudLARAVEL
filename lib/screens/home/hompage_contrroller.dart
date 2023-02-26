// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter_crud_laravel/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../constans/string.dart';
import '../../models/apiResponseModel.dart';
import '../../models/postModel.dart';

class Homecontroller extends GetxController {
  var postList = [].obs;
  int userId = 0;
  bool _loading = true;

  Future<void> retrievePosts() async {
    userId = await getUserId();
    ApiResponse response = await getPosts();

    if (response.error == null) {
      postList.value = response.data as List<dynamic>;
      _loading = _loading ? !_loading : _loading;
      print(postList.length);
    } else if (response.error == unauthorized) {
      logout().then((value) => Get.toNamed(Routes.LOGIN));
    } else {}
  }

  Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('token') ?? '';
  }

  Future<int> getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString('token'));
    return pref.getInt('userId') ?? 0;
  }

  Future<bool> logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.remove('token');
  }

  String? getStringImage(File? file) {
    if (file == null) return null;
    return base64Encode(file.readAsBytesSync());
  }

  Future<ApiResponse> getPosts() async {
    ApiResponse apiResponse = ApiResponse();
    try {
      String token = await getToken();
      final response = await http.get(Uri.parse(postsURL), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });

      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body)['posts']
              .map((p) => Post.fromJson(p))
              .toList();
          apiResponse.data as List<dynamic>;
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

  @override
  void onInit() {
    retrievePosts();
    postList = RxList();
    super.onInit();
  }
}
