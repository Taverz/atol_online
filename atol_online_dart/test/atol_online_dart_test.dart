import 'package:atol_online_dart/atol_online_v1_05/api/api_auth_request.dart';
import 'package:atol_online_dart/atol_online_v1_05/api/api_auth_request_impl.dart';
import 'package:atol_online_dart/atol_online_v1_05/api/api_request.dart';
import 'package:atol_online_dart/atol_online_v1_05/api/api_request_impl.dart';
import 'package:atol_online_dart/atol_online_v1_05/api/api_request_impl_test.dart';
import 'package:atol_online_dart/atol_online_v1_05/model/request_model_exchange_info.dart';
import 'package:atol_online_dart/atol_online_v1_05/repository/aith_impl.dart';
import 'package:atol_online_dart/atol_online_v1_05/repository/auth.dart';
import 'package:atol_online_dart/atol_online_v1_05/repository/check.dart';
import 'package:atol_online_dart/atol_online_v1_05/repository/check_impl.dart';
import 'package:atol_online_dart/atol_online_v1_05/test_data/test_data.dart';
import 'package:atol_online_dart/fixture_reader.dart';
import 'package:test/test.dart';

void main() {
  late RepositoryCheck reposReal;
  ApiRequestAtolCheck? apiReal;
  late RepositoryAuth reposRealAuth;
  late ApiRequestAtolAuth apiRealAuth;

  late ApiRequestAtolCheck apiTest;

  setUp(() {
    final token = 'Empty init';
    apiRealAuth = ApiRequestAtolAuthImpl();
    reposRealAuth = RepositoryAuthImpl(apiRealAuth);
    apiReal = ApiRequestAtolCheckImpl(tokenCurrent: token);
    reposReal = RepositoryCheckImpl(apiReal!);

    apiTest = ApiRequestAtolCheckImplTest(tokenCurrent: token);
  });

  /// !!! first authorization and then ... other
  test('Repository Auth /  request real , mock model from request', () async {
    final modelSettings = testModel;
    final model = modelSettings.cmsParams.shop.last.access;
    final dynamic result = await reposRealAuth.getAuthToken(model);

    print(result);
    expect(result.runtimeType, String);
    apiReal = ApiRequestAtolCheckImpl(tokenCurrent: result);
  });

  //////////

  test('Repository Check /  request real , mock model from request', () async {
    final model = await _getFixtureTestModelExchange();
    final Map<dynamic, dynamic> result = await reposReal.createCheck(model);

    print(result);
    expect(result, {});
  });
  test('Repository Check /  request test , mock model from request', () async {
    final model = await _getFixtureTestModelExchange();
    final Map<dynamic, dynamic> result = await apiTest.createCheck(model);

    print(result);
    expect(result, {});
  });
}

Future<ExchangeInfo> _getFixtureTestModelExchange() async {
  final strData =
      await fixture('../assets/mock_request/check_example_docs.json');
  final ExchangeInfo model = ExchangeInfo.fromJson(strData);
  return model;
}
