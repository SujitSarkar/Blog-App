import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/general/categories/categories_model.dart';
import '../data_sources/remote/api_endpoint_url.dart';
import '../data_sources/remote/remote_imports.dart';
import '../models/message_model.dart';

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

  Future<MessageModel> addCategory(
      {required String title, required String slug}) async {
    final body = {"title": title, "slug": slug};
    try {
      final Response<dynamic> response = await postRequest(
          path: ApiEndpointUrl.addCategories, body: body, isTokenRequired: true);
      if (response.statusCode == 200) {
        return messageModelFromJson(jsonEncode(response.data));
      } else {
        return MessageModel();
      }
    } on Exception catch (error) {
      Vx.log(error);
      return MessageModel();
    }
  }

  Future<MessageModel> updateCategory(
      {required String id,required String title, required String slug}) async {
    final body = {"id": id,"title": title, "slug": slug};
    try {
      final Response<dynamic> response = await postRequest(
          path: ApiEndpointUrl.updateCategories, body: body, isTokenRequired: true);
      if (response.statusCode == 200) {
        return messageModelFromJson(jsonEncode(response.data));
      } else {
        return MessageModel();
      }
    } on Exception catch (error) {
      Vx.log(error);
      return MessageModel();
    }
  }

  Future<MessageModel> deleteCategory({required String id}) async {
    try {
      final Response<dynamic> response = await postRequest(
          path: '${ApiEndpointUrl.deleteCategories}/$id', isTokenRequired: true);
      if (response.statusCode == 200) {
        return messageModelFromJson(jsonEncode(response.data));
      } else {
        return MessageModel();
      }
    } on Exception catch (error) {
      Vx.log(error);
      return MessageModel();
    }
  }
}
