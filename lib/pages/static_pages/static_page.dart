import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:smartcommerce/models/static_pages_model.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';

class StaticPage extends StatelessWidget {
  static const String routeName = 'privacyPolicyPage';
  @override
  Widget build(BuildContext context) {
    StaticPagesModel staticPagesModel =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: GlobalAppBar(
        title: staticPagesModel.name,
      ),
      body: SingleChildScrollView(
        child: Html(
          data: "${staticPagesModel.body}",
        ),
      ),
    );
  }
}
