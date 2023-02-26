// ignore_for_file: unused_field, unused_element, constant_identifier_names

abstract class Routes {
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const HOMEPAGE = _Paths.HOMEPAGE;
  static const POST = _Paths.POST;
}

abstract class _Paths {
  static const LOGIN = '/Loginpage';
  static const REGISTER = '/Registerrpage';
  static const HOMEPAGE = '/Homepage';
  static const POST = '/Postview';
}
