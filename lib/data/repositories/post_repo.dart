import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../presentation/screens/general/home/home_model.dart';
import '../data_sources/remote/api_endpoint_url.dart';
import '../data_sources/remote/remote_imports.dart';

class PostRepo extends ApiClient {

  Future<List<HomeModel>> getAllPosts() async {
    try {
      final Response<dynamic> response = await getRequest(path: ApiEndpointUrl.posts);
      if (response.statusCode == 200) {
        return homeModelFromJson(jsonEncode(response.data['all_posts']));
      } else {
        return [];
      }
    } on Exception catch (error) {
      Vx.log(error);
      return [];
    }
  }
}
