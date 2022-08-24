import 'dart:developer';

import 'package:caffe/utils/service/routes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import 'package:caffe/theme/colors.dart';
import 'package:caffe/theme/icons.dart';

class Topbar extends StatelessWidget with PreferredSizeWidget {
  final String appTitle;
  final int cartAmount;
  final Function(String) updateAppBarTitle;
  final Function(String) changeCurrentPage;

  const Topbar({
    Key? key,
    this.appTitle = '',
    required this.cartAmount,
    required this.changeCurrentPage,
    required this.updateAppBarTitle,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void toCartPage(BuildContext context) {
    changeCurrentPage('cart');
  }

  void changePage() {
    log(appTitle);
    updateAppBarTitle('Main');
    changeCurrentPage('main');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: appTitle != 'Main'
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => changePage(),
            )
          : null,
      title: Text(appTitle),
      backgroundColor: Colors.black,
      actions: [
        IconButton(
          onPressed: null,
          icon: SvgPicture.asset(CustomIcons.bell),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: IconButton(
                onPressed: () => toCartPage(context),
                icon: SvgPicture.asset(CustomIcons.cart),
              ),
            ),
            cartAmount > 0
                ? Positioned(
                    top: 10,
                    right: 5,
                    child: Center(
                      child: Container(
                        height: 19,
                        width: 19,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColors.hanPurple,
                        ),
                        child: Center(
                          child: Text(
                            cartAmount.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        IconButton(onPressed: null, icon: SvgPicture.asset(CustomIcons.search))
      ],
    );
  }
}

/*
 TODO: 
  - change title of page to dynamic
  - change amount of items to dynamic
*/