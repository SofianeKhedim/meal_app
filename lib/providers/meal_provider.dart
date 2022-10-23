import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

class MealProvider with ChangeNotifier {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = dummyMeals;

  void setFilters() async {
    availableMeals = dummyMeals.where((meal) {
      if (filters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (filters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (filters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }

      return true;
    }).toList();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('gluten', filters['gluten']!);
    prefs.setBool('lactose', filters['lactose']!);
    prefs.setBool('vegan', filters['vegan']!);
    prefs.setBool('vegetarian', filters['vegetarian']!);
  }

  void setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    filters['gluten'] = prefs.getBool('gluten')?? false;
    filters['lactose'] = prefs.getBool('lactose')?? false;
    filters['vegan'] = prefs.getBool('vegan')?? false;
    filters['vegetarian'] = prefs.getBool('vegetarian')?? false;
    setFilters();
    notifyListeners();
  }
}
