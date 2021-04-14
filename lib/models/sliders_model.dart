// To parse this JSON data, do
//
//     final slidersModel = slidersModelFromJson(jsonString);

import 'dart:convert';

List<SlidersModel> slidersModelFromJson(String str) => List<SlidersModel>.from(
    json.decode(str).map((x) => SlidersModel.fromJson(x)));

String slidersModelToJson(List<SlidersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SlidersModel {
  SlidersModel({
    this.id,
    this.speed,
    this.autoplay,
    this.autoplaySpeed,
    this.fade,
    this.dots,
    this.arrows,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.translations,
    this.slides,
  });

  int id;
  dynamic speed;
  int autoplay;
  int autoplaySpeed;
  int fade;
  int dots;
  int arrows;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  List<SlidersModelTranslation> translations;
  List<Slide> slides;

  factory SlidersModel.fromJson(Map<String, dynamic> json) => SlidersModel(
        id: json["id"],
        speed: json["speed"],
        autoplay: json["autoplay"],
        autoplaySpeed: json["autoplay_speed"],
        fade: json["fade"],
        dots: json["dots"],
        arrows: json["arrows"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        translations: List<SlidersModelTranslation>.from(json["translations"]
            .map((x) => SlidersModelTranslation.fromJson(x))),
        slides: List<Slide>.from(json["slides"].map((x) => Slide.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "speed": speed,
        "autoplay": autoplay,
        "autoplay_speed": autoplaySpeed,
        "fade": fade,
        "dots": dots,
        "arrows": arrows,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
        "slides": List<dynamic>.from(slides.map((x) => x.toJson())),
      };
}

class Slide {
  Slide({
    this.id,
    this.sliderId,
    this.options,
    this.callToActionUrl,
    this.openInNewWindow,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.fileId,
    this.caption1,
    this.caption2,
    this.direction,
    this.callToActionText,
    this.translations,
    this.file,
  });

  int id;
  int sliderId;
  Options options;
  String callToActionUrl;
  bool openInNewWindow;
  int position;
  DateTime createdAt;
  DateTime updatedAt;
  int fileId;
  String caption1;
  String caption2;
  String direction;
  String callToActionText;
  List<SlideTranslation> translations;
  FileClass file;

  factory Slide.fromJson(Map<String, dynamic> json) => Slide(
        id: json["id"],
        sliderId: json["slider_id"],
        options: Options.fromJson(json["options"]),
        callToActionUrl: json["call_to_action_url"],
        openInNewWindow: json["open_in_new_window"],
        position: json["position"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        fileId: json["file_id"],
        caption1: json["caption_1"],
        caption2: json["caption_2"],
        direction: json["direction"],
        callToActionText: json["call_to_action_text"],
        translations: List<SlideTranslation>.from(
            json["translations"].map((x) => SlideTranslation.fromJson(x))),
        file: FileClass.fromJson(json["file"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slider_id": sliderId,
        "options": options.toJson(),
        "call_to_action_url": callToActionUrl,
        "open_in_new_window": openInNewWindow,
        "position": position,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "file_id": fileId,
        "caption_1": caption1,
        "caption_2": caption2,
        "direction": direction,
        "call_to_action_text": callToActionText,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
        "file": file.toJson(),
      };
}

class FileClass {
  FileClass({
    this.id,
    this.filename,
    this.path,
  });

  int id;
  String filename;
  String path;

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
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

class Options {
  Options({
    this.caption1,
    this.caption2,
    this.callToAction,
  });

  CallToAction caption1;
  CallToAction caption2;
  CallToAction callToAction;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        caption1: CallToAction.fromJson(json["caption_1"]),
        caption2: CallToAction.fromJson(json["caption_2"]),
        callToAction: CallToAction.fromJson(json["call_to_action"]),
      );

  Map<String, dynamic> toJson() => {
        "caption_1": caption1.toJson(),
        "caption_2": caption2.toJson(),
        "call_to_action": callToAction.toJson(),
      };
}

class CallToAction {
  CallToAction({
    this.delay,
    this.effect,
  });

  dynamic delay;
  String effect;

  factory CallToAction.fromJson(Map<String, dynamic> json) => CallToAction(
        delay: json["delay"],
        effect: json["effect"],
      );

  Map<String, dynamic> toJson() => {
        "delay": delay,
        "effect": effect,
      };
}

class SlideTranslation {
  SlideTranslation({
    this.id,
    this.sliderSlideId,
    this.locale,
    this.fileId,
    this.caption1,
    this.caption2,
    this.callToActionText,
    this.direction,
  });

  int id;
  int sliderSlideId;
  String locale;
  int fileId;
  String caption1;
  String caption2;
  String callToActionText;
  String direction;

  factory SlideTranslation.fromJson(Map<String, dynamic> json) =>
      SlideTranslation(
        id: json["id"],
        sliderSlideId: json["slider_slide_id"],
        locale: json["locale"],
        fileId: json["file_id"],
        caption1: json["caption_1"],
        caption2: json["caption_2"],
        callToActionText: json["call_to_action_text"],
        direction: json["direction"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slider_slide_id": sliderSlideId,
        "locale": locale,
        "file_id": fileId,
        "caption_1": caption1,
        "caption_2": caption2,
        "call_to_action_text": callToActionText,
        "direction": direction,
      };
}

class SlidersModelTranslation {
  SlidersModelTranslation({
    this.id,
    this.sliderId,
    this.locale,
    this.name,
  });

  int id;
  int sliderId;
  String locale;
  String name;

  factory SlidersModelTranslation.fromJson(Map<String, dynamic> json) =>
      SlidersModelTranslation(
        id: json["id"],
        sliderId: json["slider_id"],
        locale: json["locale"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slider_id": sliderId,
        "locale": locale,
        "name": name,
      };
}
