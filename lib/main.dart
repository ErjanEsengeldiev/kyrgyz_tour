import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyrgyz_tour/constans/app_theme.dart/app_colors.dart';
import 'package:kyrgyz_tour/constans/app_theme.dart/app_theme_data.dart';
import 'package:kyrgyz_tour/geolocator/geolocator.dart';
import 'package:kyrgyz_tour/navigation/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: AppThemeData.appThemeData,
      ),
    );
  }
}
