import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/routes/app_pages.dart';

import 'app/modules/splash/controllers/splash_controller.dart';

void main() {
  Get.put(SplashController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorsConstant.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIPK',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorsConstant.white,
          foregroundColor: ColorsConstant.black,
        ),
        scaffoldBackgroundColor: ColorsConstant.white,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: ColorsConstant.primary, 
          selectionColor:
              ColorsConstant.primaryLight2, 
          selectionHandleColor: ColorsConstant.primary, 
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsConstant.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsConstant.grey400,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
