import 'package:flutter/material.dart';
import 'package:meal_app/theme/theme.dart';

class PageViewIndicator extends StatelessWidget {
  const PageViewIndicator({super.key, required this.active});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: 7,
      width: active ? 20: 7,
      decoration: BoxDecoration(
        color: active ? kPrimaryClr : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}


































