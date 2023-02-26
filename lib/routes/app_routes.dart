// ignore_for_file: constant_identifier_names

import 'package:flutter_crud_laravel/screens/auth/authentication_binding.dart';
import 'package:flutter_crud_laravel/screens/auth/authentication_login_view.dart';
import 'package:flutter_crud_laravel/screens/auth/authentication_register_view.dart';
import 'package:flutter_crud_laravel/screens/home/homepage_binding.dart';
import 'package:flutter_crud_laravel/screens/home/homepage_view.dart';
import 'package:flutter_crud_laravel/screens/post/post_binding.dart';
import 'package:flutter_crud_laravel/screens/post/post_view.dart';
import 'package:get/get.dart';

import 'app_pages.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const Loginpage(),
      binding: Authbinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const Registerpage(),
      binding: Authbinding(),
    ),
    GetPage(
      name: _Paths.POST,
      page: () => const Postview(),
      binding: Postbinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => const Homepage(),
      binding: Homebinding(),
    ),
  ];
}

class _Paths {
  static const LOGIN = '/Loginpage';
  static const REGISTER = '/Registerrpage';
  static const HOMEPAGE = '/Homepage';
  static const POST = '/Postview';
}
