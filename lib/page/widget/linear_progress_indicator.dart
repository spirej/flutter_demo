import 'package:flutter/material.dart';
import 'package:flutter_demo/common/theme/theme.dart';

class LinearProgressIndicatorPage extends StatefulWidget {
  const LinearProgressIndicatorPage({super.key});

  @override
  State<LinearProgressIndicatorPage> createState() => _LinearProgressIndicatorPageState();
}

class _LinearProgressIndicatorPageState extends State<LinearProgressIndicatorPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = Tween(begin: 0.0, end: 0.6).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LinearProgressIndicator'),
      ),
      body: Column(
        children: [
          Container(color: AppTheme.colorMainBlue, width: double.infinity, height: 200, child: _singleColorProgress()),
          const SizedBox(height: 20),
          Container(color: AppTheme.colorMainBlue, width: double.infinity, height: 200, child: _gradientColorProgress()),
        ],
      ),
    );
  }

  /// 单一颜色的进度条
  Widget _singleColorProgress() {
    return Center(
      child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return Container(
                width: 300,
                height: 4,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
                child: LinearProgressIndicator(
                  value: _animation.value,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                  backgroundColor: Colors.grey,
                ));
          }),
    );
  }

  /// LinearProgressIndicator 不能直接设置混合颜色，所以要实现渐变色进度条，另辟蹊径，我这里使用两个Container
  Widget _gradientColorProgress() {
    return Center(
      child: Stack(
        children: [
          Container(width: 300, height: 4, decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Colors.grey)),
          AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return Container(
                    width: _animation.value * 300,
                    height: 4,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color(0xFFF44459),
                          Color(0xFFFFA412),
                        ]),
                        borderRadius: BorderRadius.circular(2)));
              })
        ],
      ),
    );
  }
}
