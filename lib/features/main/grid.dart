import 'package:flutter/cupertino.dart';

import 'package:caffe/models/product.dart';
import 'package:caffe/features/main/card.dart';

class ItemGrid extends StatelessWidget {
  const ItemGrid({
    super.key,
    required this.items,
  });
  final List<Product> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 300,
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ItemCard(product: items[index]);
      },
    );
  }
}
