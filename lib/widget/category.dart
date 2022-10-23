import 'package:flutter/material.dart';
import 'package:meal_app/screen/category_screen.dart';
import 'package:meal_app/theme/theme.dart';

import '../dummy_data.dart';
import 'categoryIndicator.dart';

class CategoryPageView extends StatefulWidget {
  const CategoryPageView({super.key});

  @override
  State<CategoryPageView> createState() => _CategoryPageViewState();
}

class _CategoryPageViewState extends State<CategoryPageView> {
  void _selectCategory(BuildContext context, String id, String title) {
    Navigator.pushNamed(context, CategoryScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  int pageViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 95,
          width: double.infinity,
          child: PageView.builder(
              onPageChanged: ((value) {
                setState(() {
                  pageViewIndex = value;
                });
              }),
              controller: PageController(viewportFraction: 1),
              itemCount: 3,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return categoryItem(0, 4);
                }
                if (index == 1) {
                  return categoryItem(4, 8);
                } else {
                  return categoryItem(8, 12);
                }
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                3,
                (index) => CategoryIndicator(
                    active: pageViewIndex == index ? true : false))
          ],
        ),
      ],
    );
  }

  Container categoryItem(int startRange, int endRange) {
    return Container(
      padding: kDefaultPaddingHorizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: dummyCategories
            .getRange(startRange, endRange)
            .map((e) => Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: kPrimaryClr)),
                      child: GestureDetector(
                        onTap: () {
                          _selectCategory(context, e.id, e.title);
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            e.image,
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      e.title,
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}
