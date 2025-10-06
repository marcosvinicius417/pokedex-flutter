import 'package:dio/dio.dart';

abstract class HttpInterface {
  Future get(
    String endpoint, {
    required Map<String, dynamic> queryParameters,
    Options options,
  });

  Future put(String endpoint, {required Map<String, dynamic> data});
  Future post(String endpoint, {required Map<String, dynamic> data});
  Future delete(String endpoint, {required Map<String, dynamic> data});
}
