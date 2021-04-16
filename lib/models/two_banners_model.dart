class TwoBannersModel {
  TwoBannersModel({this.banner1, this.banner2});

  Banner banner1;
  Banner banner2;

  factory TwoBannersModel.fromJson(Map<String, dynamic> json) =>
      TwoBannersModel(
        banner1: Banner.fromJson(json["banner_1"]),
        banner2: Banner.fromJson(json["banner_2"]),
      );

  Map<String, dynamic> toJson() => {
        "banner_1": banner1.toJson(),
        "banner_2": banner2.toJson(),
      };
}

class Banner {
  Banner({this.image, this.callToActionUrl, this.openInNewWindow});

  Image image;
  dynamic callToActionUrl;
  bool openInNewWindow;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        image: (json["image"] != null) ? Image.fromJson(json["image"]) : null,
        callToActionUrl: json["call_to_action_url"],
        openInNewWindow: json["open_in_new_window"],
      );

  Map<String, dynamic> toJson() => {
        "image": image.toJson(),
        "call_to_action_url": callToActionUrl,
        "open_in_new_window": openInNewWindow,
      };
}

class Image {
  Image({this.id, this.filename, this.path});

  int id;
  String filename;
  String path;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        filename: json["filename"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "filename": filename,
        "path": path,
      };
}
