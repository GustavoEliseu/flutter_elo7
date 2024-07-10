import 'package:dio/dio.dart';

class MyCustomInterceptor extends Interceptor {
  final Dio dio;

  MyCustomInterceptor({
    required this.dio,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 304) {
      return handler.reject(err);
    }
    return handler.reject(DioException(
      requestOptions: err.requestOptions,
      error: err.response,
    ));
  }
}
