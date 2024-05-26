import 'package:atol_online_dart/atol_online_v1_4/model/request_model_exchange_info.dart';

abstract class ApiRequestAtolCheck {
  final String tokenCurrent;
  ApiRequestAtolCheck({required this.tokenCurrent});
  Future<Map> createCheck(ExchangeInfo model, String codeGroup);
  Future<dynamic> returnCheck();
}