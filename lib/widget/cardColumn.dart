import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widget/cardItem.dart';
import 'package:meal_app/widget/textRow.dart';

class CardColumn extends StatelessWidget {
  const CardColumn({super.key, required this.index, required this.availableMeals});
  final int index;
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    final categoryTitle = dummyCategories[index].title;
    final categoryId = dummyCategories[index].id;
    var categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    if (categoryMeals.length > 2) {
      categoryMeals = categoryMeals.getRange(0, 2).toList();
    }
    return Column(
      children: [
        if(categoryMeals.length>0) TextRow(categoryTitle: categoryTitle, categoryId: categoryId),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: categoryMeals
                .map(
                  (e) => CardItem(
                    category: categoryTitle,
                    title: e.title,
                    time: e.duration,
                    complexity: e.complexity, //${e.complexity}
                    affordability: e.affordability, //{e.affordability}
                    imageUrl: e.imageUrl,
                    mealId: e.id,
                    isSmall: true,
                  ),
                )
                .toList())

                //revisi e mb3d dirlou filter ida gluten... hdik fun li mektoba fl main ida returnat true tssema return card item ida nn return sizedbox();jhhghdgh
            
      ],
    );
  }
}
