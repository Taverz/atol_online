import 'package:atol_online_dart/atol_online_v1_4/api/api_auth_request.dart';
import 'package:atol_online_dart/atol_online_v1_4/repository/auth.dart';
import 'package:atol_online_dart/atol_online_v1_4/test_model/test_settings.dart';
import 'package:atol_online_dart/check_network.dart';

class RepositoryAuthImpl implements RepositoryAuth {
  final ApiRequestAtolAuth apiReq;
  const RepositoryAuthImpl(this.apiReq);
  
  @override
  Future<dynamic> getAuthToken(Access modelSettings) async {
    await CheckNetworkCustom.checkNetwork();
    final String result = await apiReq.getAuthToken(
        login: modelSettings.login, password: modelSettings.password);
    return result;
  }
}
