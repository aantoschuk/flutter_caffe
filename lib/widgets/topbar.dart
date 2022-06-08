import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import 'package:caffe/theme/colors.dart';
import 'package:caffe/theme/icons.dart';

class Topbar extends StatelessWidget with PreferredSizeWidget {
  const Topbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Main'),
      backgroundColor: Colors.black,
      actions: [
        IconButton(
          onPressed: null,
          icon: SvgPicture.asset(CustomIcons.bell),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: null,
              icon: SvgPicture.asset(CustomIcons.cart),
            ),
            Positioned(
                top: 5,
                right: 5,
                child: Center(
                  child: Container(
                    height: 19,
                    width: 19,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomColors.hanPurple,
                    ),
                    child: const Center(
                      child: Text(
                        '5',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ))
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