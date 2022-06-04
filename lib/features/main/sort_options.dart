import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:caffe/features/main/sort_options/bottom_modal_sheet.dart';

import 'package:caffe/theme/fonts.dart';
import 'package:caffe/theme/icons.dart';

class SortOptions extends StatelessWidget {
  const SortOptions({Key? key}) : super(key: key);

  void onFilterPressed(context, state) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomModalSheet(
          filterState: state,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => onFilterPressed(context, ''),
            child: Row(
              children: [
                SvgPicture.asset(CustomIcons.filters),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'FILTER',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      letterSpacing: 1.25,
                      fontSize: FontSize.small,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                'SORT',
                style: TextStyle(
                  color: Colors.deepPurple,
                  letterSpacing: 1.25,
                  fontSize: FontSize.small,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SvgPicture.asset(CustomIcons.arrowDown),
          ]),
        ],
      ),
    );
  }
}
