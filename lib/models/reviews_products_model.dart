import 'dart:convert';

ReviewsProductsModel reviewsModelFromJson(String str) =>
    ReviewsProductsModel.fromJson(json.decode(str));

String reviewsModelToJson(ReviewsProductsModel data) =>
    json.encode(data.toJson());

class ReviewsProductsModel {
  ReviewsProductsModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory ReviewsProductsModel.fromJson(Map<String, dynamic> json) =>
      ReviewsProductsModel(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.reviewerId,
    this.productId,
    this.rating,
    this.reviewerName,
    this.comment,
    this.isApproved,
    this.createdAt,
    this.updatedAt,
    this.ratingPercent,
    this.createdAtFormatted,
  });

  int id;
  int reviewerId;
  int productId;
  int rating;
  String reviewerName;
  String comment;
  bool isApproved;
  DateTime createdAt;
  DateTime updatedAt;
  int ratingPercent;
  String createdAtFormatted;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        reviewerId: json["reviewer_id"],
        productId: json["product_id"],
        rating: json["rating"],
        reviewerName: json["reviewer_name"],
        comment: json["comment"],
        isApproved: json["is_approved"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        ratingPercent: json["rating_percent"],
        createdAtFormatted: json["created_at_formatted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reviewer_id": reviewerId,
        "product_id": productId,
        "rating": rating,
        "reviewer_name": reviewerName,
        "comment": comment,
        "is_approved": isApproved,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "rating_percent": ratingPercent,
        "created_at_formatted": createdAtFormatted,
      };
}
