import 'dart:developer';
import 'package:caffe/cubit/cart/cart_cubit.dart';
import 'package:caffe/utils/helpers/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';

import 'package:caffe/models/models.dart';

import 'package:caffe/widgets/button.dart';
import 'package:caffe/features/item_detail/product_detail.dart';

import 'package:caffe/theme/fonts.dart';

// ignore: must_be_immutable
class ItemCard extends StatelessWidget {
  final Product product;
  late Map<String, dynamic>? decodedToken;
  final Function updateCartAmount;

  ItemCard(
      {Key? key,
      this.decodedToken,
      required this.product,
      required this.updateCartAmount})
      : super(key: key);

  void openDetail(context, Product item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ProductDetail(
          item: item,
        );
      },
    );
  }

  Map<String, dynamic> decode(token) {
    return Jwt.parseJwt(token);
  }

  void addToCart(context, String? role) {
    BlocProvider.of<CartCubit>(context).addToCart(product);
    updateCartAmount();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openDetail(context, product),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 32, right: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(1, 2)),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  height: 136,
                  width: 136,
                  child: Image.network(product.image),
                ),
              ),
              Text(
                product.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: FontSize.standart),
              ),
              Text(product.type),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('${product.weight}g'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('${product.price}uah'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 36,
                  width: 134,
                  child: Button(
                    onTap: () => addToCart(context, decodedToken?['role']),
                    text: 'TO CART',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
