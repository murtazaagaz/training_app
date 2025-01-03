import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/common/app_colors.dart';
import 'package:training_app/navigation/app_pages.dart';
import 'package:training_app/navigation/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Training App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryRed),
        useMaterial3: true,
      ),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.trainings,
    );
  }
}
