import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:caffe/utils/service/routes.dart';

import 'package:caffe/theme/icons.dart';

class BottomNavigation extends StatefulWidget {
  final void Function(String) updateAppBarTitle;
  final void Function(String) changeCurrentPage;
  const BottomNavigation(
      {Key? key,
      required this.updateAppBarTitle,
      required this.changeCurrentPage})
      : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int selectedIndex = 0;

  void _onTap(int index) {
    switch (index) {
      case 0:
        {
          widget.updateAppBarTitle('Main');
          setState(() {
            selectedIndex = index;
          });
          widget.changeCurrentPage('main');
          break;
        }
      case 1:
        {
          widget.updateAppBarTitle('Profile');
          setState(() {
            selectedIndex = index;
          });
          widget.changeCurrentPage('profile');
          break;
        }
      case 2:
        {
          widget.updateAppBarTitle('Orders');
          setState(() {
            selectedIndex = index;
          });
          Navigator.pushReplacementNamed(context, Routes.orders);
          break;
        }
    }
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
