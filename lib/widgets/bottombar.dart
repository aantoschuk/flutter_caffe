import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:caffe/utils/service/routes.dart';

import 'package:caffe/theme/icons.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      Navigator.pushReplacementNamed(context, Routes.orders);
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      fixedColor: Colors.white,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(CustomIcons.home), label: 'Main'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(CustomIcons.profile), label: 'Profile'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(CustomIcons.orders), label: 'Orders'),
      ],
      currentIndex: selectedIndex,
      onTap: _onTap,
      iconSize: 100,
      unselectedItemColor: Colors.white,
    );
  }
}
