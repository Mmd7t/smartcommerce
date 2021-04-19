import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/search_controller.dart';
import 'package:smartcommerce/widgets/empty/empty_product_details.dart';
import 'package:smartcommerce/widgets/product_card/grid_card.dart';
import 'package:smartcommerce/widgets/progress.dart';

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
      ),
      color: Theme.of(context).accentColor,
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query == null || query == "") {
      showSuggestions(context);
      return Container();
    } else {
      return FutureBuilder(
        future: Get.put(SearchController()).searchForString(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ResultContent();
          } else {
            return Center(
              child: circularDefaultProgress(context),
            );
          }
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return GetX(
      init: SearchController(),
      builder: (SearchController app) => ListView.builder(
          itemCount: app.searchHistory.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                query = app.searchHistory[index];
              },
              leading: Icon(
                Icons.history,
                color: Theme.of(context).accentColor,
              ),
              title: Text(app.searchHistory[index]),
            );
          }),
    );
  }
}

class ResultContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: SearchController(),
      builder: (SearchController app) {
        return app.searchData != null &&
                app.searchData.value.products.isNotEmpty
            ? GridView.builder(
                shrinkWrap: true,
                itemCount: app.searchData.value.products.length,
                itemBuilder: (context, index) =>
                    ProductGridItem(app.searchData.value.products[index]),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 3 / 5,
                  maxCrossAxisExtent: 300,
                ),
              )
            : EmptyProductDetails(
                text: "no products here".tr,
              );
      },
    );
  }
}
