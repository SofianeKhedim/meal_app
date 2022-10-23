import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screen/category_screen.dart';
import 'package:meal_app/screen/filter_screen.dart';
import 'package:meal_app/screen/home_screen.dart';
import 'package:meal_app/theme/theme.dart';

import 'models/meal.dart';
import 'screen/meal_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = dummyMeals;

  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;

      _availableMeals = dummyMeals.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
            // color: Colors.white,
            // iconTheme: IconThemeData(color: kPrimaryClr),
            // titleTextStyle: TextStyle(color: kPrimaryClr),
            color: kPrimaryClr,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white),
            elevation: 0),
      ),
      routes: {
        '/': (context) => HomePage(availableMeals: _availableMeals),
        CategoryScreen.routeName: (context) =>  CategoryScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FilterScreen.routeName: (context) => FilterScreen(_filters,_setFilters),
      },
    );
  }
}
