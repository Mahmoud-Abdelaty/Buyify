import 'package:Buyify/core/network/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkHelper {
  late final Dio _dio;

  NetworkHelper._() : _dio = _configureDio();

  static final NetworkHelper instance = NetworkHelper._();

  factory NetworkHelper() => instance;

  static Dio _configureDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
      ),
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ));
    }
    return dio;
  }

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? params,
    bool withToken = true,
  }) async {
    var response = await _dio.get(endPoint,
        queryParameters: params, options: await _configureOptions(withToken));
    return response;
  }

  Future<Response> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? params,
    bool withToken = true,
  }) async {
    var response = await _dio.post(endPoint,
        data: data,
        queryParameters: params,
        options: await _configureOptions(withToken));
    return response;
  }

  Future<Response> put({
    required String endPoint,
    dynamic data,
    bool withToken = true,
  }) async {
    var response = await _dio.put(endPoint,
        data: data, options: await _configureOptions(withToken));
    return response;
  }

  Future<Response> delete({
    required String endPoint,
    bool withToken = true,
  }) async {
    var response = await _dio.delete(endPoint,
        options: await _configureOptions(withToken));
    return response;
  }

  Future<Options> _configureOptions(bool withToken) async {
    Options options = Options();
    if (withToken) {
      // var token = SharedHelper.instance?.readString(CachingKey.TOKEN);
      var token =
          'g4Qjd5ypSOKTXby8BupeTGdK7pkkutQbGIqVehKICyxZ3DJclq18zGn0AhfoPmZRIWv7Qj';
      options.headers = {
        'Authorization': '$token',
        'Content-Type': 'application/json',
        'lang': 'en',
      };
    }
    return options;
  }
}
