import 'package:flutter/material.dart';

import 'package:caffe/theme/fonts.dart';

class ItemOptions extends StatelessWidget {
  const ItemOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        color: Colors.black,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                child: const Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: FontSize.standart,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: const Center(
                  child: Text(
                    'Product',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: FontSize.standart,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
