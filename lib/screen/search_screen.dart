import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/theme/theme.dart';

import '../widget/cardItem.dart';
import '../widget/iconBox.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _entredMessage = '';

  @override
  Widget build(BuildContext context) {
    final searchList = _entredMessage == ''
        ? []
        : dummyMeals
            .where((meal) => meal.title.contains(_entredMessage))
            .toList();
    // print(searchList.map((e) => e.title));
    // searchList.map((e) {
    //   print(e.title);
    // },);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const IconBox(icon: CupertinoIcons.back),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.only(left: 10),
                    height: 44,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.09),
                            offset: const Offset(0, 1),
                            blurRadius: 8,
                            spreadRadius: 0),
                      ],
                      color: Colors.white,
                      borderRadius: kborderRadius,
                    ),
                    child: TextField(
                      autofocus: true,
                      // controller: _controller,
                      onChanged: (val) {
                        setState(() {
                          _entredMessage = val;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const IconBox(
                  icon: FeatherIcons.search,
                  isSearch: true,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: GridView.count(
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: searchList.map((meal) {
                      final index =
                          dummyMeals.indexWhere((e) => e.title == meal.title);
                      // print(index);
                      if (index >= 0) {
                        final categoryIndex = dummyCategories.indexWhere(
                            (category) =>
                                category.id == dummyMeals[index].categories[0]);
                        // print(categoryIndex);
                        return CardItem(
                          category: categoryIndex >= 0
                              ? dummyCategories[categoryIndex].title
                              : dummyMeals[index].categories[0],
                          title: dummyMeals[index].title,
                          time: dummyMeals[index].duration,
                          complexity: dummyMeals[index].complexity,
                          affordability: dummyMeals[index].affordability,
                          imageUrl: dummyMeals[index].imageUrl,
                          isSmall: true,
                          mealId: dummyMeals[index].id,
                          isInCategory: true,
                        );
                      } else {
                        return Container();
                      }
                    }).toList())),
          ),
        ],
      )),
    );
  }
}
