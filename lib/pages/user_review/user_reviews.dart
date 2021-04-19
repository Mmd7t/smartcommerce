import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartcommerce/controllers/auth_controller.dart';
import 'package:smartcommerce/widgets/empty/empty_product_details.dart';
import 'package:smartcommerce/widgets/global_appbar.dart';
import 'package:smartcommerce/widgets/progress.dart';
import 'package:smartcommerce/widgets/user_review_card.dart';

class UserReviews extends StatefulWidget {
  static String routeName = "/userReviews";

  @override
  _UserReviewsState createState() => _UserReviewsState();
}

class _UserReviewsState extends State<UserReviews> {
  @override
  void initState() {
    Get.put(AuthController()).getUserReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: AuthController(),
      builder: (AuthController controller) => Scaffold(
        appBar: GlobalAppBar(title: "user reviews".tr,),
        body: controller.loadingReviews.value
            ? Center(
                child: circularDefaultProgress(context),
              )
            : ListView(
                shrinkWrap: true,
                children: [
                  (controller.reviews.length > 0)
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.reviews.length,
                          itemBuilder: (context, index) => UserReviewCard(
                            review: controller.reviews[index],
                          ),
                        )
                      : EmptyProductDetails(
                          text: "noUserReviews".tr,
                          height: MediaQuery.of(context).size.height -
                              kToolbarHeight,
                        ),
                ],
              ),
      ),
    );
  }
}
