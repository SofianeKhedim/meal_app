import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../providers/meal_provider.dart';
import '../widget/cardItem.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const routeName = 'category_screen';

  @override
  Widget build(BuildContext context) {
    final availableMeals = Provider.of<MealProvider>(context).availableMeals;

    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArg['title'];
    final categoryId = routeArg['id'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: !(categoryId == 'Popular')
                ? categoryMeals
                    .map(
                      (e) => CardItem(
                          category: categoryTitle,
                          title: e.title,
                          time: e.duration,
                          complexity: e.complexity, //${e.complexity}
                          affordability: e.affordability, //{e.affordability}
                          imageUrl: e.imageUrl,
                          isSmall: true,
                          mealId: e.id,
                          isInCategory: true),
                    )
                    .toList()
                : dummyPopularMeals.map(
                    (e) {
                      final categoryIndex = dummyCategories.indexWhere(
                          (category) => category.id == e.categories[0]);
                      return CardItem(
                          category: dummyCategories[categoryIndex].title,
                          title: e.title,
                          time: e.duration,
                          complexity: e.complexity, //${e.complexity}
                          affordability: e.affordability, //{e.affordability}
                          imageUrl: e.imageUrl,
                          isSmall: true,
                          mealId: e.id,
                          isInCategory: true);
                    },
                  ).toList()),
      ),
    );
  }
}
