import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/general/tags/tags_model.dart';
import '../data_sources/remote/api_endpoint_url.dart';
import '../data_sources/remote/remote_imports.dart';

class TagsRepo extends ApiClient {
  Future<List<TagsModel>> getAllTags() async {
    try {
      final Response<dynamic> response =
          await getRequest(path: ApiEndpointUrl.tags);
      if (response.statusCode == 200) {
        return tagsModelFromJson(jsonEncode(response.data['tags']));
      } else {
        return [];
      }
    } on Exception catch (error) {
      Vx.log(error);
      return [];
    }
  }
}
