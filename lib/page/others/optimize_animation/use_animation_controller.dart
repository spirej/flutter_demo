import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
  原文：https://mp.weixin.qq.com/s/tqCDNs-92o9etwDmJAokVw
  实现一个简单的汽泡动画
  方式一：直接通过 AnimationController 实现
  当看到这个效果图的时候，很快啊，啪一下思路就来了。涉及到动画，有状态，用 StatefulWidget ，
  State 里创建一个 AnimationController，用两个 Container 对应两个圈，外圈的 Container 的宽高监听动画跟着更新就行。
 */

class BubbleAnimationController extends StatefulWidget {
  const BubbleAnimationController({super.key});

  @override
  State<BubbleAnimationController> createState() => _BubbleAnimationControllerState();
}

class _BubbleAnimationControllerState extends State<BubbleAnimationController> with SingleTickerProviderStateMixin {
  static const double size = 60;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..addListener(() {
        debugPrint('BubbleAnimationController initState ${_controller.value}');
        setState(() {
        });
      })
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('动画优化-直接使用AnimationController')),
      body: Center(
        // 两个 `Container` 对应两个圈
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.tight(Size.square((1 + _controller.value * 0.3) * size)),
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
          child: Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
            child: const Text('Bubble', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ),
      ),
    );
  }
}
