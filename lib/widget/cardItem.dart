import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/category_screen.dart';
import 'package:meal_app/theme/theme.dart';

import '../screen/meal_details_screen.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {super.key,
      required this.category,
      required this.title,
      required this.time,
      required this.complexity,
      required this.affordability,
      required this.imageUrl,
      this.isSmall = false,
      this.isInCategory = false,
      required this.mealId});

  final String category;
  final String title;
  final int time;
  final Complexity complexity;
  final Affordability affordability;
  final String imageUrl;
  final String mealId;
  final bool isSmall;

  final bool isInCategory;

  

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
    }
  }

  void selectMeal(BuildContext context) {
    
    Navigator.push(
        context,
        PageRouteBuilder(
          settings: RouteSettings(arguments: {'mealId': mealId}),
          reverseTransitionDuration: const Duration(milliseconds: 600),
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MealDetailScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: const Offset(0.0, 0.0),
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: child,
            );
          },
        ));
  }

  

  @override
  Widget build(BuildContext context) {




    return GestureDetector(
      onTap: () => selectMeal(context),
      child: Container(
        height: isSmall ? 199 : 280,
        width: isSmall ? 181.2 : 237,
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(width: 0.1, color: Colors.grey.withOpacity(0.6)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.07),
                offset: const Offset(0, 2),
                blurRadius: 7)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 7),
              SizedBox(
                height: isSmall ? 100 : 130,
                width: isSmall ? 180 : 222,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kPrimaryClr.withOpacity(0.41),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          imageUrl,
                          height: isSmall ? 100 : 130,
                          width: isSmall ? 180 : 222,
                          fit: BoxFit.cover,
                        )),
                  ),
                  // const Positioned(
                  //   right: 8,
                  //   top: 8,
                  //   child: Icon(
                  //     FeatherIcons.heart,
                  //     color: kPrimaryClr,
                  //   ),
                  // ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: !isSmall
                          ? 10
                          : isInCategory
                              ? 2
                              : 6,
                    ),
                    Text(
                      category,
                      style: TextStyle(
                        color: kPrimaryClr,
                        fontSize: isSmall ? 10 : 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: isSmall ? 1 : 3,
                    ),
                    SizedBox(
                      height: isSmall ? 40 : 55,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: const Color(0xff303030),
                          fontSize: isSmall ? 14 : 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: !isSmall
                          ? 10
                          : isInCategory
                              ? 2
                              : 4),
                  width: isSmall ? 126 : 180,
                  height: isSmall ? 1.5 : 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 3),
              buttomIconText()
            ],
          ),
        ),
      ),
    );
  }

  Row buttomIconText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        kIconText('$time Min', FeatherIcons.clock),
        SizedBox(
            width: !isSmall
                ? 12
                : isInCategory
                    ? 2.65
                    : 4),
        kIconText(complexityText, FeatherIcons.loader),
        SizedBox(
            width: !isSmall
                ? 12
                : isInCategory
                    ? 2.65
                    : 4),
        kIconText(affordabilityText, FeatherIcons.dollarSign),
      ],
    );
  }

  Row kIconText(String text, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: isSmall ? 12 : 14,
          color: kPrimaryClr,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          text,
          style: TextStyle(
            color: kPrimaryClr,
            fontSize: isSmall ? 8 : 11,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
