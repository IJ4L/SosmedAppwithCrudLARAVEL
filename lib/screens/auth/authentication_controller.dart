// ignore_for_file: avoid_print, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_crud_laravel/constans/string.dart';
import 'package:flutter_crud_laravel/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/apiResponseModel.dart';
import '../../models/userModel.dart';

class Authcontroller extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController passwordconfirm = TextEditingController();

  var loading = false.obs;

  loginUser() async {
    ApiResponse response = await login();
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
      loading.value = false;
    }
  }

  registerUser() async {
    ApiResponse response = await register();
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      loading.value = false;
    }
  }

  _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Get.toNamed(Routes.HOMEPAGE);
  }

  Future<ApiResponse> login() async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.post(
        Uri.parse(loginURL),
        headers: {'Accept': 'application/json'},
        body: {
          "email": email.text,
          "password": password.text,
        },
      );

      print(response.statusCode);

      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode(response.body));
          break;
        case 422:
          final errors = jsonDecode(response.body)['errors'];
          apiResponse.error = errors[errors.keys.elementAt(0)][0];
          break;
        case 403:
          apiResponse.error = jsonDecode(response.body)['message'];
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

  Future<ApiResponse> register() async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.post(
        Uri.parse(registerURL),
        headers: {'Accept': 'application/json'},
        body: {
          'name': nama.text,
          'email': email.text,
          'password': password.text,
          'password_confirmation': password.text,
        },
      );

      print(response.statusCode);

      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode(response.body));
          break;
        case 422:
          final errors = jsonDecode(response.body)['errors'];
          apiResponse.error = errors[errors.keys.elementAt(0)][0];
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
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
