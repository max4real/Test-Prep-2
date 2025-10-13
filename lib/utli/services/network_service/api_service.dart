// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:test_prep_2/utli/controller/data_controller.dart';

class ApiService {
  final Dio _dio;

  ApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: "https://api.themoviedb.org/3/",
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {"Content-Type": "application/json"},
          validateStatus: (status) => true,
        ),
      ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Authorization"] =
              "Bearer ${getx.Get.find<DataController>().accessToken}";
          return handler.next(options);
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            print("Unauthorized: Invalid or expired token");
          }
          return handler.next(error);
        },
      ),
    );
  }

  void validateResponse({
    required Response? response,
    required Function(Map<String, dynamic>) onSuccess,
    required Function(Map<String, dynamic>) onFailure,
  }) {
    if (response != null) {
      try {
        final statusCode = response.statusCode ?? 0;

        if (statusCode >= 200 && statusCode < 300) {
          if (response.data is Map<String, dynamic>) {
            final data = response.data as Map<String, dynamic>;

            if (data.containsKey("results")) {
              onSuccess(data);
            } else {
              onSuccess(data);
            }
          } else {
            onFailure({
              'error': 'Unexpected response format',
              'statusCode': statusCode,
            });
          }
        } else {
          final errorBody =
              (response.data is Map)
                  ? Map<String, dynamic>.from(response.data as Map)
                  : {};

          onFailure({
            'error': errorBody['status_message'] ?? 'Request failed',
            'statusCode': statusCode,
            'tmdb_code': errorBody['status_code'],
          });
        }
      } catch (e) {
        onFailure({
          'error': 'Invalid response format',
          'exception': e.toString(),
        });
      }
    } else {
      onFailure({'error': 'Empty response'});
    }
  }

  // ------------------ GET ------------------
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    return await _dio.get(
      endpoint,
      queryParameters: queryParams,
      options: options,
    );
  }

  // ------------------ POST ------------------
  Future<Response> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    return await _dio.post(
      endpoint,
      data: data,
      queryParameters: queryParams,
      options: options,
    );
  }

  // ------------------ PATCH ------------------
  Future<Response> patch(
    String endpoint, {
    dynamic data,
    Options? options,
  }) async {
    return await _dio.patch(endpoint, data: data, options: options);
  }

  // ------------------ DELETE ------------------
  Future<Response> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    return await _dio.delete(
      endpoint,
      data: data,
      queryParameters: queryParams,
      options: options,
    );
  }

  // ------------------ MULTIPART POST ------------------
  Future<Response> multipartPost(
    String endpoint, {
    required Map<String, dynamic> fields,
    required File file,
    String fileField = "file",
    Options? options,
  }) async {
    final formData = FormData.fromMap({
      ...fields,
      fileField: await MultipartFile.fromFile(
        file.path,
        filename: file.uri.pathSegments.last,
      ),
    });

    return await _dio.post(
      endpoint,
      data: formData,
      options:
          options ?? Options(headers: {"Content-Type": "multipart/form-data"}),
    );
  }
}
