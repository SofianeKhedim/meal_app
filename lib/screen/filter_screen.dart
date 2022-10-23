import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:meal_app/theme/theme.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen(this.filters,this.saveFilters, {super.key});

  static const routeName = 'filter';

  final saveFilters;
  final filters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // 'gluten': false,
  //   'lactose': false,
  //   'vegan': false,
  //   'vegetarian': false,
  bool _glutenFree = false ;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
   _glutenFree = widget.filters['gluten'] ;
   _lactoseFree = widget.filters['lactose'];
   _vegan = widget.filters['vegan'];
   _vegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  

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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };

              widget.saveFilters(selectedFilters);
            },
          )
        ],
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/');
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
          buildSwitchListTile(
              'Gluten-free', 'Only include gluten-free meals.', _glutenFree,
              (newVal) {
            setState(() {
              _glutenFree = newVal;
            });
          }),
          buildSwitchListTile(
              'Lactose-free', 'Only include lactose-free meals.', _lactoseFree,
              (newVal) {
            setState(() {
              _lactoseFree = newVal;
            });
          }),
          buildSwitchListTile('Vegan', 'Only include vegan meals.', _vegan,
              (newVal) {
            setState(() {
              _vegan = newVal;
            });
          }),
          buildSwitchListTile(
              'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
              (newVal) {
            setState(() {
              _vegetarian = newVal;
            });
          })
        ],
      ),
    );
  }
}
