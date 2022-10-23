import 'package:flutter/material.dart';
import '/screen/filter_screen.dart';
import 'package:meal_app/theme/theme.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ListTile buildListTile(String title, IconData icon) {
      return ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          if (title == 'Meal') {
            Navigator.of(context).pushNamed('/');
          }
          if (title == 'Filters') {
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          }
        },
      );
    }

    return Drawer(
      child: Column(children: [
        Container(
          color: kPrimaryClr,
          height: 60,
        ),
        Container(
          height: 80,
          width: double.infinity,
          color: kPrimaryClr,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Cooking Up!',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile('Meal', Icons.restaurant),
        buildListTile('Filters', Icons.settings)
      ]),
    );
  }
}
