import 'package:dio/dio.dart';
import 'package:flutter_elo7/data/interceptor/my_interceptor.dart';

class DioClient {
  static const String _baseUrl = "https://img.elo7.com.br/mock-vagas.json";

  final Dio dio = Dio(
    BaseOptions(baseUrl: _baseUrl),
  );

  DioClient() {
    addInterceptor(LogInterceptor());
  }

  void addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(MyCustomInterceptor(dio: dio));
    dio.interceptors.add(interceptor);
  }
}
