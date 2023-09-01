import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OthersPage extends StatelessWidget {
  OthersPage({super.key});

  final List _pages = [
    {'desc': '雷达扫描效果', 'route': '/RadarScan'},
    {'desc': '动画优化-直接使用AnimationController', 'route': '/optimize_animation_use_AnimationController'},
    {'desc': '动画优化-直接使用AnimationController-优化', 'route': '/optimize_animation_use_AnimationController2'},
    {'desc': '动画优化-通过AnimatedBuilder实现', 'route': '/optimize_animation_use_AnimatedBuilder'},
    {'desc': '动画优化-用CustomPaint实现', 'route': '/optimize_animation_use_CustomPaint'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: _pages.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          final String desc = _pages[index]['desc'];
          final String route = _pages[index]['route'];
          return InkWell(
              onTap: () {
                Get.toNamed(route);
              },
              child: Text(desc));
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10));
  }
}
