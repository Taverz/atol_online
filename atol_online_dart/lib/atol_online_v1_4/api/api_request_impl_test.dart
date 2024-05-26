import 'package:atol_online_dart/atol_online_v1_4/api/api_request.dart';
import 'package:atol_online_dart/atol_online_v1_4/model/request_model_exchange_info.dart';

class ApiRequestAtolCheckImplTest implements ApiRequestAtolCheck {
  final String tokenCurrent;
  ApiRequestAtolCheckImplTest({required this.tokenCurrent});
  @override
  Future<Map> createCheck(ExchangeInfo model, String codeGroup) async {
    // TODO: implement createCheck
    throw UnimplementedError();
  }

  @override
  Future returnCheck() {
    // TODO: implement returnCheck
    throw UnimplementedError();
  }
}
