import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/theme/theme.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  static const routeName = 'meal_detail';

  final String imgUrl =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg';

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealId = routeArg['mealId']!;
    final mealIndex = dummyMeals.indexWhere((element) => element.id == mealId);
    final String imageUrl = dummyMeals[mealIndex].imageUrl;
    final String title = dummyMeals[mealIndex].title;
    final List<String> ingredients = dummyMeals[mealIndex].ingredients;
    final String lastIngredients = ingredients[ingredients.length - 1];
    final List<String> steps = dummyMeals[mealIndex].steps;
    final String lastStep = steps[steps.length - 1];
    int count = 0;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                CupertinoIcons.back,
                size: 26,
              ),
            ),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: mealId,
                child: Image.network(
                  imageUrl,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              centerTitle: true,
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
              title: Text(title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700)),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildTitleText('Ingredients'),
                    const SizedBox(
                      height: 8,
                    ),
                    ...ingredients
                        .map((ingredient) =>
                            buildList(ingredient, lastIngredients))
                        .toList(),
                    buildTitleText('Steps'),
                    const SizedBox(
                      height: 8,
                    ),
                    ...steps.map((step) {
                      count++;
                      return buildList(step, lastStep, true, count);
                    }).toList(),
                    const SizedBox(
                      height: 25,
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }

  Text buildTitleText(String text) {
    return Text(
      '\n$text',
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    );
  }

  Padding buildList(String ingredient, String lastIngredients,
      [bool isSteps = false, int count = 0]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSteps)
            Row(
              
              children: [
                const CircleAvatar(
                  radius: 3,
                  backgroundColor: kPrimaryClr,
                ),
                Expanded(
                  child: Text(
                    '  $ingredient',
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          if (isSteps)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$count.',
                  style: const TextStyle(
                      color: kGreyClr, fontWeight: FontWeight.w600),
                ),
                Expanded(
                  child: Text(
                    ' $ingredient',
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          const SizedBox(
            height: 2,
          ),
          if (lastIngredients != ingredient)
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.grey.shade300,
            )
        ],
      ),
    );
  }
}
