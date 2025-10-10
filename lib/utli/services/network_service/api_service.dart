// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: "https://api.nest.shwepyaesone.com/api/v1/",
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {"Content-Type": "application/json"},
          validateStatus: (status) {
            return true;
          },
        ),
      );

  void validateResponse({
    required Response? response,
    required Function(Map<String, dynamic>) onSuccess,
    required Function(Map<String, dynamic>) onFailure,
  }) {
    if (response != null) {
      try {
        // Convert to Map<String, dynamic> safely
        final Map<String, dynamic> data = (response.data as Map).map(
          (key, value) => MapEntry(key.toString(), value),
        );

        final metadata = (data['_metadata'] ?? {}) as Map;
        final success = metadata['success'] == true;
        final statusCode = metadata['statusCode'] ?? response.statusCode;

        if (success && (statusCode == 200 || statusCode == 201)) {
          onSuccess(data);
        } else {
          onFailure({
            ...data,
            '_metadata': {
              ...metadata,
              'statusCode': statusCode,
              'success': false,
            },
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
    String? token,
    Options? options,
  }) async {
    // try {
    return await _dio.get(
      endpoint,
      queryParameters: queryParams,
      options: _withAuth(options, token),
    );
    // } on DioException catch (e) {
    //   throw Exception(_handleError(e));
    // }
  }

  // ------------------ POST ------------------
  Future<Response> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    String? token,
    Options? options,
  }) async {
    // try {
    return await _dio.post(
      endpoint,
      data: data,
      queryParameters: queryParams,
      options: _withAuth(options, token),
    );
    // } on DioException catch (e) {
    //   throw Exception(_handleError(e));
    // }
  }

  // ------------------ PATCH ------------------
  Future<Response> patch(
    String endpoint, {
    dynamic data,
    String? token,
    Options? options,
  }) async {
    // try {
    return await _dio.patch(
      endpoint,
      data: data,
      options: _withAuth(options, token),
    );
    // } on DioException catch (e) {
    //   throw Exception(_handleError(e));
    // }
  }

  // ------------------ DELETE ------------------
  Future<Response> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    String? token,
    Options? options,
  }) async {
    // try {
    return await _dio.delete(
      endpoint,
      data: data,
      queryParameters: queryParams,
      options: _withAuth(options, token),
    );
    // } on DioException catch (e) {
    //   throw Exception(_handleError(e));
    // }
  }

  // ------------------ MULTIPART POST ------------------
  Future<Response> multipartPost(
    String endpoint, {
    required Map<String, dynamic> fields,
    required File file,
    String fileField = "file",
    String? token,
    Options? options,
  }) async {
    // try {
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
      options: _withAuth(
        options ?? Options(headers: {"Content-Type": "multipart/form-data"}),
        token,
      ),
    );
    // } on DioException catch (e) {
    //   throw Exception(_handleError(e));
    // }
  }

  // ------------------ Add Authorization header if token exists ------------------
  Options _withAuth(Options? options, String? token) {
    final newHeaders = Map<String, dynamic>.from(options?.headers ?? {});
    if (token != null && token.isNotEmpty) {
      newHeaders["Authorization"] = "Bearer $token";
    }
    return options?.copyWith(headers: newHeaders) ??
        Options(headers: newHeaders);
  }

  // ------------------ Error Handler ------------------
  // String _handleError(DioException error) {
  //   if (error.type == DioExceptionType.connectionTimeout) {
  //     return "Connection timeout";
  //   } else if (error.type == DioExceptionType.receiveTimeout) {
  //     return "Receive timeout";
  //   } else if (error.type == DioExceptionType.badResponse) {
  //     return "Server error: ${error.response?.statusCode}";
  //   } else if (error.type == DioExceptionType.cancel) {
  //     return "Request cancelled";
  //   } else {
  //     return "Unexpected error: ${error.message}";
  //   }
  // }
}
