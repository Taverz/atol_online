import 'package:atol_online_dart/atol_online_v1_4/api/api_auth_request_impl.dart';
import 'package:atol_online_dart/atol_online_v1_4/api/api_check_request_impl.dart';
import 'package:atol_online_dart/atol_online_v1_4/model/request_model_exchange_info.dart';
import 'package:atol_online_dart/atol_online_v1_4/repository/aith_impl.dart';
import 'package:atol_online_dart/atol_online_v1_4/repository/auth.dart';
import 'package:atol_online_dart/atol_online_v1_4/repository/check.dart';
import 'package:atol_online_dart/atol_online_v1_4/repository/check_impl.dart';
import 'package:atol_online_dart/atol_online_v1_4/test_model/test_settings.dart';

class AtolOnlineV4 {
  final ModelSettings settingStore;
  final Shop shop;
  final RepositoryAuth reposAuth;
  RepositoryCheck? reposCheck;
  String? token;

  AtolOnlineV4({
    required this.settingStore,
    required this.shop,
  }) : this.reposAuth = RepositoryAuthImpl(ApiRequestAtolAuthImpl());


  /// 1 Step
  Future<void> auth() async {
    final resultToken = await reposAuth.getAuthToken(shop.access);
    token = resultToken;
    this.reposCheck = RepositoryCheckImpl(ApiRequestAtolCheckImpl(tokenCurrent: token!));
  }

  /// 2 Step
  Future<dynamic> createCheck(ExchangeInfo exchangeInfo) async {
    if (reposCheck == null || token == null) {
      throw Exception('No create token from init repo');
    }
    final result =
        await reposCheck!.createCheck(exchangeInfo, shop.access.groupCode);
  }

}
