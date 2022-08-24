import 'package:caffe/features/main/grid.dart';
import 'package:caffe/features/main/item_options.dart';
import 'package:caffe/features/main/sort_options.dart';
import 'package:flutter/cupertino.dart';

import 'package:caffe/models/product.dart';

class MainWidgetPage extends StatelessWidget {
  const MainWidgetPage({
    super.key,
    required this.items,
    required this.updateCartAmount,
  });

  final List<Product> items;
  final Function updateCartAmount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const ItemOptions(),
          const SortOptions(),
          items.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text('Wow, such empty'),
                  ),
                )
              : Expanded(
                  child: ItemGrid(
                      items: items, updateCartAmount: updateCartAmount))
        ],
      ),
    );
  }
}
