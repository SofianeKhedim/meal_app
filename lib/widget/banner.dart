import 'package:flutter/material.dart';
import 'package:meal_app/theme/theme.dart';

class KBanner extends StatelessWidget {
  const KBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 361,
        height: 129,
        decoration: BoxDecoration(
          borderRadius: kborderRadius,
          color: kPrimaryClr,
           boxShadow: [
          BoxShadow(
              color: kPrimaryClr.withOpacity(0.4),
              offset: const Offset(0, 1),
              blurRadius: 8,
              spreadRadius: 2),
        ],
        ),
        
        // child: const Image(image: AssetImage('assets/images/bannerred.png'),fit: BoxFit.cover,),
        child: const Image(image: AssetImage('assets/images/bannerImg.png')),
      ),
    );
  }
}
