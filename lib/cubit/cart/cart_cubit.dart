import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:caffe/models/cart.dart';
import 'package:caffe/models/models.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const Cart());

  void addToCart(Product item) {
    // Create new Cart object
    CartModel product = CartModel(item: item);
    final cartState = state as Cart;
    emit(Cart(items: [...cartState.items, product]));
  }

  void saveCart(List<CartModel> items) {
    emit(Cart(items: items));
  }
}
