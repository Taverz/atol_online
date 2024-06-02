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
  final RepositoryCheck reposCheck;
  String? _token;

  AtolOnlineV4({
    required this.settingStore,
    required this.shop,
  }) :  this.reposAuth = RepositoryAuthImpl(ApiRequestAtolAuthImpl()),
        this.reposCheck = RepositoryCheckImpl(ApiRequestAtolCheckImpl());
  
  AtolOnlineV4.repository({
    required this.settingStore,
    required this.shop,
    required this.reposAuth,
    required this.reposCheck,
  });

  bool get isAvialableToken => _token != null;
  String? get token => _token;


  /// 1 Step
  Future<void> auth() async {
    _token = null;
    final resultToken = await reposAuth.getAuthToken(shop.access);
    _token = resultToken;
    if (_token == null) {
      throw Exception('No create token from init repo');
    }
    reposCheck.addToken(_token!);
  }

  /// 2 Step
  Future<dynamic> createCheck(ExchangeInfo exchangeInfo) async {
    if (_token == null) {
      throw Exception('No create token from init repo, need call auth() method');
    }
    final result =
        await reposCheck.createCheck(exchangeInfo, shop.access.groupCode);
    print(result);
  }

}
