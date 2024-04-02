part of 'remote_imports.dart';

class ApiClient {
  late BaseOptions baseOptions;
  late Dio dio;

  ApiClient() {
    baseOptions = BaseOptions(baseUrl: ApiConstant.baseUrl);
    dio = Dio(baseOptions);
    dio.interceptors.add(PrettyDioLogger());
  }

  Future<Response> getRequest({required String path}) async {
    try {
      Response response = await dio.get(path);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException(message: e.response?.statusMessage);
      } else {
        throw ApiException(message: e.message);
      }
    }
  }

  Future<Response> postRequest(
      {required String path, Map<String, dynamic>? body}) async {
    try {
      Response response = await dio.post(path, data: body);
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException(message: e.response?.statusMessage);
      } else {
        throw ApiException(message: e.message);
      }
    }
  }
}
