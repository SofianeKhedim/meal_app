import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/widget/textRow.dart';

import '../dummy_data.dart';
import '../models/meal.dart';
import 'cardItem.dart';

class CardRow extends StatelessWidget {
  const CardRow({super.key});

  @override
  Widget build(BuildContext context) {



    return Column(
      children: [
        const TextRow(categoryId: 'Popular', categoryTitle: 'Popular'),
        SizedBox(
          height: 300,
          child: PageView.builder(
              controller: PageController(viewportFraction: 0.65),
              itemCount: 5,
              itemBuilder: (context, index) {
                    final categoryIndex = dummyCategories.indexWhere((category) => category.id==dummyPopularMeals[index].categories[0]);
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CardItem(
                    category: dummyCategories[categoryIndex].title,
                    title: dummyPopularMeals[index].title,
                    time: dummyPopularMeals[index].duration,
                    complexity: dummyPopularMeals[index].complexity,
                    affordability: dummyPopularMeals[index].affordability,
                    mealId: dummyPopularMeals[index].id,
                    imageUrl:
                        dummyPopularMeals[index].imageUrl,
                  ),
                );
              }),
        ),
      ],
    );
  }
}
