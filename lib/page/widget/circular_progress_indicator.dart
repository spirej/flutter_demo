import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common/theme/theme.dart';

class CircularProgressIndicatorPage extends StatefulWidget {
  const CircularProgressIndicatorPage({super.key});

  @override
  State<CircularProgressIndicatorPage> createState() => _CircularProgressIndicatorPageState();
}

class _CircularProgressIndicatorPageState extends State<CircularProgressIndicatorPage> with SingleTickerProviderStateMixin {
  final StreamController<double> _streamController = StreamController();
  final double _totalTime = 10000;
  double _progressTime = 1000;
  Timer? _timer;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _progressTime += 100;
      if (_progressTime >= _totalTime) {
        _timer?.cancel();
      }
      _streamController.add(_progressTime);
    });

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CircularProgressIndicator'),
      ),
      body: Column(
        children: [
          Container(color: AppTheme.colorMainBlue, width: double.infinity, height: 200, child: _freeStyle()),
          const SizedBox(height: 20),
          Container(color: AppTheme.colorMainBlue, width: double.infinity, height: 200, child: _timeStyle()),
          const SizedBox(height: 20),
          Container(color: AppTheme.colorMainBlue, width: double.infinity, height: 200, child: _progress()),
        ],
      ),
    );
  }

  Widget _freeStyle() {
    return const Center(
      child: SizedBox(
        width: 80,
        height: 80,
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.colorRed),
          strokeWidth: 2,
        ),
      ),
    );
  }

  Widget _timeStyle() {
    return StreamBuilder(
        stream: _streamController.stream,
        initialData: 0.0,
        builder: (BuildContext cotext, AsyncSnapshot<double> snapshot) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Stack(
              children: [
                Center(child: Text('${snapshot.data! / 1000}')),
                Center(
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.colorRed),
                      value: snapshot.data! / _totalTime,
                      strokeWidth: 2,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget _progress() {
    _animation = Tween(begin: 0.0, end: 0.6).animate(_animationController);
    _animationController.forward();
    return Center(
      child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return Container(
                width: 300,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2)
                ),
                child: LinearProgressIndicator(
                  value: _animation.value,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.orange
                  ),
                  backgroundColor: Colors.grey,
                )
            );
          }
      ),
    );
  }
}
