import 'dart:convert';

import 'package:atol_online_dart/atol_online_v1_4/api/api_check_request.dart';
import 'package:atol_online_dart/atol_online_v1_4/model/request_model_exchange_info.dart';
import 'package:atol_online_dart/atol_online_v1_4/utils/const_app.dart';
// import 'package:http/http.dart' as httpImport;
import 'package:dio/dio.dart' as httpDio;

class ApiRequestAtolCheckImpl implements ApiRequestAtolCheck {
  late String? tokenCurrent;
  ApiRequestAtolCheckImpl();

  @override
  void addToken(String tokenCurrent){
    this.tokenCurrent = tokenCurrent;
  }

  /// ### Пример регистрации чека с операцией «Приход»:
  /// ```
  ///  https://online.atol.ru/possystem/v5/group1/sell?token=<token>
  /// ````
  ///
  /// Заголовок запроса должен содержать параметры:
  /// * Content-type: application/json; charset=utf-8
  /// * Token: <token>
  @override
  Future<Map> createCheck(ExchangeInfo model, String codeGroup) async {
    if(tokenCurrent != null){
      throw Exception('Emtpy token');
    }
    final Map<String, dynamic> bodyParams = model.toMap();

    // final url = Uri.https(
    //   ConstantApp.mainUrl,
    //   '/${ConstantApp.postMainUrl}/${ConstantApp.version}/$codeGroup/sell',
    // );
    final headerParam = {
      'Content-Type':
          'application/json; charset=utf-8', //'application/json; charset=utf-8'
      'Token': tokenCurrent!
    };

    final response = await httpDio.Dio().post(
      '/${ConstantApp.postMainUrl}/${ConstantApp.version}/$codeGroup/sell',
      queryParameters: headerParam,
      data: jsonEncode(bodyParams),
    );
    final decode = jsonDecode(response.data);
    if (response.statusCode == 200) {
      return decode;
    } else {
      throw Exception('Failed to createCheck');
    }
  }

  //   /// ### Пример регистрации чека с операцией «Приход»:
  // /// ```
  // ///  https://online.atol.ru/possystem/v5/group1/sell?token=<token>
  // /// ````
  // ///
  // /// Заголовок запроса должен содержать параметры:
  // /// * Content-type: application/json; charset=utf-8
  // /// * Token: <token>
  // @override
  // Future<Map> createCheck(ExchangeInfo model, String codeGroup) async {
  //   if(tokenCurrent != null){
  //     throw Exception('Emtpy token');
  //   }
  //   final Map<String, dynamic> bodyParams = model.toMap();

  //   final url = Uri.https(
  //     ConstantApp.mainUrl,
  //     '/${ConstantApp.postMainUrl}/${ConstantApp.version}/$codeGroup/sell',
  //   );
  //   final headerParam = {
  //     'Content-Type':
  //         'application/json; charset=utf-8', //'application/json; charset=utf-8'
  //     'Token': tokenCurrent!
  //   };

  //   final response = await httpImport.post(
  //     url,
  //     headers: headerParam,
  //     body: jsonEncode(bodyParams),
  //   );
  //   final decode = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     return decode;
  //   } else {
  //     throw Exception('Failed to createCheck');
  //   }
  // }

  @override
  Future<dynamic> returnCheck() {
    if(tokenCurrent != null){
      throw Exception('Emtpy token');
    }
    // TODO: implement returnCheck
    throw UnimplementedError();
  }
}
