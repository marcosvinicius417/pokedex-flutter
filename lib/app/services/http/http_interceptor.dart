import 'package:dio/dio.dart';
import '../../core/configs/env_config.dart';
import '../../core/enums/request_method_enum.dart';

class HttpInterceptor extends InterceptorsWrapper {
  final Dio dio;

  HttpInterceptor({required this.dio}) {
    dio.options.baseUrl = EnvConfig.baseUrl;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.baseUrl = EnvConfig.baseUrl;
    options.headers = _updateHeaders(options.headers);

    if (options.method == RequestMethodEnum.get.value) {
      options.queryParameters = _updateQueryParameters(options.queryParameters);
    } else {
      options.data = _updateDataParameters(options.data);
    }

    return handler.next(options);
  }

  Map<String, dynamic> _updateQueryParameters(
    Map<String, dynamic> queryParameters,
  ) {
    return queryParameters;
  }

  Map<String, dynamic> _updateDataParameters(
    Map<String, dynamic> dataParameters,
  ) {
    return dataParameters;
  }

  Map<String, dynamic> _updateHeaders(Map<String, dynamic> headers) {
    headers['Content-Type'] = 'application/json';
    headers['Access-Control-Allow-Origin'] = '*';

    return headers;
  }
}
