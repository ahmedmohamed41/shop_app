import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/module/cubit/login_cubit.dart';

const Color kAppbarColor = Colors.blue;
const Color kModeDarkColor = Color(0xFF2F3635);
const Color defaultColor = Colors.blue;

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

Future<bool?> flutterToastShow(LoginSuccessState state, Color color) {
  return Fluttertoast.showToast(
    msg: state.model.message!,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

String token = '';
// EndPoints: top-headlines - everything - login

// GET https://newsapi.org/v2/top-headlines?country=us&apiKey=fe0764dd1dab457d99ba4899405c6bc8

// base Url:https://newsapi.org/
// method(url):v2/top-headlines?
// queries :country=us&apiKey=fe0764dd1dab457d99ba4899405c6bc8

// https://newsapi.org/v2/everything?q=bitcoin&apiKey=fe0764dd1dab457d99ba4899405c6bc8

// base Url: https://newsapi.org/
// method(url):v2/everything?
// queries : q=bitcoin&apiKey=fe0764dd1dab457d99ba4899405c6bc8


// https://student.valuxapps.com/api/
// method(url):login?
// queries : email=algazzar.abdelrahman@gmail.com&password=123456