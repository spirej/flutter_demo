/*
经过之前的努力，可以看到，Build 阶段完全没有 rebuild 内圈的内容，只有外圈 Container随着 rebuild。
且慢，还没完呢，还有没有办法完全不 rebuild 呢？毕竟这个动画很简单，内圈完全不变的，只有外圈随时间累加而放大/缩小。这个外圈动画自己画行不行？

三、用 CustomPaint 实现
Flutter 提供了一个Widget 叫 CustomPaint，它只需要我们实现一个 CustomPainter 自己往 Canvas 绘制内容。
* */

// 先定义一个 CustomPainter，根据动画的值画外圈，代码如下：

import 'package:flutter/material.dart';

class _BubblePainter extends CustomPainter {
  final Animation<double> animation;

  // 特别注意，父类构造方法的调用不能省 super(repaint: animation)
  _BubblePainter(this.animation): super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = center.dx * (1 + animation.value * 0.3);
    final paint = Paint()..color = Colors.yellow..isAntiAlias = true;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant _BubblePainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}

// 其它代码跟之前没什么两样，如下：
class BubbleCustomPaint extends StatefulWidget {
  const BubbleCustomPaint({super.key});

  @override
  State<BubbleCustomPaint> createState() => _BubbleCustomPaintState();
}

class _BubbleCustomPaintState extends State<BubbleCustomPaint> with SingleTickerProviderStateMixin {
  static const double size = 60;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))
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
      appBar: AppBar(title: const Text('动画优化-用CustomPaint实现')),
      body: Center(
        child: CustomPaint(
          painter: _BubblePainter(_controller), // CustomPaint 的大小会自动使用 child 的大小
          child: Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
            child: const Text('Bubble', style: TextStyle(color: Colors.white, fontSize: 12))
          )
        )
      ),
    );
  }
}