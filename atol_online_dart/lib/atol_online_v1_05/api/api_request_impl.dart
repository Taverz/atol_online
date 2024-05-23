import 'dart:convert';

import 'package:atol_online_dart/atol_online_v1_05/api/api_request.dart';
import 'package:atol_online_dart/atol_online_v1_05/model/request_model_exchange_info.dart';
import 'package:atol_online_dart/atol_online_v1_05/utils/const_app.dart';
import 'package:http/http.dart' as httpImport;


class ApiRequestAtolCheckImpl implements ApiRequestAtolCheck {
  final String tokenCurrent;
  ApiRequestAtolCheckImpl({required this.tokenCurrent});

  /// ### Пример регистрации чека с операцией «Приход»:
  /// ```
  ///  https://online.atol.ru/possystem/v5/group1/sell?token=<token>
  /// ````
  ///
  /// Заголовок запроса должен содержать параметры:
  /// * Content-type: application/json; charset=utf-8
  /// * Token: <token>
  @override
  Future<Map> createCheck(ExchangeInfo model) async {
    final Map<String, dynamic> bodyParams = model.toMap();

    final url = Uri.https(
      ConstantApp.mainUrl,
      '/${ConstantApp.postMainUrl}/${ConstantApp.version}/group1/sell?token=$tokenCurrent',
    );
    final Map<String, String> headerParam = {
      'Content-type': 'application/json', //'application/json; charset=utf-8'
      'Token': tokenCurrent
    };
    final response = await httpImport.post(
      url,
      headers: headerParam,
      body: bodyParams,
    );
    final decode = jsonDecode(response.body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return decode;
    } else {
      throw Exception('Failed to createCheck');
    }
  }

  @override
  Future<dynamic> returnCheck() {
    // TODO: implement returnCheck
    throw UnimplementedError();
  }
}
