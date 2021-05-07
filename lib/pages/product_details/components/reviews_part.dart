import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/app_controller.dart';
import 'package:smartcommerce/controllers/products_controller.dart';

class ReviewsPart extends StatefulWidget {
  final int id;
  ReviewsPart(this.id);

  @override
  _ReviewsPartState createState() => _ReviewsPartState();
}

class _ReviewsPartState extends State<ReviewsPart> {
  final AppController appController = Get.find<AppController>();

  final ProductsController controller = Get.find<ProductsController>();
  String comment;
  double rate;
  @override
  Widget build(BuildContext context) {
    return (controller.reviewsOnProduct.value == null)
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
                          .withOpacity(0.85),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    onPressed: () {
                      showReviewDialog(context, widget.id, rate, comment);
                    },
                    label: Text('rate this product'.tr),
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
              if (controller.reviewsOnProduct.value.data != null)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.reviewsOnProduct.value.data.length,
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
                                    Color(appController.primaryColor.value),
                                child: const Icon(Icons.person,
                                    color: Colors.grey),
                              ),
                              title: Text(controller.reviewsOnProduct.value
                                  .data[index].reviewerName),
                              subtitle: Text(
                                controller
                                    .reviewsOnProduct.value.data[index].comment,
                                textAlign: TextAlign.justify,
                                style: TextStyle(height: 1.3),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.star, color: Colors.amber),
                                  const SizedBox(width: 3),
                                  Text(controller
                                      .reviewsOnProduct.value.data[index].rating
                                      .toString()),
                                ],
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

  showReviewDialog(
      BuildContext context, int id, double ratee, String commentt) {
    final formKey = GlobalKey<FormState>();
    TextEditingController tcontroller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'rate this product'.tr,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 18),
              Center(
                child: RatingBar.builder(
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      ratee = rating;
                    });
                    print(ratee);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: formKey,
                child: TextFormField(
                  controller: tcontroller,
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: 'type your comment'.tr,
                    fillColor: Color(appController.primaryColor.value)
                        .withOpacity(0.15),
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'type your comment'.tr;
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      commentt = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 25),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 12),
                color: Color(appController.accentColor.value),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    controller.addReview(
                        id, ratee.toString(), tcontroller.text);
                    Navigator.of(context).pop();
                  }
                },
                child: Text(
                  'share'.tr,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
