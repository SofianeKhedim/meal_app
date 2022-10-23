import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:meal_app/screen/home_screen.dart';
import 'package:meal_app/theme/theme.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  static const routeName = '/filters';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // 'gluten': false,
  //   'lactose': false,
  //   'vegan': false,
  //   'vegetarian': false,
  // bool _glutenFree = false ;
  // bool _lactoseFree = false;
  // bool _vegan = false;
  // bool _vegetarian = false;

  SwitchListTile buildSwitchListTile(String title, String subtitle,
      bool currentValue, void Function(bool)? updateValue) {
    return SwitchListTile.adaptive(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> filters =
        Provider.of<MealProvider>(context, listen: true).filters;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: ((context, animation, secondaryAnimation) =>
                        const HomePage())));
          },
        ),
        title: const Text(
          'Filters',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        backgroundColor: kPrimaryClr,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Adjust your meal selection',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          buildSwitchListTile('Gluten-free', 'Only include gluten-free meals.',
              filters['gluten']!, (newVal) {
            setState(() {
              filters['gluten'] = newVal;
            });

            Provider.of<MealProvider>(context, listen: false).setFilters();
          }),
          buildSwitchListTile(
              'Lactose-free',
              'Only include lactose-free meals.',
              filters['lactose']!, (newVal) {
            setState(() {
              filters['lactose'] = newVal;
            });
            Provider.of<MealProvider>(context, listen: false).setFilters();
          }),
          buildSwitchListTile(
              'Vegan', 'Only include vegan meals.', filters['vegan']!,
              (newVal) {
            setState(() {
              filters['vegan'] = newVal;
            });
            Provider.of<MealProvider>(context, listen: false).setFilters();
          }),
          buildSwitchListTile('Vegetarian', 'Only include vegetarian meals.',
              filters['vegetarian']!, (newVal) {
            setState(() {
              filters['vegan'] = newVal;
            });
            Provider.of<MealProvider>(context, listen: false).setFilters();
          })
        ],
      ),
    );
  }
}