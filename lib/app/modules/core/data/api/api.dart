import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class ApiRequest {
  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> post(String url, dynamic data);
  Future<dynamic> put(String url, dynamic data);
  Future<dynamic> delete(String url);
}

class ApiRequestImpl implements ApiRequest {
  ApiRequestImpl({this.options}) {
    if (options != null) dio.options = options!;
  }

  final dio = Modular.get<Dio>();
  final BaseOptions? options;

  @override
  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get<dynamic>(
        url,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<dynamic> post(String url, dynamic data) async {
    try {
      final response = await dio.post<dynamic>(url, data: data);
      return response.data;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<dynamic> put(String url, dynamic data) async {
    try {
      final response = await dio.put<dynamic>(url, data: data);
      return response.data;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<dynamic> delete(String url) async {
    try {
      final response = await dio.delete<dynamic>(url);
      return response.data;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
