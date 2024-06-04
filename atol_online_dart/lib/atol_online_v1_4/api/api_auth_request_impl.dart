import 'dart:convert';

import 'package:atol_online_dart/atol_online_v1_4/api/api_auth_request.dart';
import 'package:atol_online_dart/atol_online_v1_4/utils/const_app.dart';
// import 'package:http/http.dart' as httpImport;
import 'package:dio/dio.dart' as httpDio;

class ApiRequestAtolAuthImpl implements ApiRequestAtolAuth {
  
  final mainUrl = '${ConstantApp.preUrl}${ConstantApp.mainUrl}/${ConstantApp.postMainUrl}/${ConstantApp.version}';

  /// https://online.atol.ru/possystem/v5/getToken
  @override
  Future<String> getAuthToken({
    required String login,
    required String password,
  }) async {
    // ${ConstantApp.postMainUrl}/${ConstantApp.version}
    // final url = Uri.parse('$mainUrl/getToken');
    final headers = {'Content-Type': 'application/json; charset=utf-8'};
    final body = jsonEncode({
      'login': login,
      'pass': password,
    });

    final response = await httpDio.Dio().post('$mainUrl/getToken', queryParameters: headers, data: body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.data);
      return responseData['token'];
    } else {
      throw Exception('Failed to get token');
    }
  }

  // /// https://online.atol.ru/possystem/v5/getToken
  // @override
  // Future<String> getAuthToken({
  //   required String login,
  //   required String password,
  // }) async {
  //   // ${ConstantApp.postMainUrl}/${ConstantApp.version}
  //   final url = Uri.parse('$mainUrl/getToken');
  //   final headers = {'Content-Type': 'application/json; charset=utf-8'};
  //   final body = jsonEncode({
  //     'login': login,
  //     'pass': password,
  //   });

  //   final response = await httpImport.post(url, headers: headers, body: body);
  //   if (response.statusCode == 200) {
  //     final responseData = jsonDecode(response.body);
  //     return responseData['token'];
  //   } else {
  //     throw Exception('Failed to get token');
  //   }
  // }
}
