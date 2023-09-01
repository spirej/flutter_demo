import 'package:flutter_demo/bottom_nav_bar.dart';
import 'package:flutter_demo/page/others/optimize_animation/use_animated_builder.dart';
import 'package:flutter_demo/page/others/optimize_animation/use_animation_controller.dart';
import 'package:flutter_demo/page/others/optimize_animation/use_animation_controller_2.dart';
import 'package:flutter_demo/page/others/optimize_animation/use_custom_paint.dart';
import 'package:flutter_demo/page/others/radar_scan_page.dart';
import 'package:flutter_demo/page/widget/circular_progress_indicator.dart';
import 'package:flutter_demo/page/widget/linear_progress_indicator.dart';
import 'package:flutter_demo/page/widget/text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteConfig {
  static const String home = '/';

  /// widget
  static const String textField = '/TextField';
  static const String circularProgressIndicator = '/CircularProgressIndicator';
  static const String linearProgressIndicatorPage = '/LinearProgressIndicatorPage';

  /// third part


  /// others
  static const String radarScanPage = '/RadarScan';
  static const String optimizeAnimationUseAnimationController = '/optimize_animation_use_AnimationController';
  static const String optimizeAnimationUseAnimationController2 = '/optimize_animation_use_AnimationController2';
  static const String optimizeAnimationUseAnimatedBuilder = '/optimize_animation_use_AnimatedBuilder';
  static const String optimizeAnimationUseCustomPaint = '/optimize_animation_use_CustomPaint';


  static final List<GetPage> pages = [
    GetPage(name: home, page: () => const BottomNavBar()),

    GetPage(name: textField, page: () => const TextFieldPage()),
    GetPage(name: circularProgressIndicator, page: () => const CircularProgressIndicatorPage()),
    GetPage(name: linearProgressIndicatorPage, page: () => const LinearProgressIndicatorPage()),

    GetPage(name: radarScanPage, page: () => const RadarScanPage()),
    GetPage(name: optimizeAnimationUseAnimationController, page: () => const BubbleAnimationController()),
    GetPage(name: optimizeAnimationUseAnimationController2, page: () => const BubbleAnimationController2(StaticWidget())),
    GetPage(name: optimizeAnimationUseAnimatedBuilder, page: () => const BubbleAnimatedBuilder()),
    GetPage(name: optimizeAnimationUseCustomPaint, page: () => const BubbleCustomPaint()),
  ];
}