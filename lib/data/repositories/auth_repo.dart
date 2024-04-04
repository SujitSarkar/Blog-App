import 'dart:convert';

import 'package:blog_app/data/models/message_model.dart';
import 'package:dio/dio.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/auth/login/login_model.dart';
import '../data_sources/remote/api_endpoint_url.dart';
import '../data_sources/remote/remote_imports.dart';

class AuthRepo extends ApiClient {
  Future<LoginModel> userLogin(
      {required String email, required String password}) async {
    final body = {'email': email, 'password': password};
    try {
      final Response<dynamic> response =
          await postRequest(path: ApiEndpointUrl.login, body: body);
      if (response.statusCode == 200) {
        return loginModelFromJson(jsonEncode(response.data));
      } else {
        return LoginModel();
      }
    } on Exception catch (error) {
      Vx.log(error);
      return LoginModel();
    }
  }

  Future<MessageModel> userLogout() async {
    try {
      final Response<dynamic> response =
          await postRequest(path: ApiEndpointUrl.logout);
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
