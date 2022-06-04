part of 'items_cubit.dart';

abstract class ItemsState extends Equatable {
  const ItemsState();

  @override
  List<Object> get props => [];
}

class ItemsLoading extends ItemsState {}

class ItemsLoad extends ItemsState {}

class ItemsLoaded extends ItemsState {
  final List<Product> filteredItems;
  final List<Product> items;
  const ItemsLoaded({
    this.filteredItems = const [],
    this.items = const [],
  });

  @override
  List<Object> get props => [filteredItems, items];
}
