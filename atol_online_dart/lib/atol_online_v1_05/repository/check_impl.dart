import 'package:atol_online_dart/atol_online_v1_05/api/api_request.dart';
import 'package:atol_online_dart/atol_online_v1_05/model/request_model_exchange_info.dart';
import 'package:atol_online_dart/atol_online_v1_05/repository/check.dart';
import 'package:atol_online_dart/check_network.dart';

class RepositoryCheckImpl implements RepositoryCheck {
  final ApiRequestAtolCheck apiReq;
  const RepositoryCheckImpl(this.apiReq);
  Future<dynamic> createCheck(ExchangeInfo exchangeInfo) async {
    final networkConnect = await CheckNetworkCustom.checkNetwork();
    if (!networkConnect) {
      throw Exception('No connect network');
    }
    final Map<dynamic, dynamic> result = await apiReq.createCheck(exchangeInfo);
    print(result);
    return result;
  }
}
