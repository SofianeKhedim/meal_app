import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:meal_app/screen/search_screen.dart';
import 'package:meal_app/widget/drawer.dart';

import '../theme/theme.dart';

class IconBox extends StatelessWidget {
  const IconBox({super.key, required this.icon, this.isSearch = false});
  final IconData icon;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (icon == FeatherIcons.search && !isSearch) {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const SearchScreen(),
              ));
        }
        if (icon == CupertinoIcons.back){
          Navigator.of(context).pop();
        }
        if(isSearch){
          FocusScope.of(context).unfocus();
        }
        if(icon == FeatherIcons.menu ){
         Scaffold.of(context).openDrawer();
        }
      },
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: kborderRadius,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.09),
                offset: const Offset(0, 1),
                blurRadius: 8,
                spreadRadius: 0),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: kPrimaryClr,
          ),
        ),
      ),
    );
  }
}
