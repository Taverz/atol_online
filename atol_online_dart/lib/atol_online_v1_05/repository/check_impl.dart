import 'package:atol_online_dart/atol_online_v1_05/api/api_request.dart';
import 'package:atol_online_dart/atol_online_v1_05/model/request_model_exchange_info.dart';
import 'package:atol_online_dart/atol_online_v1_05/repository/check.dart';

class RepositoryCheckImpl implements RepositoryCheck {
  final ApiRequestAtolCheck apiReq;
  const RepositoryCheckImpl(this.apiReq);
  Future<dynamic> createCheck(ExchangeInfo exchangeInfo) async {
    // final ApiRequestAtolCheck apiReq = ApiRequestAtolCheckImpl();
    // final model = await _getFixtureTestModelExchange();
    final Map<dynamic, dynamic> result = await apiReq.createCheck(exchangeInfo);
    print(result);
    return result;
  }

  // Future<ExchangeInfo> _getFixtureTestModelExchange() async {
  //   final strData =
  //       await fixture('../assets/mock_request/check_example_docs.json');
  //   final ExchangeInfo model = ExchangeInfo.fromJson(strData);
  //   return model;
  // }
}
