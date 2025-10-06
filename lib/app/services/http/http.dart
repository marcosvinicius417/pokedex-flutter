import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/interfaces/http_interface.dart';
import 'http_error_messages.dart';
import 'http_interceptor.dart';

class Http implements HttpInterface {
  late final Dio dio;
  Http({required this.dio}) {
    dio.interceptors.add(HttpInterceptor(dio: dio));
  }

  @override
  Future get(
    String endpoint, {
    required Map<String, dynamic> queryParameters,
    Options? options,
  }) async {
    try {
      return await dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      dioErrorTreatment(e);
      Map response;
      if (options == null) {
        response = json.decode(e.response.toString());
      } else {
        final item = utf8.decode(e.response?.data);
        response = json.decode(item);
      }
      throw (response);
    }
  }

  void dioErrorTreatment(DioException e) {
    if (e.error is SocketException) {
      throw (HttpErrorMessages.connectionError);
    }
    if (e.type == DioExceptionType.badResponse && e.response?.data is String) {
      throw (HttpErrorMessages.defaultError);
    }
  }

  @override
  Future post(String endpoint, {required Map<String, dynamic> data}) async {
    try {
      return await dio.post(endpoint, data: data);
    } on DioException catch (e) {
      dioErrorTreatment(e);
      final Map response = json.decode(e.response.toString());
      throw (response);
    }
  }

  @override
  Future put(String endpoint, {required Map<String, dynamic> data}) async {
    try {
      return await dio.put(endpoint, data: data);
    } on DioException catch (e) {
      dioErrorTreatment(e);
      final Map response = json.decode(e.response.toString());
      throw (response);
    }
  }

  @override
  Future delete(String endpoint, {required Map<String, dynamic> data}) async {
    try {
      return await dio.delete(endpoint, data: data);
    } on DioException catch (e) {
      if (e.response == null) {
        throw (HttpErrorMessages.defaultError);
      }
      final Map response = json.decode(e.response.toString());
      throw (response);
    }
  }
}
