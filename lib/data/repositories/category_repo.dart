import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/general/categories/categories_model.dart';
import '../data_sources/remote/api_endpoint_url.dart';
import '../data_sources/remote/remote_imports.dart';

class CategoryRepo extends ApiClient {
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final Response<dynamic> response =
          await getRequest(path: ApiEndpointUrl.categories);
      if (response.statusCode == 200) {
        return categoryModelFromJson(jsonEncode(response.data['categories']));
      } else {
        return [];
      }
    } on Exception catch (error) {
      Vx.log(error);
      return [];
    }
  }
}
