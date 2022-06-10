import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:caffe/cubit/filters/filters_cubit.dart';

import 'package:caffe/models/models.dart';

import 'package:caffe/utils/helpers/helpers.dart';
import 'package:caffe/utils/service/repository.dart';

part 'items_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  final FiltersCubit _filtersCubit;

  ItemsCubit({required final filtersCubit})
      : _filtersCubit = filtersCubit,
        super(ItemsLoading());

  void loadItems() async {
    final ApiRepository apiRepository = ApiRepository();
    try {
      final items = await apiRepository.fetchProducts();
      emit(ItemsLoaded(items: items, filteredItems: items));
    } catch (e) {
      addError(Exception('Error while fetching products'), StackTrace.current);
    }
  }

  void filterItems() {
    final itemsState = state as ItemsLoaded;
    final filtersState = _filtersCubit.state as FiltersInitial;
    final filteredItems = filtersState.filters.isEmpty
        ? itemsState.items
        : filterProducts(itemsState.items, filtersState.filters);

    emit(ItemsLoaded(items: itemsState.items, filteredItems: filteredItems));
  }
}
