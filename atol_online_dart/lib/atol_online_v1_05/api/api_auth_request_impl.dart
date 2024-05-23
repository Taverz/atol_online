import 'dart:convert';

import 'package:atol_online_dart/atol_online_v1_05/api/api_auth_request.dart';
import 'package:http/http.dart' as httpImport;

class ApiRequestAtolAuthImpl implements ApiRequestAtolAuth {
  ApiRequestAtolAuthImpl();

  ///
  @override
  Future<String> getAuthToken({
    required String login,
    required String password,
  }) async {
    final url = Uri.parse('https://online.atol.ru/possystem/v5/getToken');
    final headers = {'Content-Type': 'application/json; charset=utf-8'};
    final body = jsonEncode({
      'login': login,
      'pass': password,
    });

    final response = await httpImport.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['token'];
    } else {
      throw Exception('Failed to get token');
    }
  }
}
