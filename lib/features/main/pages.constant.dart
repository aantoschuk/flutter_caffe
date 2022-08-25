import 'package:caffe/features/cart/cart.dart';
import 'package:caffe/features/main/main_page.dart';
import 'package:caffe/features/profile/profile_page.dart';
import 'package:caffe/models/models.dart';
import 'package:flutter/material.dart';

Widget? getPages({
  required String page,
  required List<Product> items,
  required updateCartAmount,
  required updateAppBarTitle,
}) {
  final main = MainWidgetPage(items: items, updateCartAmount: updateCartAmount);

  final cart = CartPage(
    updateAppBarTitle: updateAppBarTitle,
  );
  const profile = ProfilePage();
  final list = {'main': main, 'cart': cart, 'profile': profile};
  return list[page];
}
