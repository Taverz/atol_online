import 'package:atol_online_dart/atol_online_v1_4/model/request_model_exchange_info.dart';

abstract class ApiRequestAtolCheck {
  ApiRequestAtolCheck();
  void addToken(String token);
  Future<Map> createCheck(ExchangeInfo model, String codeGroup);
  Future<dynamic> returnCheck();
}