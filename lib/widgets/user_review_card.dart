import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smartcommerce/models/review.dart';

import 'custom_rating_bar.dart';
import 'custom_timeago.dart';

class UserReviewCard extends StatelessWidget {
  final Review review;
  UserReviewCard({@required this.review});
  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(),
        padding: EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            //TODO: get product by id
            // Provider.of<ProductProvider>(context, listen: false)
            //     .fetchSingleProduct(review.productId);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => SingleProductsPage(
            //       shortProduct: ShortProduct(id: review.productId),
            //     ),
            //   ),
            // );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    key: UniqueKey(),
                    radius: 20,
                    backgroundColor: Color.fromRGBO(random.nextInt(255),
                        random.nextInt(255), random.nextInt(255), 1),
                    child: Center(
                      child: Text(
                          review.reviewerName.substring(0, 1).toUpperCase()),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            review.reviewerName,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          // Spacer(),
                          // Text(
                          //   DateFormat('yyyy-MM-dd – kk:mm').format(review.date),
                          //   style: Theme.of(context).textTheme.caption,
                          // ),
                          customTimeAgo(
                              dateTime: review.date, context: context),
                        ],
                      ),
                      customRatingBar(value: review.rating, itemSize: 13),
                    ],
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(left: 45),
                  child: Text(
                    review.review,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Theme.of(context).textTheme.caption.color),
                    overflow: TextOverflow.clip,
                  )),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
