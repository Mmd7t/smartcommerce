// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    _dio.interceptors
        .add(PrettyDioLogger(requestBody: true, requestHeader: true));
    baseUrl ??= 'https://market.smartcommerce.me/ar/api/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<AuthResponseModel> postLogin(data, token) async {
    ArgumentError.checkNotNull(data, 'data');
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{r'Authorization': token},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AuthResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<AuthResponseModel> postRegister(data, token) async {
    ArgumentError.checkNotNull(data, 'data');
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('register',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{r'Authorization': token},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AuthResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserProfileModel> getUserProfile(data, token) async {
    ArgumentError.checkNotNull(data, 'data');
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('profile',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{r'Authorization': token},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserProfileModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<Review>> getProfileReviews(apiToken) async {
    ArgumentError.checkNotNull(apiToken, 'apiToken');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'api_token': apiToken};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<List<dynamic>>('user/reviews',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Review.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<CategoriesModel>> getHomeCategoriesList(token) async {
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('features/categories/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': token},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => CategoriesModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<HttpResponse<dynamic>> deleteFromWishList(apiToken, productID) async {
    ArgumentError.checkNotNull(apiToken, 'apiToken');
    ArgumentError.checkNotNull(productID, 'productID');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'api_token': apiToken, 'product_id': productID};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request('wishlist/delete',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> addToUserWishList(apiToken, productID) async {
    ArgumentError.checkNotNull(apiToken, 'apiToken');
    ArgumentError.checkNotNull(productID, 'productID');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'api_token': apiToken, 'product_id': productID};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request('wishlist/store',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<List<CategoriesParentModel>> getProductMainCategoryData(token) async {
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('categories/parents',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': token},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            CategoriesParentModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<CategoriesParentModel>> getCategoryChildren(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('category/childs/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            CategoriesParentModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<SlidersModel>> getSlidersList(token) async {
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('sliders/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': token},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => SlidersModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<BrandsModel>> getBrandsList(token) async {
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('brands/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': token},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => BrandsModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<TwoBannersModel> getTwoBanners(token) async {
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('twobanners/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': token},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TwoBannersModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<FlashSaleProductsModel> getFlashSaleProducts(token) async {
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'flashsale/products/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': token},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FlashSaleProductsModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<BrandProductsModel> getBrandProducts(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'brand/$id/products',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BrandProductsModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<SearchData> searchProducts(apiToken, searchTitle) async {
    ArgumentError.checkNotNull(apiToken, 'apiToken');
    ArgumentError.checkNotNull(searchTitle, 'searchTitle');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'api_token': apiToken, 'search_title': searchTitle};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('product/search',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SearchData.fromJson(_result.data);
    return value;
  }

  @override
  Future<FeaturedCatsProductsModel> getFeaturedCatsProducts(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'category/$id/products',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FeaturedCatsProductsModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<ProductDetailsModel> getProductDetails(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('product/$id/ ',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ProductDetailsModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserOrdersModel> getUserOrders(apiToken) async {
    ArgumentError.checkNotNull(apiToken, 'apiToken');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'api_token': apiToken};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('user/orders',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserOrdersModel.fromJson(_result.data);
    return value;
  }
}
