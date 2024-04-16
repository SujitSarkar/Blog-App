part of 'remote_imports.dart';

class ApiClient {
  late BaseOptions baseOptions;
  late Dio dio;
  Options options = Options();

  ApiClient() {
    baseOptions = BaseOptions(baseUrl: ApiConstant.apiBaseUrl);
    dio = Dio(baseOptions);
    dio.interceptors.add(PrettyDioLogger());
  }

  Future<Response> getRequest({required String path, bool isTokenRequired=false}) async {
    if(isTokenRequired){
      final token = await Utils.getToken();
    options =
        Options(headers: {'Authorization': 'Bearer $token'});
    }
    
    try {
      Response response = await dio.get(path,options: options);
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
    final token = await Utils.getToken();
    final Options options =
        Options(headers: {'Authorization': 'Bearer $token'});
    try {
      Response response = await dio.post(path, data: body, options: options);
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
