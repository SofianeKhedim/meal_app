import 'package:flutter/material.dart';

import 'package:meal_app/screen/category_screen.dart';
import 'package:meal_app/screen/filter_screen.dart';
import 'package:meal_app/screen/home_screen.dart';
import 'package:meal_app/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'providers/meal_provider.dart';
import 'screen/meal_details_screen.dart';
import 'screen/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  Widget homePage =
      prefs.getBool('watched') ?? false ? const HomePage() : const OnBoardingScreen();
      print(prefs.getBool('watched'));

  runApp(
    ChangeNotifierProvider<MealProvider>(
      create: (context) => MealProvider(),
      child: MyApp(homePage : homePage),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.homePage});

  final Widget? homePage;

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
        '/': (context) => homePage!,
        HomePage.routeName: (context) => const HomePage(),
        CategoryScreen.routeName: (context) => const CategoryScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FilterScreen.routeName: (context) => const FilterScreen(),
      },
    );
  }
}
