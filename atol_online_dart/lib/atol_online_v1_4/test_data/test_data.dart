import 'package:atol_online_dart/atol_online_v1_4/model/enum/ffd_version.dart';
import 'package:atol_online_dart/atol_online_v1_4/model/enum/tax_system_sno.dart';

import '../test_model/test_settings.dart';

final ModelSettings testModel = ModelSettings(
  cmsParams: CmsParams(
    shop: [
      Shop(
        access: Access(
          groupCode: 'group_code_11111',
          password: '5x1111tz',
          login: 'e37a985b-1111-1111-1111-2v364c20b37a',
        ),
        hostname: 'https://site.ru/',
        sno: TaxSystem_SNO.usnIncome,
        ffdVersion: FFDVersion.v1_5,
      ),
      Shop(
        access: Access(
          groupCode: 'group_code_11111',
          password: '5x1111tz',
          login: 'e37a985b-1111-1111-1111-2v364c20b37a',
        ),
        hostname: 'service-book.io',
        sno: TaxSystem_SNO.usnIncome,
        ffdVersion: FFDVersion.v1_5,
      ),
    ],
    kpp: '',
    inn: '115306844342',
    company: 'Николай Виктороич Леоднидович',
  ),
);

/// vat
/// PaymentType - deafault - electronic

