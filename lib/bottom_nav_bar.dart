import 'package:flutter/material.dart';
import 'package:flutter_demo/common/theme/icon_font.dart';
import 'package:flutter_demo/page/home/others_page.dart';
import 'package:flutter_demo/page/home/third_part_page.dart';
import 'package:flutter_demo/page/home/widget_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final List<String> _navTitles = ['widgets', 'thirdPart', 'others'];
  final List<Widget> _pageList = [WidgetPage(), const ThirdPartPage(), OthersPage()];
  final List<GButton> _tabs = [
    const GButton(icon: MyIcons.list, text: 'widgets'),
    const GButton(icon: MyIcons.link, text: 'thirdPart'),
    const GButton(icon: MyIcons.other, text: 'others'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 20,
        title: Text(_navTitles[_selectedIndex]),
      ),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: _pageList[_selectedIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.1))],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: _tabs,
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
