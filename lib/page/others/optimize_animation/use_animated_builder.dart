import 'package:flutter/material.dart';

/*
其实 Flutter 官方提供的AnimatedBuilder就是这么做的，它将不变部分的 child 交由外部构建。
*/

class BubbleAnimatedBuilder extends StatefulWidget {
  const BubbleAnimatedBuilder({super.key});

  @override
  State<BubbleAnimatedBuilder> createState() => _BubbleAnimatedBuilderState();
}

class _BubbleAnimatedBuilderState extends State<BubbleAnimatedBuilder> with SingleTickerProviderStateMixin {
  static const double size = 60;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // 注意：这里不需要监听了并setState了，AnimatedBuilder 已经内部这样做了
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('动画优化-通过AnimatedBuilder实现')),
      body: Center(
        // 用 AnimatedBuilder 内部监听动画
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Container(
              alignment: Alignment.center,
              constraints: BoxConstraints.tight(Size.square((1 + _controller.value * 0.3) * size)),
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
              child: child, // 这个child 其实就是外部构建好的 内圈 `Container`
            );
          },
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
