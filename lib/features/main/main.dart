import 'dart:developer';

import 'package:caffe/cubit/auth/auth_cubit.dart';
import 'package:caffe/cubit/cart/cart_cubit.dart';
import 'package:caffe/features/main/main_page.dart';
import 'package:caffe/features/main/pages.constant.dart';
import 'package:caffe/widgets/topbar.dart';
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

class Products extends StatefulWidget {
  const Products({super.key});
  @override
  State<StatefulWidget> createState() => ProductsState();
}

class ProductsState extends State<Products> {
  String appTitle = 'Main';
  String currentPage = 'main';

  // If, state hydrated, then it necessary to initialize that variable on init
  int cartAmount = 0;

  void updateAppBarTitle(String newTitle) {
    setState(() {
      appTitle = newTitle;
    });
  }

  void changeCurrentPage(String name) {
    setState(() {
      currentPage = name;
    });
  }

  void updateCartAmount() {
    setState(() {
      cartAmount = cartAmount + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbar(
          appTitle: appTitle,
          cartAmount: cartAmount,
          changeCurrentPage: changeCurrentPage,
          updateAppBarTitle: updateAppBarTitle),
      body: BlocBuilder<ItemsCubit, ItemsState>(builder: (context, state) {
        if (state is ItemsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ItemsLoaded) {
          return Column(
            children: [
              Expanded(
                child: getPages(
                        items: state.filteredItems,
                        updateCartAmount: updateCartAmount,
                        page: currentPage,
                        updateAppBarTitle: updateAppBarTitle) ??
                    const Expanded(
                      child: Text('No such page'),
                    ),
              ),
              BottomNavigation(
                  updateAppBarTitle: updateAppBarTitle,
                  changeCurrentPage: changeCurrentPage),
            ],
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      }),
    );
  }
}
