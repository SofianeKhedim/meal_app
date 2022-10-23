import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/theme/theme.dart';
import 'package:meal_app/widget/banner.dart';
import 'package:meal_app/widget/drawer.dart';
import 'package:provider/provider.dart';

import '../widget/cardColumn.dart';
import '../widget/cardRow.dart';
import '../widget/category.dart';
import '../widget/iconBox.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    Provider.of<MealProvider>(context, listen: false).setData();
    return Scaffold(
      drawer: const MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: kDefaultPaddingHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        IconBox(icon: FeatherIcons.menu),
                        IconBox(icon: FeatherIcons.search),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Meal app!',
                      style: titleText,
                    ),
                    const SizedBox(height: 12),
                    const KBanner(),
                    const SizedBox(height: 12),
                    const CategoryPageView(),
                  ],
                ),
              ),
              const CardRow(),
              ...List.generate(
                12,
                (index) => CardColumn(index: index),
              )
            ],
          ),
        ),
      ),
    );
  }
}
