//TODO: env load

import '../model/enum/ffd_version.dart';
import '../model/enum/tax_system_sno.dart';

class ModelSettings {
  final CmsParams cmsParams;

  ModelSettings({
    required this.cmsParams,
  });

  ModelSettings copyWith({
    CmsParams? cmsParams,
  }) =>
      ModelSettings(
        cmsParams: cmsParams ?? this.cmsParams,
      );
}

class CmsParams {
  final List<Shop> shop;
  final String kpp;
  final String inn;
  final String company;

  CmsParams({
    required this.shop,
    required this.kpp,
    required this.inn,
    required this.company,
  });

  CmsParams copyWith({
    List<Shop>? shop,
    String? kpp,
    String? inn,
    String? company,
  }) =>
      CmsParams(
        shop: shop ?? this.shop,
        kpp: kpp ?? this.kpp,
        inn: inn ?? this.inn,
        company: company ?? this.company,
      );
}

class Shop {
  final Access access;
  final String hostname;
  final TaxSystem_SNO sno;
  final FFDVersion ffdVersion;

  Shop({
    required this.sno,
    required this.access,
    required this.hostname,
    required this.ffdVersion,
  });

  Shop copyWith({
    Access? access,
    String? hostname,
    TaxSystem_SNO? sno,
    FFDVersion? ffdVersion,
  }) =>
      Shop(
        access: access ?? this.access,
        sno: sno ?? this.sno,
        ffdVersion: ffdVersion ?? this.ffdVersion,
        hostname: hostname ?? this.hostname,
      );
}

class Access {
  final String groupCode;
  final String password;
  final String login;

  Access({
    required this.groupCode,
    required this.password,
    required this.login,
  });

  Access copyWith({
    String? groupCode,
    String? password,
    String? login,
  }) =>
      Access(
        groupCode: groupCode ?? this.groupCode,
        password: password ?? this.password,
        login: login ?? this.login,
      );
}
