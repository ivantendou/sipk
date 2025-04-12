import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/modules/splash/controllers/splash_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    throw Exception('Error loading .env file: $e');
  }
  await Supabase.initialize(
    url: dotenv.env['PROJECT_URL'] ?? '',
    anonKey: dotenv.env['PROJECT_API_KEY'] ?? '',
  );
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
          primaryColor: ColorsConstant.primary,
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorsConstant.white,
            foregroundColor: ColorsConstant.black,
          ),
          datePickerTheme: DatePickerThemeData(
            cancelButtonStyle: ButtonStyle(
              foregroundColor:
                  const WidgetStatePropertyAll(ColorsConstant.primary),
              textStyle: WidgetStatePropertyAll(TextStyleConstant.body.copyWith(
                fontWeight: FontWeight.bold,
              )),
            ),
            confirmButtonStyle: ButtonStyle(
              foregroundColor:
                  const WidgetStatePropertyAll(ColorsConstant.primary),
              textStyle: WidgetStatePropertyAll(TextStyleConstant.body.copyWith(
                fontWeight: FontWeight.bold,
              )),
            ),
            todayBackgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return ColorsConstant.primary;
                }
                return Colors.transparent;
              },
            ),
            todayForegroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return ColorsConstant.white;
                }
                return ColorsConstant.black;
              },
            ),
            dayBackgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return ColorsConstant.primary;
                }
                return Colors.transparent;
              },
            ),
            yearBackgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return ColorsConstant.primary;
                }
                return Colors.transparent;
              },
            ),
          ),
          scaffoldBackgroundColor: ColorsConstant.white,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: ColorsConstant.primary,
            selectionColor: ColorsConstant.primaryLight2,
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
                color: ColorsConstant.grey500,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsConstant.error,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsConstant.errorDark,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            errorStyle: TextStyleConstant.caption.copyWith(
              color: ColorsConstant.errorDark,
            ),
          ),
          radioTheme: const RadioThemeData(
            fillColor: WidgetStatePropertyAll(ColorsConstant.primary),
          )),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
