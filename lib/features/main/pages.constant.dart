import 'package:caffe/features/cart/cart.dart';
import 'package:caffe/features/main/main_page.dart';
import 'package:caffe/models/models.dart';
import 'package:flutter/material.dart';

Widget? getPages({
  required String page,
  required List<Product> items,
  required updateCartAmount,
  required updateAppBarTitle,
}) {
  // final main = Expanded(
  //     child: ItemGrid(items: items, updateCartAmount: updateCartAmount));
  final main = MainWidgetPage(items: items, updateCartAmount: updateCartAmount);

  final cart = CartPage(
    updateAppBarTitle: updateAppBarTitle,
  );
  final list = {'main': main, 'cart': cart};
  return list[page];
}


// Column(children: [

//             state.filteredItems.isEmpty
//                 ? 
//                 : Expanded(
//                     child: 
//                   ),