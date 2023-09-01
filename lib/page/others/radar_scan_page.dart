import 'package:flutter/material.dart';
import 'package:flutter_demo/common/theme/icon_font.dart';
import 'package:flutter_demo/common/theme/theme.dart';
import 'package:flutter_demo/utils/image_view.dart';

class RadarScanPage extends StatelessWidget {
  const RadarScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('雷达扫描效果'),
      ),
      body: Container(
        color: Colors.black12,
        width: double.infinity,
        height: 200,
        child: Center(
          child: InviteRandomWidget(
            mostSize: 150,
            secondSize: 132,
            thirdSize: 116,
            fourthSize: 90,
            fifthSize: 44,
            sixthSize: 6,
            topRightIcon: Positioned(
              left: 100,
              top: 16,
              child: ClipOval(
                child: Container(width: 32, height: 32, color: Colors.white, child: const Icon(MyIcons.person, size: 16, color: AppTheme.colorMainBlue)),
              ),
            ),
            bottomLeftIcon: Positioned(
              left: 16,
              top: 102,
              child: ClipOval(
                  child: Container(width: 24, height: 24, color: Colors.white, child: const Icon(MyIcons.lightning, size: 12, color: AppTheme.colorRed))),
            ),
          ),
        ),
      ),
    );
  }
}


class InviteRandomWidget extends StatefulWidget {
  const InviteRandomWidget(
      {Key? key,
        required this.mostSize,
        required this.secondSize,
        required this.thirdSize,
        required this.fourthSize,
        required this.fifthSize,
        required this.sixthSize,
        this.thirdBorderWidth,
        this.fourthBorderWidth,
        this.fifthBorderWidth,
        this.topRightIcon,
        this.bottomLeftIcon,
        this.showAnimation = true})
      : super(key: key);

  final double mostSize; // 最大层
  final double secondSize; // 次大层
  final double thirdSize; // 第三层（白圈）
  final double fourthSize; // 第四层（灰白圈）
  final double fifthSize; // 第五层（次灰白圈）
  final double sixthSize; // 第六层（中间白原点）
  final double? thirdBorderWidth;
  final double? fourthBorderWidth;
  final double? fifthBorderWidth;
  final Widget? topRightIcon;
  final Widget? bottomLeftIcon;
  final bool showAnimation;

  @override
  State<InviteRandomWidget> createState() => _InviteRandomWidgetState();
}

class _InviteRandomWidgetState extends State<InviteRandomWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));
    Future.delayed(Duration.zero, () {
      _controller.repeat();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.mostSize,
      height: widget.mostSize,
      child: Stack(
        children: [
          Opacity(opacity: 0.1, child: ClipOval(child: Container(color: const Color(0xE5FD7999)))),
          Opacity(
              opacity: 0.2,
              child: Center(child: ClipOval(child: Container(width: widget.secondSize, height: widget.secondSize, color: const Color(0xCCFF455B))))),
          Center(
            child: ImageView("gradient.png", size: widget.thirdSize),
          ),
          Center(
            child: Container(
              width: widget.thirdSize,
              height: widget.thirdSize,
              decoration: ShapeDecoration(shape: CircleBorder(side: BorderSide(width: widget.thirdBorderWidth ?? 1, color: Colors.white))),
            ),
          ),
          Center(
            child: Container(
              width: widget.fourthSize,
              height: widget.fourthSize,
              decoration: ShapeDecoration(shape: CircleBorder(side: BorderSide(width: widget.fourthBorderWidth ?? 1, color: Colors.white.withOpacity(0.3)))),
            ),
          ),
          Center(
            child: Container(
              width: widget.fifthSize,
              height: widget.fifthSize,
              decoration: ShapeDecoration(shape: CircleBorder(side: BorderSide(width: widget.fifthBorderWidth ?? 0.6, color: Colors.white.withOpacity(0.6)))),
            ),
          ),
          Center(child: ClipOval(child: Container(width: widget.sixthSize, height: widget.sixthSize, color: Colors.white))),
          Center(child: _animationWidget()),
          widget.topRightIcon ?? const SizedBox.shrink(),
          widget.bottomLeftIcon ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _animationWidget() {
    if (!widget.showAnimation) {
      return Transform(
          transform: Matrix4.identity()..rotateZ(0.6),
          alignment: Alignment.center,
          child: ClipOval(
              child: Container(
                width: widget.thirdSize,
                height: widget.thirdSize,
                decoration: BoxDecoration(gradient: SweepGradient(colors: [Colors.transparent, Colors.white.withOpacity(0.6)])),
              )));
    }
    return RotationTransition(
        turns: _controller,
        child: ClipOval(
            child: Container(
              width: widget.thirdSize,
              height: widget.thirdSize,
              decoration: BoxDecoration(gradient: SweepGradient(colors: [Colors.transparent, Colors.white.withOpacity(0.6)])),
            )));
  }
}
