// import 'package:dio/dio.dart';
// import 'package:get/get.dart' as getx;
// import 'package:shwe_pyae_sone/shared/controller/data_controller.dart';
// import 'package:shwe_pyae_sone/shared/services/api_end_points.dart';

// class ApiServices {
//   late final Dio _dio;
//   final DataController dataController = getx.Get.find();

//   ApiServices() {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: ApiendPoint.base_url,
//         headers: {"accept": "*/*"},
//         connectTimeout: const Duration(minutes: 1),
//         receiveTimeout: const Duration(minutes: 1),
//         validateStatus: (status) => true,
//       ),
//     );
//   }

//   // ====================== HTTP METHODS ======================

//   Future<Response<T>> get<T>(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     return _dio.get<T>(
//       path,
//       queryParameters: queryParameters,
//       options: Options(contentType: Headers.jsonContentType),
//     );
//   }

//   Future<Response<T>> post<T>(
//     String path, {
//     dynamic data,
//     CancelToken? cancelToken,
//   }) async {
//     return _dio.post<T>(
//       path,
//       data: data,
//       cancelToken: cancelToken,
//       options: Options(contentType: Headers.jsonContentType),
//     );
//   }

//   Future<Response<T>> postFormData<T>(
//     String path, {
//     required FormData data,
//   }) async {
//     return _dio.post<T>(
//       path,
//       data: data,
//       options: Options(contentType: Headers.multipartFormDataContentType),
//     );
//   }

//   Future<Response<T>> put<T>(String path, {dynamic data}) async {
//     return _dio.put<T>(
//       path,
//       data: data,
//       options: Options(contentType: Headers.jsonContentType),
//     );
//   }

//   Future<Response<T>> patch<T>(
//     String path, {
//     dynamic data,
//     CancelToken? cancelToken,
//   }) async {
//     return _dio.patch<T>(
//       path,
//       data: data,
//       cancelToken: cancelToken,
//       options: Options(contentType: Headers.jsonContentType),
//     );
//   }

//   Future<Response<T>> delete<T>(
//     String path, {
//     dynamic data,
//     CancelToken? cancelToken,
//   }) async {
//     return _dio.delete<T>(
//       path,
//       data: data,
//       cancelToken: cancelToken,
//       options: Options(contentType: Headers.jsonContentType),
//     );
//   }
// }
