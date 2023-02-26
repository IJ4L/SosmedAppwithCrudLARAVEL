// ignore_for_file: prefer_interpolation_to_compose_strings

// import 'dart:io';

// var baseURL = Platform.isAndroid
//     ? "http://192.168.22.105:39122/api"
//     : "http://localhost:39122/api'";
const baseURL = 'http://10.0.2.2:8000/api';
const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutURL = baseURL + '/logout';
const userURL = baseURL + '/user';
const postsURL = baseURL + '/posts';
const commentsURL = baseURL + '/comments';

// ----- Errors -----
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';
