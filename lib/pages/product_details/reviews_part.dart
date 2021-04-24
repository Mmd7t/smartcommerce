import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/products_controller.dart';

class ReviewsPart extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return (controller.productDetails.value.reviews == null)
        ? const Text('Be the first one to review this product')
        : ListView.builder(
            itemCount: controller.productDetails.value.reviewsCount,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor),
                        title: const Text("Reviewer Name"),
                      ),
                      Divider(
                        color: Theme.of(context).accentColor,
                        height: 10,
                        endIndent: 20,
                        indent: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                          textAlign: TextAlign.justify,
                          style: TextStyle(height: 1.3),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
