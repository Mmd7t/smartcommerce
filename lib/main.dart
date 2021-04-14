import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/utils/app_routes.dart';

import 'pages/main_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Commerce',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: appRoutes(context),
      initialRoute: MainPage.routeName,
    );
  }
}
