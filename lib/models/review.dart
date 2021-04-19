class Review {
  int reviewId;
  int productId;
  String reviewerName;
  bool approved;
  double rating;
  DateTime date;
  String review;

  Review({this.review, this.reviewerName, this.rating, this.date});
  Review.fromJson(Map json) {
    reviewId = json["id"] ?? 0;
    productId = json["product_id"] ?? 0;
    reviewerName = json["reviewer_name"] ?? "";
    rating = json["rating"] != null ? json["rating"].toDouble() ?? 0.0 : 0.0;
    approved = json["is_approved"] ?? false;
    date = DateTime.parse(json["updated_at"]) ?? DateTime.now();
    review = json["comment"] ?? "";
  }
}
