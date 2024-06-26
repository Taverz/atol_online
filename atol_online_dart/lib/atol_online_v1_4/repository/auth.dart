import 'package:atol_online_dart/atol_online_v1_4/api/api_auth_request.dart';
import 'package:atol_online_dart/atol_online_v1_4/test_model/test_settings.dart';

abstract class RepositoryAuth {
  final ApiRequestAtolAuth apiReq;
  RepositoryAuth(this.apiReq);
  Future<dynamic> getAuthToken(Access exchangeInfo);
}
