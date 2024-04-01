part of 'remote_imports.dart';

class ApiClient {
  late BaseOptions options;
  late Dio dio;

  ApiClient() {
    options = BaseOptions(baseUrl: ApiConstant.baseUrl);
    dio = Dio(options);
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

  Future<Response> postRequest({required String path}) async {
    try {
      Response response = await dio.post(path);
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
