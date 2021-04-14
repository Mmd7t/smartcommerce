import 'package:flutter/material.dart';
import 'package:smartcommerce/translations/translations_keys.dart';
import 'package:smartcommerce/utils/constants.dart';
import 'package:smartcommerce/widgets/indicators.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatefulWidget {
  static const String routeName = 'onboardingPage';
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  static const titles = [
    TranslationsKeys.onboardingText1,
    TranslationsKeys.onboardingText2,
    TranslationsKeys.onboardingText3,
    TranslationsKeys.onboardingText4,
    TranslationsKeys.onboardingText5,
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/intro.png',
              fit: BoxFit.cover, height: size.height),
          PageView.builder(
            controller: pageController,
            onPageChanged: (value) => setState(() => currentIndex = value),
            itemCount: 5,
            itemBuilder: (context, index) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    Constants.onboardingImages[index],
                    width: size.width * 0.75,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      titles[index].tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            Theme.of(context).textTheme.headline6.fontSize,
                        fontWeight: FontWeight.w900,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    shape: StadiumBorder(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: (currentIndex != 4)
                        ? Text('التالى')
                        : Text('دخول النسخة التجريبية'),
                    onPressed: () {
                      if (currentIndex != 4) {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      } else {}
                    },
                  ),
                  Indicators(length: 5, cindex: currentIndex),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
