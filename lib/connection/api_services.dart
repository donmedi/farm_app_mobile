// import 'package:dio/dio.dart';
// import 'package:farm_loan_app/constant/constant.dart';

// // import 'package:package_info_plus/package_info_plus.dart';
// // import 'package:package_info_plus/package_info_plus.dart';

// class ApiService {
//   ApiService(this._dio) {
//     _dio.interceptors.add(_DioInterceptor());
//     _dio.options.sendTimeout = const Duration(seconds: 15);
//     _dio.options.receiveTimeout = const Duration(seconds: 30);
//     _dio.options.baseUrl = Constant.apiMainUrl;
//     _dio.options.headers['Accept'] = 'application/json';
//   }

//   final Dio _dio;

//   String? get _token => localStorageService.getString('authData');
//   // LocalStorageService.getString('authData');

//   Future<Response> fetch(
//     String path, {
//     bool useToken = true,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final response = await _dio.get(
//         path,
//         options: useToken
//             ? Options(headers: {'Authorization': 'Bearer $_token'})
//             : null,
//         queryParameters: queryParameters,
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<Response> upload(String path, {FormData? body}) async {
//     try {
//       final response = await _dio.post(
//         path,
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $_token',
//             'Content-Type': 'multipart/form-data',
//           },
//         ),
//         data: body,
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<Response> update(
//     String path, {
//     Map<String, dynamic>? body,
//     bool useToken = true,
//   }) async {
//     try {
//       final response = await _dio.patch(
//         path,
//         data: body,
//         options: useToken
//             ? Options(
//                 headers: {
//                   'Authorization': 'Bearer $_token',
//                   'Content-Type': 'application/json',
//                 },
//               )
//             : null,
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<Response> post(
//     String path, {
//     Map<String, dynamic>? body,
//     bool useContentType = false,
//     bool useToken = true,
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final response = await _dio.post(
//         path,
//         data: body,
//         options: useToken
//             ? Options(
//                 headers: useContentType
//                     ? {
//                         'Authorization': 'Bearer $_token',
//                         'Content-Type': 'application/json',
//                       }
//                     : {'Authorization': 'Bearer $_token'},
//               )
//             : null,
//         queryParameters: queryParameters,
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<ApiResult> handleApiRequest(
//     Future<Response> apiCall, {
//     String? message,
//   }) async {
//     try {
//       final response = await apiCall;

//       if (response.data['status']) {
//         return ApiResult.success(data: response.data);
//       } else {
//         return ApiResult.failure(
//           message: ErrorMessage(
//             apiMessage: response.data['message'] ?? '',
//           ),
//         );
//       }
//     } on DioError catch (e) {
//       if (e.response?.statusCode == 401) {
//         // AppRouter.popUntil('/login-pin');
//       }

//       return ApiResult.failure(
//         message: ErrorMessage(
//           dioMessage: DioExceptions.fromDioError(e).toString(),
//           apiMessage: message,
//           // e.response?.statusCode != 413
//           // ? DataHelpers.selectData(e.response?.data, 'message')
//           // : message,
//         ),
//       );
//     } catch (_) {
//       return ApiResult.failure(
//         message: ErrorMessage(apiMessage: 'Unknown error occurred'),
//       );
//     }
//   }
// }

// class _DioInterceptor extends Interceptor {
//   final log = getLogger('DioInterceptor');

//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     log.e('ERROR TYPE: ${err.type}');
//     log.e('STATUSCODE: ${err.response?.statusCode}');
//     log.e('ERROR: ${err.response?.data ?? 'unknown'}');
//     handler.next(err);
//   }

//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     // final info = await PackageInfo.fromPlatform();
//     // options.queryParameters.putIfAbsent('platformVersion', () => info.version);
//     log.i(
//       'METHOD/ENDPOINT: ${options.method} ${options.uri} ${options.data.toString()}',
//     );

//     handler.next(options);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     log.i('STATUSCODE: ${response.statusCode}');
//     log.i('MESSAGE: ${response.data['message']}');
//     handler.next(response);
//   }
// }
