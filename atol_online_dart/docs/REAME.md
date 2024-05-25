Вот пример `README.md` для вашей библиотеки на Dart, которая взаимодействует с API сервиса АТОЛ Онлайн. Этот файл можно разместить на pub.dev, чтобы пользователи могли понять, как использовать вашу библиотеку.

```markdown
# Atol API Client

A Dart library for interacting with the ATOL Online service API. This library allows you to authenticate, register documents, and retrieve document processing results.

## Features

- User authentication
- Document registration
- Retrieving document processing results

## Installation

Add `atol_api_client` to your `pubspec.yaml`:

```yaml
dependencies:
  atol_api_client:
    git:
      url: https://github.com/yourusername/atol_api_client.git
      ref: main
```

## Usage

### Import the package

```dart
import 'package:atol_api_client/atol_api_client.dart';
```

### Example

Here's a complete example of how to use the library:

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atol_api_client/atol_api_client.dart';

void main() async {
  const login = 'your_login';
  const password = 'your_password';
  const groupCode = 'your_group_code';
  const documentUuid = 'document_uuid';

  try {
    // Get authorization token
    final token = await getAuthToken(login, password);
    print('Token: $token');

    // Example document data
    final documentData = {
      'data': 'value',  // Replace with actual document data
    };

    // Register document
    await registerDocument(token, documentData);
    print('Document registered successfully');

    // Get document processing result
    final result = await getDocumentResult(token, groupCode, documentUuid);
    print('Document result: $result');
  } catch (e) {
    print('Error: $e');
  }
}
```

### Functions

#### `getAuthToken(String login, String password, [http.Client? client])`

Gets an authorization token.

- `login`: Your ATOL Online login.
- `password`: Your ATOL Online password.
- `client`: (Optional) Custom HTTP client for testing.

Returns a `Future<String>` containing the token.

#### `registerDocument(String token, Map<String, dynamic> documentData, [http.Client? client])`

Registers a document with the ATOL Online service.

- `token`: Authorization token.
- `documentData`: Map containing the document data.
- `client`: (Optional) Custom HTTP client for testing.

Returns a `Future<void>`.

#### `getDocumentResult(String token, String groupCode, String uuid, [http.Client? client])`

Gets the processing result of a registered document.

- `token`: Authorization token.
- `groupCode`: Your group code.
- `uuid`: Document UUID.
- `client`: (Optional) Custom HTTP client for testing.

Returns a `Future<Map<String, dynamic>>` containing the document result.

## Testing

Run the tests using the `test` package:

```bash
dart test
```

## License

MIT License. See [LICENSE](LICENSE) for more details.
```

### Notes

1. Ensure that the URL in the `dependencies` section points to the correct repository for your library.
2. Replace placeholders like `your_login`, `your_password`, `your_group_code`, and `document_uuid` with actual values in the example code.
3. Add any additional details about your library's features, configuration, or limitations as needed.

This `README.md` provides a clear and concise guide for users to understand how to install and use your library, along with an example and explanations of the core functions.



### В поле sno указывается система налогообложения, применяемая вашей организацией. Это обязательное поле. Возможные значения для поля sno:

* osn – общая система налогообложения;
* usn_income – упрощенная система налогообложения (доходы);
* usn_income_outcome – упрощенная система налогообложения (доходы минус расходы);
* envd – единый налог на вмененный доход;
* esn – единый сельскохозяйственный налог;
* patent – патентная система налогообложения​​.
* Убедитесь, что указанная система налогообложения соответствует действующей в вашей организации.



### В поле vat указывается ставка НДС для позиции. Возможные значения для этого поля:

* none – без НДС;
* vat0 – НДС по ставке 0%;
* vat10 – НДС по ставке 10%;
* vat110 – НДС по расчетной ставке 10/110;
* vat20 – НДС по ставке 20%;
* vat120 – НДС по расчетной ставке 20/120​​.

В поле vat указывается ставка НДС для позиции. Возможные значения для этого поля:


### payment_method v1_5

### В поле payment_method указывается признак способа расчета. Возможные значения для этого поля:

* full_prepayment – полная предварительная оплата до момента передачи предмета расчета.
* prepayment – частичная предварительная оплата до момента передачи предмета расчета.
* advance – аванс.
* full_payment – полный расчет, в том числе с учетом аванса (предварительной оплаты) в момент передачи предмета расчета.
* partial_payment – частичный расчет и кредит. Частичная оплата предмета расчета в момент его передачи с последующей оплатой в кредит.
* credit – передача в кредит. Передача предмета расчета без его оплаты в момент его передачи с последующей оплатой в кредит.
* credit_payment – оплата кредита. Оплата предмета расчета после его передачи с оплатой в кредит (оплата кредита)​​.

### payment_method v1_4

В поле `payment_method` указывается способ расчета. Возможные значения для этого поля включают:

1. full_prepayment – полная предварительная оплата до момента передачи предмета расчета.
2. prepayment – частичная предварительная оплата до момента передачи предмета расчета.
3. advance – аванс.
4. full_payment – полный расчет, в том числе с учетом аванса (предварительной оплаты) в момент передачи предмета расчета.
5. partial_payment – частичный расчет и кредит. Частичная оплата предмета расчета в момент его передачи с последующей оплатой в кредит.
6. credit – передача в кредит. Передача предмета расчета без его оплаты в момент его передачи с последующей оплатой в кредит.
7. credit_payment – оплата кредита. Оплата предмета расчета после его передачи с оплатой в кредит (оплата кредита).

Эти значения позволяют точно указать способ оплаты, использованный для расчета【36:0†source】.


"payment_method": 
"enum":

"enum": [
"full_prepayment",
"prepayment",
"advance",
"full_payment",
"partial_payment",
"credit",
"credit_payment"
]


"required": [
"name",
"price",
"quantity",
"measure",
"sum",
"payment_method",
"payment_object",
"vat"
],


### payment_object v1_4

В поле `payment_object` нужно указывать признак предмета расчёта. Возможные значения этого поля включают:

1. commodity – товар
2. excise – подакцизный товар
3. job – работа
4. service – услуга
5. gambling_bet – ставка при осуществлении деятельности по проведению азартных игр
6. gambling_prize – выигрыш при осуществлении деятельности по проведению азартных игр
7. lottery – лотерея
8. lottery_prize – выигрыш в лотерею
9. intellectual_activity – результат интеллектуальной деятельности
10. payment – предоставление прав на использование результатов интеллектуальной деятельности или средства индивидуализации
11. agent_commission – агентское вознаграждение
12. composite – составной предмет расчёта
13. another – иной предмет расчёта

Эти значения позволяют точно описать тип предмета расчёта в фискальном документе.


### payment_object v1_5
enum
(number)

Признак предмета расчёта.
Должен принимать одно из значений:
• 1 - о реализуемом товаре, за исключением подакцизного товара и
товара, подлежащего маркировке средствами идентификации
(наименование и иные сведения, описывающие товар)
1212
Признак
предмета
расчета
Описание протокола v5 (ФФД 1.2)
Страница 28 из 160
• 2 - о реализуемом подакцизном товаре, за исключением товара,
подлежащего маркировке средствами идентификации
(наименование и иные сведения, описывающие товар)
• 3 - о выполняемой работе (наименование и иные сведения,
описывающие работу)
• 4 - об оказываемой услуге (наименование и иные сведения,
описывающие услугу)
• 5 - о приеме ставок при осуществлении деятельности по
проведению азартных игр
• 6 - о выплате денежных средств в виде выигрыша при
осуществлении деятельности по проведению азартных игр
• 7 - о приеме денежных средств при реализации лотерейных
билетов, электронных лотерейных билетов, приеме лотерейных
ставок при осуществлении деятельности по проведению лотерей
• 8 - о выплате денежных средств в виде выигрыша при
осуществлении деятельности по проведению лотерей
• 9 - о предоставлении прав на использование результатов
интеллектуальной деятельности или средств индивидуализации
• 10 - об авансе, задатке, предоплате, кредите
Описание протокола v5 (ФФД 1.2)
Страница 29 из 160
• 11 - о вознаграждении пользователя, являющегося платежным
агентом (субагентом), банковским платежным агентом (субагентом),
комиссионером, поверенным или иным агентом
• 12 - о взносе в счет оплаты, пени, штрафе, вознаграждении,
бонусе и ином аналогичном предмете расчета
• 13 - о предмете расчета, не относящемуся к предметам расчета,
которым может быть присвоено значение от «1» до «11» и от «14»
до «26»
• 14 - о передаче имущественных прав
• 15 - о внереализационном доходе
• 16 - о суммах расходов, платежей и взносов, указанных в
подпунктах 2 и 3 пункта Налогового кодекса Российской
Федерации, уменьшающих сумму налога
• 17 - о суммах уплаченного торгового сбора
• 18 - о курортном сборе
• 19 - о залоге
• 20 - о суммах произведенных расходов в соответствии со статьей
346.16 Налогового кодекса Российской Федерации, уменьшающих
доход
Описание протокола v5 (ФФД 1.2)
Страница 30 из 160
• 21 - о страховых взносах на обязательное пенсионное
страхование, уплачиваемых ИП, не производящими выплаты и иные
вознаграждения физическим лицам
• 22 - о страховых взносах на обязательное пенсионное
страхование, уплачиваемых организациями и ИП, производящими
выплаты и иные вознаграждения физическим лицам
• 23 - о страховых взносах на обязательное медицинское
страхование, уплачиваемых ИП, не производящими выплаты и иные
вознаграждения физическим лицам
• 24 - о страховых взносах на обязательное медицинское
страхование, уплачиваемые организациями и ИП, производящими
выплаты и иные вознаграждения физическим лицам
• 25 - о страховых взносах на обязательное социальное страхование
на случай временной нетрудоспособности и в связи с материнством,
на обязательное социальное страхование от несчастных случаев на
производстве и профессиональных заболеваний
• 26 - о приеме и выплате денежных средств при осуществлении
казино и залами игровых автоматов расчетов с использованием
обменных знаков игорного заведения
• 27 - о выдаче денежных средств банковским платежным агентом
Описание протокола v5 (ФФД 1.2)
Страница 31 из 160
• 30 - о реализуемом подакцизном товаре, подлежащем маркировке
средством идентификации, не имеющем кода маркировки
• 31 - о реализуемом подакцизном товаре, подлежащем маркировке
средством идентификации, имеющем код маркировки
• 32 - о реализуемом товаре, подлежащем маркировке средством
идентификации, не имеющем кода маркировки, за исключением
подакцизного товара
• 33 - о реализуемом товаре, подлежащем маркировке средством
идентификации, имеющем код маркировки, за исключением
подакцизного товара