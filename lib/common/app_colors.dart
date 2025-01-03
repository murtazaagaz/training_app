import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static final AppColors _instance = AppColors._();
  factory AppColors() => _instance;

  static const Color primaryRed = Color.fromRGBO(254, 72, 85, 1);
  static const Color white = Colors.white;
static const  Color black = Colors.black;
static final  Color greyText = Colors.grey[700]!;

}
