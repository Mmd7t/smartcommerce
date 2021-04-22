import 'package:flutter/material.dart';
import 'package:smartcommerce/widgets/drawer.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';
import 'package:smartcommerce/widgets/rounded_bottom_sheet.dart';

import 'FlashSale_Page/FlashSalePage.dart';
import 'categories/categories_page.dart';
import 'home/home.dart';
import 'profile/profile.dart';

class MainPage extends StatefulWidget {
  static const String routeName = 'mainPage';
  final int initial;
  @override
  _MainPageState createState() => _MainPageState();

  MainPage({this.initial = 0});
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    Home(),
    ProfilePage(),
    CategoriesPage(),
    FlashSalePage(),
    Container(),
  ];

  int pageIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageIndex = widget.initial;
    pageController = PageController(initialPage: widget.initial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(),
      drawer: MyDrawer(),
      body: PageView(
        controller: pageController,
        onPageChanged: (int index) => setState(() => pageIndex = index),
        physics: NeverScrollableScrollPhysics(),
        children: pages,
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BottomNavigationBar(
            elevation: 3,
            currentIndex: pageIndex,
            onTap: (value) {
              if (value != 4) {
                pageController.jumpToPage(value);
              } else {
                roundedBorderBottomSheet(context);
              }
            },
            selectedItemColor: Theme.of(context).primaryColor,
            selectedIconTheme:
                IconThemeData(color: Theme.of(context).accentColor),
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedItemColor: Colors.grey.shade600,
            items: const [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.person), label: 'me'),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.tag), label: 'offers'),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.add), label: 'More'),
            ],
          ),
        ),
      ),
    );
  }
}
