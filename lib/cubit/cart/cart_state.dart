part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class Cart extends CartState {
  final List<CartModel> items;

  const Cart({this.items = const []});

  @override
  List<Object> get props => [items];
}
