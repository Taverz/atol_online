import 'package:atol_online_dart/atol_online_v1_05/model/request_model_exchange_info.dart';

abstract class ApiRequestAtolCheck {
  Future<Map> createCheck(ExchangeInfo model);
  Future<dynamic> returnCheck();
}