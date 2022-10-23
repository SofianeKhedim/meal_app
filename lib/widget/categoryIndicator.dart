import 'package:flutter/material.dart';
import 'package:meal_app/theme/theme.dart';

class CategoryIndicator extends StatelessWidget {
  const CategoryIndicator({super.key, required this.active});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: CircleAvatar(
        radius: 3.5,
        backgroundColor: active ? kPrimaryClr : Colors.grey,
      ),
    );
  }
}
