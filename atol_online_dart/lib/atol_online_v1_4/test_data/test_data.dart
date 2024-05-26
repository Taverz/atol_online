import 'package:atol_online_dart/atol_online_v1_4/model/enum/ffd_version.dart';
import 'package:atol_online_dart/atol_online_v1_4/model/enum/tax_system_sno.dart';

import '../test_model/test_settings.dart';

final ModelSettings testModel = ModelSettings(
  cmsParams: CmsParams(
    shop: [
      Shop(
        access: Access(
          groupCode: 'group_code_47828',
          password: '5xMRY4tz',
          login: 'e69a785b-09ba-462f-9cba-4d368c26b27a',
        ),
        hostname: 'https://city-creek-shop.ru/',
        sno: TaxSystem_SNO.usnIncome,
        ffdVersion: FFDVersion.v1_5,
      ),
      Shop(
        access: Access(
          groupCode: 'group_code_47828',
          password: '5xMRY4tz',
          login: 'e69a785b-09ba-462f-9cba-4d368c26b27a',
        ),
        hostname: 'service-book.io',
        sno: TaxSystem_SNO.usnIncome,
        ffdVersion: FFDVersion.v1_5,
      ),
    ],
    kpp: '',
    inn: '616507944955',
    company: 'Заржецкий Александр Владиславович',
  ),
);

/// vat
/// PaymentType - deafault - electronic

