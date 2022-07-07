import 'package:flutter/material.dart';

import 'package:caffe/theme/fonts.dart';

Widget codempireBrand() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        'Codempire',
        style: TextStyle(fontSize: FontSize.logo, fontWeight: FontWeight.bold),
      ),
      Text(
        'Caffe',
        style: TextStyle(fontSize: FontSize.logo),
      ),
    ],
  );
}
