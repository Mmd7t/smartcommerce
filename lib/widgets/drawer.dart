import 'package:flutter/material.dart';
import 'package:smartcommerce/pages/main_page.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).accentColor,
                    Theme.of(context).primaryColor,
                  ], begin: Alignment.centerRight, end: Alignment.centerLeft),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(60))),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(60))),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor,
                ),
                accountName: Text('', style: TextStyle(color: Colors.black)),
                accountEmail: Text('', style: TextStyle(color: Colors.black)),
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text("الرئيسية"),
              leading: Icon(
                Icons.home_outlined,
                color: Theme.of(context).accentColor,
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text("المفضلة"),
              leading: Icon(
                Icons.favorite_border,
                color: Theme.of(context).accentColor,
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text("العروض"),
              leading: Icon(
                Icons.tag,
                color: Theme.of(context).accentColor,
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text("الفئات"),
              leading: Icon(
                Icons.category_outlined,
                color: Theme.of(context).accentColor,
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text("أنا"),
              leading: Icon(
                Icons.person_outline,
                color: Theme.of(context).accentColor,
              ),
            ),
            ListTile(
              onTap: () {},
              // Navigator.of(context).pushNamed(PotassiumFood.routeName),
              title: const Text("المزيد"),
              leading: Icon(
                Icons.add,
                color: Theme.of(context).accentColor,
              ),
            ),
            ListTile(
              onTap: () {},
              // Navigator.of(context).pushNamed(AllowedFood.routeName),
              title: const Text("اتصل بنا"),
              leading: Icon(
                Icons.call_outlined,
                color: Theme.of(context).accentColor,
              ),
            ),
            ListTile(
              onTap: () {},
              // Navigator.of(context).pushNamed(ForbiddenFood.routeName),
              title: const Text("الاسئلة الشائعة"),
              leading: Icon(
                Icons.chat_outlined,
                color: Theme.of(context).accentColor,
              ),
            ),
            ListTile(
              onTap: () {},
              // Navigator.of(context).pushNamed(ForbiddenFood.routeName),
              title: const Text("سياسة الخصوصية"),
              leading: Icon(
                Icons.privacy_tip_outlined,
                color: Theme.of(context).accentColor,
              ),
            ),
            Divider(
              height: 10,
              color: Theme.of(context).primaryColor,
              endIndent: 30,
              indent: 30,
            ),
            ListTile(
              onTap: () {
                // context.read<AuthProvider>().signOut();
              },
              title: const Text("تسجيل الخروج"),
              leading: Icon(
                Icons.exit_to_app_outlined,
                color: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
