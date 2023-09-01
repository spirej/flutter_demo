import 'package:flutter/material.dart';
import 'package:flutter_demo/common/theme/theme.dart';
import 'package:flutter_demo/utils/route_config.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteConfig.home,
      defaultTransition: Transition.cupertinoDialog,
      getPages: RouteConfig.pages,
      title: 'Flutter love',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
    );
  }
}
