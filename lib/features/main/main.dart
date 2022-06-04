import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:caffe/widgets/bottombar.dart';
import 'package:caffe/features/main/grid.dart';
import 'package:caffe/features/main/sort_options.dart';
import 'package:caffe/features/main/item_options.dart';

import 'package:caffe/cubit/items/items_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Products();
  }
}

class Products extends StatelessWidget {
  const Products({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsCubit, ItemsState>(builder: (context, state) {
      if (state is ItemsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ItemsLoaded) {
        return Column(children: [
          const ItemOptions(),
          const SortOptions(),
          state.filteredItems.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text('Wow, such empty'),
                  ),
                )
              : Expanded(child: ItemGrid(items: state.filteredItems)),
          const BottomNavigation()
        ]);
      } else {
        return const Center(
          child: Text('Something went wrong'),
        );
      }
    });
  }
}
