import 'package:atol_online_dart/atol_online_v1_05/api/api_request.dart';
import 'package:atol_online_dart/atol_online_v1_05/model/request_model_exchange_info.dart';

abstract class RepositoryCheck {
  final ApiRequestAtolCheck apiReq;
  RepositoryCheck(this.apiReq);
  Future<dynamic> createCheck(ExchangeInfo exchangeInfo);
}
