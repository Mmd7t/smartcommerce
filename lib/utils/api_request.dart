import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smartcommerce/utils/constants.dart';

class ApiRequest {
  final String url;
  final Map data;

  ApiRequest({
    @required this.url,
    this.data,
  });

  Dio _dio() => Dio(BaseOptions(headers: Constants.headers));

  void get({
    Function() beforeSend,
    Function(dynamic data) onSuccess,
    Function(dynamic error) onError,
  }) {
    _dio().get(this.url, queryParameters: this.data).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }
}
