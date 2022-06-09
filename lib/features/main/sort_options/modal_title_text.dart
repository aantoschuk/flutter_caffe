import 'package:flutter/cupertino.dart';

import 'package:caffe/widgets/bottom_border.dart';

import 'package:caffe/theme/fonts.dart';

class ModalTitleText extends StatelessWidget {
  final String value;
  const ModalTitleText({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 32,
            decoration: BoxDecoration(border: bottomBorder()),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: FontSize.big,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
