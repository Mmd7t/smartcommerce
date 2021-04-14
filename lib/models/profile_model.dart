class ProfileModel {
  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.birthday,
    this.savedCoupons,
    this.lastLogin,
    this.reviewsCount,
    this.wishlist,
  });

  int id;
  String firstName;
  String lastName;
  String email;
  dynamic gender;
  dynamic birthday;
  int savedCoupons;
  dynamic lastLogin;
  int reviewsCount;
  List<dynamic> wishlist;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        gender: json["gender"],
        birthday: json["birthday"],
        savedCoupons: json["saved_coupons"],
        lastLogin: json["last_login"],
        reviewsCount: json["reviews_count"],
        wishlist: List<dynamic>.from(json["wishlist"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "gender": gender,
        "birthday": birthday,
        "saved_coupons": savedCoupons,
        "last_login": lastLogin,
        "reviews_count": reviewsCount,
        "wishlist": List<dynamic>.from(wishlist.map((x) => x)),
      };
}
