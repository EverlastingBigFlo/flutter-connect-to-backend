import 'package:connectingtobackend/service/shared-preference.dart';
import 'package:dio/dio.dart';

final dio = Dio();

CustomSharedPreference pref = CustomSharedPreference();

Dio axios() {
  // Set default configs
  dio.options.baseUrl = "http://10.0.2.2:8000/api/";
  dio.options.connectTimeout = const Duration(seconds: 20);
  dio.options.receiveTimeout = const Duration(seconds: 20);
  dio.options.headers['accept'] = 'Application/Json';

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        // Do something before request is sent.
        // If you want to resolve the request with custom data,
        // you can resolve a `Response` using `handler.resolve(response)`.
        // If you want to reject the request with a error message,
        // you can reject with a `DioException` using `handler.reject(dioError)`.

        final token = pref.getString('token') ?? '';
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        // Do something with response data.
        // If you want to reject the request with a error message,
        // you can reject a `DioException` object using `handler.reject(dioError)`.
        return handler.next(response);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        String errorMessage;

        switch (e.type) {
          case DioExceptionType.badResponse:
            errorMessage = 'Server error';
            break;
          case DioExceptionType.connectionTimeout:
            errorMessage = 'Connection Timeout';
            break;
          case DioExceptionType.receiveTimeout:
            errorMessage = 'Unable to connect to the server';
            break;
          case DioExceptionType.sendTimeout:
            errorMessage = 'Please check your internet connection';
            break;
          case DioExceptionType.unknown:
            errorMessage = 'Something went wrong';
            break;
          default:
            errorMessage = 'An error occurred';
            break;
        }

        // Create a new DioError instance with the custom message
        DioException customError = DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: errorMessage,
            message: e.message);

        return handler.next(customError);
      },
    ),
  );
  return dio;
}
