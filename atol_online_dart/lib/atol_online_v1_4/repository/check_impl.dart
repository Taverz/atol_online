import 'package:atol_online_dart/atol_online_v1_4/api/api_check_request.dart';
import 'package:atol_online_dart/atol_online_v1_4/model/request_model_exchange_info.dart';
import 'package:atol_online_dart/atol_online_v1_4/repository/check.dart';
import 'package:atol_online_dart/check_network.dart';

class RepositoryCheckImpl implements RepositoryCheck {
  final ApiRequestAtolCheck apiReq;
  const RepositoryCheckImpl(this.apiReq);
  
  @override
  Future<dynamic> createCheck(ExchangeInfo exchangeInfo, String codeGroup) async {
    await CheckNetworkCustom.checkNetwork();
    final Map<dynamic, dynamic> result = await apiReq.createCheck(exchangeInfo, codeGroup);
    print(result);
    return result;
  }
}
