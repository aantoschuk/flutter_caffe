import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:caffe/models/models.dart';

import 'package:caffe/widgets/button.dart';
import 'package:caffe/widgets/bottom_border.dart';

import 'package:caffe/theme/icons.dart';
import 'package:caffe/theme/fonts.dart';

class ProductDetail extends StatelessWidget {
  final Product item;
  const ProductDetail({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.88,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 24, left: 19, bottom: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                decoration: BoxDecoration(border: bottomBorder()),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Product information',
                          style: TextStyle(
                              fontSize: FontSize.small,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(CustomIcons.xMark),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Center(
                child: SizedBox(height: 156, child: Image.network(item.image))),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 24),
              child: Center(
                child: Text(
                  item.name,
                  style: const TextStyle(fontSize: FontSize.title),
                ),
              ),
            ),
            Expanded(
              child: Text(
                item.description,
                style: const TextStyle(fontSize: FontSize.standart),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${item.weight}g'),
                Text('${item.price}uah'),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 17),
              child: Center(
                child: SizedBox(
                    width: double.infinity,
                    child: Button(onTap: null, text: 'ORDER')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
