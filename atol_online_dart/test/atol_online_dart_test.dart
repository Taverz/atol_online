import 'dart:math';

import 'package:atol_online_dart/atol_online_v1_4/api/api_auth_request.dart';
import 'package:atol_online_dart/atol_online_v1_4/api/api_auth_request_impl.dart';
import 'package:atol_online_dart/atol_online_v1_4/api/api_request.dart';
import 'package:atol_online_dart/atol_online_v1_4/api/api_request_impl.dart';
import 'package:atol_online_dart/atol_online_v1_4/api/api_request_impl_test.dart';
import 'package:atol_online_dart/atol_online_v1_4/model/request_model_exchange_info.dart';
import 'package:atol_online_dart/atol_online_v1_4/repository/aith_impl.dart';
import 'package:atol_online_dart/atol_online_v1_4/repository/auth.dart';
import 'package:atol_online_dart/atol_online_v1_4/repository/check.dart';
import 'package:atol_online_dart/atol_online_v1_4/repository/check_impl.dart';
import 'package:atol_online_dart/atol_online_v1_4/test_data/test_data.dart';
import 'package:atol_online_dart/fixture_reader.dart';
import 'package:test/test.dart';

void main() {
  late RepositoryCheck reposReal;
  ApiRequestAtolCheck? apiReal;
  late RepositoryAuth reposRealAuth;
  late ApiRequestAtolAuth apiRealAuth;

  late ApiRequestAtolCheck apiTest;

  String token = 'Empty init';
  String codeGroup = 'Empty init';

  setUp(() {
    apiRealAuth = ApiRequestAtolAuthImpl();
    reposRealAuth = RepositoryAuthImpl(apiRealAuth);
    apiReal = ApiRequestAtolCheckImpl(tokenCurrent: token);
    reposReal = RepositoryCheckImpl(apiReal!);

    apiTest = ApiRequestAtolCheckImplTest(tokenCurrent: token);
  });

  /// !!! first authorization Get TOKEN and then ... other
  test('Repository Auth /  request real , mock model from request', () async {
    final modelSettings = testModel;
    final model = modelSettings.cmsParams.shop.last.access;
    final modelGroupeCode = modelSettings.cmsParams.shop.last.access.groupCode;
    final dynamic result = await reposRealAuth.getAuthToken(model);

    print(result);
    expect(result.runtimeType, String);

    token = result.toString();
    codeGroup = modelGroupeCode;
    apiReal = ApiRequestAtolCheckImpl(tokenCurrent: result);
    reposReal = RepositoryCheckImpl(apiReal!);

    final model2 = await _getFixtureTestModelExchange();
    final ranomExternalId = Random().nextInt(10000).toString();
    final changeModel = model2.copyWith(externalId: ranomExternalId);
    final Map<dynamic, dynamic> result2 = await reposReal.createCheck(
      changeModel,
      modelGroupeCode,
    );

    print(result2);
    final res = result2.isNotEmpty && result2['error'] == null;
    // {
    //   "uuid": "3478b698-bdd8-433e-8348-d7c9f17f480f",
    //   "status": "wait",
    //   "error": null,
    //   "timestamp": "25.05.2024 09:37:44"
    // },
    expect(res, true);
  });

  //////////

  // test('Repository Check /  request real , mock model from request', () async {
  //   final model = await _getFixtureTestModelExchange();
  //   final Map<dynamic, dynamic> result = await reposReal.createCheck(model);

  //   print(result);
  //   expect(result, {});
  // });

  test('Repository Check /  request test , mock model from request', () async {
    // final model = await _getFixtureTestModelExchange();
    // final Map<dynamic, dynamic> result =
    //     await apiTest.createCheck(model, codeGroup);

    // print(result);
    // expect(result, {});
  });
}

Future<ExchangeInfo> _getFixtureTestModelExchange() async {
  final strData =
      await fixture('../assets/mock_request/check_example_docs.json');
  final ExchangeInfo model = ExchangeInfo.fromJson(strData);
  return model;
}
