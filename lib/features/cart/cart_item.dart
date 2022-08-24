import 'dart:developer';

import 'package:caffe/cubit/cart/cart_cubit.dart';
import 'package:caffe/models/cart.dart';
import 'package:caffe/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  final CartModel item;
  final Map<String, int> count;
  final Function(String) removeFromCart;
  const CartItem(
      {super.key,
      required this.item,
      required this.count,
      required this.removeFromCart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.network(item.item.image),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        item.item.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: FontSize.standart),
                      ),
                      Text(
                        item.item.description,
                        style: const TextStyle(fontSize: FontSize.small),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      '-',
                      style: TextStyle(fontSize: FontSize.standart),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        count[item.item.id].toString(),
                        style: const TextStyle(fontSize: FontSize.standart),
                      ),
                    ),
                    const Text(
                      '+',
                      style: TextStyle(fontSize: FontSize.standart),
                    ),
                  ],
                )
              ]),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => removeFromCart(item.item.id),
                    child: const Text(
                      'Remove',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: FontSize.standart,
                          color: Colors.deepPurple),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${item.item.price.toString()} uah',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: FontSize.standart),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
