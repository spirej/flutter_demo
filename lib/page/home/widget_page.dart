import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetPage extends StatelessWidget {
  WidgetPage({super.key});

  final List _pages = [
    {'desc': 'TextField', 'route': '/TextField'},
    {'desc': 'CircularProgressIndicator', 'route': '/CircularProgressIndicator'},
    {'desc': 'LinearProgressIndicatorPage', 'route': '/LinearProgressIndicatorPage'},
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
