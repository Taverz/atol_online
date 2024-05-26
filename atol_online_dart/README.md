

## Atol online


### Сначало нужно получить настройки из аккаунта "Atol online"  

Они в формате XML. На основе этих настроек и настроек аккаунта заполнить ModelSettings

### Как запускать и работать с библиотекой

```Dart

/// Init settings
final ModelSettings testModel = ModelSettings(
  cmsParams: CmsParams(
    shop: [
      Shop(
        access: Access(
          groupCode: 'group_code_1111',
          password: '1111111',
          login: 'e69a785b-1111-1111-1111-4d368c26b27a',
        ),
        hostname: 'https://cite-shop.ru/',
        sno: TaxSystem_SNO.usnIncome,
        ffdVersion: FFDVersion.v1_5,
      ),
      Shop(
        access: Access(
          groupCode: 'group_code_11111',
          password: '1111111',
          login: 'e69a785b-111-1111-1111-4d368c26b27a',
        ),
        hostname: 'cite-dev.io',
        sno: TaxSystem_SNO.usnIncome,
        ffdVersion: FFDVersion.v1_5,
      ),
    ],
    kpp: '', /// no required, empty
    inn: '111111111111',
    company: 'Ковалев Никита Андреевич',
  ),
);

/// Init system
AtolOnlineV4 atolOnline = AtolOnlineV4(testModel);
//////------
//// ### Cycle create check START - этот цикл нужно повторять постоянно при выдаче чека

/// Create check model
ExchangeInfo model2 = ...;
/// Auth server
atolOnline.auth();
/// send/create check
atolOnline.createCheck(model2);

//// ### Cycle create check END

```

## Docs local in folder:  

* DOCS/API_atol_online_v4.pdf - Official documentation atol online
* atol_online_dart/docs/REAME.md - Me documentation code


