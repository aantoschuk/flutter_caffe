import 'package:flutter/material.dart';

import 'package:caffe/theme/fonts.dart';

Widget welcomeMessage() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      Text(
        'Welcome!',
        style: TextStyle(fontSize: FontSize.title, fontWeight: FontWeight.bold),
      ),
      Text(
        'Just one little step left',
        style: TextStyle(fontSize: FontSize.big),
      ),
    ],
  );
}
