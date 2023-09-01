import 'package:flutter/material.dart';

/*
  在 BubbleAnimationController中，直接写UI，这样在 setState 引发 rebuild，进而重新 build 了两个 Container，包括内圈里的 Text。
  优化：把内圈的 Widget 提前构建好，外圈直接用就行了
 */

const double size = 60;

class BubbleAnimationController2 extends StatefulWidget {
  const BubbleAnimationController2(this.child, {super.key});

  final Widget child;

  @override
  State<BubbleAnimationController2> createState() => _BubbleAnimationController2State();
}

class _BubbleAnimationController2State extends State<BubbleAnimationController2> with SingleTickerProviderStateMixin {
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
      appBar: AppBar(title: const Text('动画优化-直接使用AnimationController-优化')),
      body: Center(
        // 外圈 `Container` 包裹内圈
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.tight(Size.square((1 + _controller.value * 0.3) * size)),
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.yellow),
          // 这里的 widget.child 不会 rebuild
          child: widget.child
        ),
      ),
    );
  }
}

class StaticWidget extends StatelessWidget {
  const StaticWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
      child: const Text('Bubble', style: TextStyle(color: Colors.white, fontSize: 12)),
    );
  }
}

