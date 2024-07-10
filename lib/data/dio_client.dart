import 'package:dio/dio.dart';
import 'package:flutter_elo7/data/interceptor/my_interceptor.dart';

class DioClient {
  final Dio dio = Dio();

  DioClient() {
    addInterceptor(LogInterceptor());
  }

  void addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(MyCustomInterceptor(dio: dio));
    dio.interceptors.add(interceptor);
  }
}
