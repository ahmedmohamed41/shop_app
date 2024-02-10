import 'package:flutter/material.dart';

const Color kAppbarColor = Colors.blue;
const Color kModeDarkColor = Color(0xFF2F3635);
const Color defaultColor = Colors.deepOrange;

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinsh(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
     (route) => false,
    );
// GET https://newsapi.org/v2/top-headlines?country=us&apiKey=fe0764dd1dab457d99ba4899405c6bc8

// base Url: https://newsapi.org/
// method(url): v2/top-headlines?
// queries : country=us&apiKey=fe0764dd1dab457d99ba4899405c6bc8

// https://newsapi.org/v2/everything?q=bitcoin&apiKey=fe0764dd1dab457d99ba4899405c6bc8

// base Url: https://newsapi.org/
// method(url): v2/everything?
// queries : q=bitcoin&apiKey=fe0764dd1dab457d99ba4899405c6bc8