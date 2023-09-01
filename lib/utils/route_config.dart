import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/bottom_nav_bar.dart';
import 'package:flutter_demo/page/others/optimize_animation/use_animated_builder.dart';
import 'package:flutter_demo/page/others/optimize_animation/use_animation_controller.dart';
import 'package:flutter_demo/page/others/optimize_animation/use_animation_controller_2.dart';
import 'package:flutter_demo/page/others/optimize_animation/use_custom_paint.dart';
import 'package:flutter_demo/page/others/radar_scan_page.dart';
import 'package:flutter_demo/page/widget/circular_progress_indicator.dart';
import 'package:flutter_demo/page/widget/text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteConfig {
  static const String home = '/';

  /// widget
  static const String textField = '/TextField';
  static const String circularProgressIndicator = '/CircularProgressIndicator';

  /// third part


  /// others
  static const String radarScanPage = '/RadarScan';
  static const String optimize_animation_use_AnimationController = '/optimize_animation_use_AnimationController';
  static const String optimize_animation_use_AnimationController2 = '/optimize_animation_use_AnimationController2';
  static const String optimize_animation_use_AnimatedBuilder = '/optimize_animation_use_AnimatedBuilder';
  static const String optimize_animation_use_CustomPaint = '/optimize_animation_use_CustomPaint';


  static final List<GetPage> pages = [
    GetPage(name: home, page: () => const BottomNavBar()),

    GetPage(name: textField, page: () => const TextFieldPage()),
    GetPage(name: circularProgressIndicator, page: () => const CircularProgressIndicatorPage()),

    GetPage(name: radarScanPage, page: () => const RadarScanPage()),
    GetPage(name: optimize_animation_use_AnimationController, page: () => const BubbleAnimationController()),
    GetPage(name: optimize_animation_use_AnimationController2, page: () => const BubbleAnimationController2(StaticWidget())),
    GetPage(name: optimize_animation_use_AnimatedBuilder, page: () => const BubbleAnimatedBuilder()),
    GetPage(name: optimize_animation_use_CustomPaint, page: () => const BubbleCustomPaint()),
  ];
}