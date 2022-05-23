import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/constants/routes_generate.dart';

void main() {
  runApp(const ScreenUtilInit(
    designSize: Size(393, 813),
    child: MaterialApp(
      onGenerateRoute: RouteGenerator.routeGenerator,
      debugShowCheckedModeBanner: false,
    ),
  ));
}

