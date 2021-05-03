import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';

class ReviewsPart extends GetView<ProductsController> {
  final AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return (controller.reviewsProduct.value == null)
        ? Center(
            child: Text(
            'Be the first one to review this product',
            style: Theme.of(context).textTheme.headline5.copyWith(
                color: Color(appController.accentColor.value),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ))
        : Column(
            children: [
              Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Color(appController.accentColor.value)
                          .withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    onPressed: () {},
                    label: Text('Type your Review'.tr),
                    icon: const Icon(Icons.edit),
                  ),
                ),
              ),
              Divider(
                height: 10,
                endIndent: 50,
                indent: 50,
                color: Color(appController.primaryColor.value),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.reviewsProduct.value.data.length,
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
                                backgroundColor:
                                    Color(appController.primaryColor.value)),
                            title: const Text("Reviewer Name"),
                          ),
                          Divider(
                            color: Color(appController.accentColor.value),
                            height: 10,
                            endIndent: 20,
                            indent: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                              textAlign: TextAlign.justify,
                              style: TextStyle(height: 1.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
  }
}
