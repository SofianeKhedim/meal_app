import 'package:flutter/material.dart';
import 'package:meal_app/screen/home_screen.dart';
import 'package:meal_app/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/categoryIndicator.dart';
import '../widget/pageviewIndicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;
  int _pageViewIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          PageView.builder(
              controller: pageController,
              onPageChanged: ((value) {
                setState(() {
                  _pageViewIndex = value;
                });
              }),
              // controller: PageController(viewportFraction: 1),
              itemCount: 3,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return buildPage(
                    text: 'Meal App!',
                    imageAssets: 'assets/onboarding/on_bor2.png',
                    description:
                        'mobile application that provides you with various cooking recipes',
                  );
                }
                if (index == 1) {
                  return buildPage(
                    text: 'Delicious foods',
                    imageAssets: 'assets/onboarding/on_bor3.png',
                    description: 'let us help you discover the best food',
                  );
                } else {
                  return buildPage(
                    text: 'Meal App!',
                    imageAssets: 'assets/onboarding/on_bor3.png',
                    description:
                        'mobile application that provides you with various cooking recipes',
                  );
                }
              }),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      3,
                      (index) => PageViewIndicator(
                          active: _pageViewIndex == index ? true : false))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  if (_pageViewIndex != 2) {
                    pageController.animateToPage(++_pageViewIndex,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  } else {
                    Navigator.pushReplacementNamed(context, HomePage.routeName);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: kPrimaryClr),
                  child: Center(
                      child: Text(
                    _pageViewIndex != 2 ? 'Next' : 'Get Start',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('watched', true);
                  Navigator.pushReplacementNamed(context, HomePage.routeName);
                },
                child: Text(
                  _pageViewIndex != 2 ? 'Skip' : '',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ]),
      ),
    );
  }

  Column buildPage(
      {required String text,
      required String imageAssets,
      required String description}) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  left: BorderSide(color: Colors.white, width: 10),
                  right: BorderSide(color: Colors.white, width: 10))),
          height: 370,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            child: Image.asset(
              imageAssets,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          text,
          style: const TextStyle(
              color: kGreyClr, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: kGreyClr, fontSize: 16, fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}
