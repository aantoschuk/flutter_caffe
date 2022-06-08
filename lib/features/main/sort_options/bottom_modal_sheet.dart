import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:caffe/cubit/items/items_cubit.dart';
import 'package:caffe/cubit/filters/filters_cubit.dart';

import 'package:caffe/features/main/sort_options/bottom_border.dart';
import 'package:caffe/features/main/sort_options/modal_title_text.dart';

import 'package:caffe/theme/icons.dart';
import 'package:caffe/theme/fonts.dart';

class BottomModalSheet extends StatelessWidget {
  final dynamic filterState;
  const BottomModalSheet({
    Key? key,
    required this.filterState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersCubit, FiltersState>(
      builder: (context, state) {
        if (state is FiltersInitial) {
          return FractionallySizedBox(
            heightFactor: 0.88,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 24, left: 19, bottom: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Container(
                      decoration: BoxDecoration(
                        border: bottomBorder(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              CustomIcons.filters,
                              color: Colors.black,
                            ),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 19),
                                child: Text(
                                  'Filters',
                                  style: TextStyle(
                                    letterSpacing: 1.25,
                                    fontSize: FontSize.small,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: SvgPicture.asset(CustomIcons.xMark)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const ModalTitleText(
                    value: 'Drinks',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 26),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 14),
                              child: CheckboxFilter(
                                  text: 'Hot drinks', filters: state.filters),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CheckboxFilter(
                                  text: 'Coctails', filters: state.filters),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 14),
                              child: CheckboxFilter(
                                  text: 'Non-alcohol coctails',
                                  filters: state.filters),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const ModalTitleText(value: 'Food'),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckboxFilter(
                          filters: state.filters,
                          text: 'Main',
                        ),
                        CheckboxFilter(
                          filters: state.filters,
                          text: 'Salad',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckboxFilter(
                          filters: state.filters,
                          text: 'Desserts',
                        ),
                        CheckboxFilter(
                          filters: state.filters,
                          text: 'Burger',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckboxFilter(
                          filters: state.filters,
                          text: 'Soups',
                        ),
                        CheckboxFilter(
                          filters: state.filters,
                          text: 'Pizza',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}

class CheckboxFilter extends StatefulWidget {
  final String text;
  final List<String> filters;

  const CheckboxFilter({super.key, required this.text, required this.filters});

  @override
  State<StatefulWidget> createState() => CheckboxFilterState();
}

class CheckboxFilterState extends State<CheckboxFilter> {
  bool value = false;

  @override
  void initState() {
    super.initState();
    final state = BlocProvider.of<FiltersCubit>(context).state;
    if (state is FiltersInitial) {
      setState(() {
        value = state.filters.contains(widget.text.toLowerCase());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: value,
            onChanged: (_) {
              if (value == false) {
                BlocProvider.of<FiltersCubit>(context).addFilter(
                  widget.text.toLowerCase(),
                );
                setState(() {
                  value = true;
                });
                BlocProvider.of<ItemsCubit>(context).filterItems();
              } else {
                BlocProvider.of<FiltersCubit>(context).removeFilter(
                  widget.text.toLowerCase(),
                );
                setState(() {
                  value = false;
                });

                BlocProvider.of<ItemsCubit>(context).filterItems();
              }
            }),
        Text(widget.text)
      ],
    );
  }
}
