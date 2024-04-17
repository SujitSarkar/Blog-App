import 'dart:convert';

import 'package:blog_app/data/models/message_model.dart';
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

  Future<MessageModel> addTags(
      {required String title, required String slug}) async {
    final body = {"title": title, "slug": slug};
    try {
      final Response<dynamic> response = await postRequest(
          path: ApiEndpointUrl.addTags, body: body, isTokenRequired: true);
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

  Future<MessageModel> updateTag(
      {required String tagId,required String title, required String slug}) async {
    final body = {"id": tagId,"title": title, "slug": slug};
    try {
      final Response<dynamic> response = await postRequest(
          path: ApiEndpointUrl.updateTags, body: body, isTokenRequired: true);
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

  Future<MessageModel> deleteTags({required String tagId}) async {
    try {
      final Response<dynamic> response = await postRequest(
          path: '${ApiEndpointUrl.deleteTags}/$tagId', isTokenRequired: true);
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
