import 'package:atol_online_dart/atol_online_v1_4/api/api_check_request.dart';
import 'package:atol_online_dart/atol_online_v1_4/model/request_model_exchange_info.dart';

abstract class RepositoryCheck {
  final ApiRequestAtolCheck apiReq;
  RepositoryCheck(this.apiReq);
  Future<dynamic> createCheck(ExchangeInfo exchangeInfo, String codeGroup);
}
