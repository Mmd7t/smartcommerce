import 'package:flutter/material.dart';

import 'categories/categories_page.dart';
import 'home/home.dart';
import 'profile.dart';

class MainPage extends StatefulWidget {
  static const String routeName = 'mainPage';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  final List<Widget> pages = [
    Home(),
    ProfilePage(),
    CategoriesPage(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          if (value != 4) {
            setState(() {
              currentPage++;
            });
          } else {
            _roundedBorderBottomSheet(context);
          }
        },
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey.shade700,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'me'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.tag), label: 'offers'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'More'),
        ],
      ),
    );
  }

  _roundedBorderBottomSheet(context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: RadialGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ],
                    radius: 2,
                  ),
                ),
                child: Text(
                  "المزيد",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline6.fontSize,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: Text('خدمة العملاء'),
                subtitle: Text('خدمة متاحة 24 ساعة'),
                leading: Image.asset(
                  'assets/delivery.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
              ListTile(
                title: Text('دفع اونلاين'),
                subtitle: Text('سرعة الدفع'),
                leading: Image.asset(
                  'assets/delivery.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
              ListTile(
                title: Text('الجودة و الدقة'),
                subtitle: Text('جودة و دقة لا مثيل لها'),
                leading: Image.asset(
                  'assets/delivery.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
              ListTile(
                title: Text('شحن سريع'),
                subtitle: Text('شحن سريع و توصيل ممتاز'),
                leading: Image.asset(
                  'assets/delivery.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
