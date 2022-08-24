import 'dart:convert';
import 'dart:developer';

import 'package:caffe/cubit/cart/cart_cubit.dart';
import 'package:caffe/features/cart/cart_item.dart';
import 'package:caffe/models/cart.dart';
import 'package:caffe/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  final Function(String) updateAppBarTitle;
  const CartPage({Key? key, required this.updateAppBarTitle}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  List<CartModel>? items;

  Map<String, int> count = {};

  @override
  void initState() {
    super.initState();
    final cartState = BlocProvider.of<CartCubit>(context).state as Cart;
    // Avoid using forEach with function literal
    for (var object in cartState.items) {
      count[object.item.id] = (count[object.item.id] ?? 0) + 1;
    }
    var seen = <String>{};
    setState(() {
      items = cartState.items.where((item) => seen.add(item.item.id)).toList();
    });
    Future.delayed(Duration.zero, () async {
      widget.updateAppBarTitle('Cart');
    });
  }

  void createOrder() {
    log('order');
  }

  void removeFromCart(String id) {
    List<CartModel>? state = items;
    state?.removeWhere((item) => item.item.id == id);
    setState(() {
      items = state;
    });
    BlocProvider.of<CartCubit>(context).saveCart(state ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            items!.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: items!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CartItem(
                              item: items![index],
                              count: count,
                              removeFromCart: removeFromCart);
                        }),
                  )
                : const Center(child: Text('Wow such empty')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                  width: double.infinity,
                  child: Button(onTap: createOrder, text: 'Order')),
            ),
          ],
        ),
      ),
    );
  }
}
