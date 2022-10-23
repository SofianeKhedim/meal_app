import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:meal_app/theme/theme.dart';

import '../screen/category_screen.dart';

class TextRow extends StatelessWidget {
  const TextRow({super.key, required this.categoryTitle, required this.categoryId});
  final String categoryTitle;
  final String categoryId;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            categoryTitle,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, CategoryScreen.routeName,
        arguments: {'id': categoryId, 'title': categoryTitle}),
            child: Row(
              children: const [
                Text(
                  'See All',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  FeatherIcons.arrowRight,
                  size: 16,
                  color: kPrimaryClr,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
