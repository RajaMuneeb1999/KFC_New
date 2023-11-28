import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:pushnoti_two/utils/utils.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';
import '../model/login_model.dart';
import '../res/app_url.dart';

class LoginRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    if (kDebugMode) {
      print(data.toString());
    }
    try {
      dynamic response = await _apiServices.getGetApiResponse(data.toString());
      return response;
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> loginOutApi(dynamic data) async {
    if (kDebugMode) {
      print(data.toString());
    }
    try {
      dynamic response = await _apiServices.getGetApiResponse(data.toString());
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
