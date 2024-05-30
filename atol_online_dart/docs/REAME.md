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

Эти значения позволяют точно указать способ оплаты, использованный для расчета.


### Поле payment_method
#### В поле payment_method указываются следующие значения, которые описывают способ расчета:

* full_prepayment - полный предоплата
* prepayment - предоплата
* advance - аванс
* full_payment - полный расчет
* partial_payment - частичный расчет и кредит
* credit - передача в кредит
* credit_payment - оплата кредита

Эти значения определяют, как именно была произведена оплата.


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


### vat -> sum

```
if type == none
 sum = 0.0
else
 sum = %
```


 "vats": [
            {
                "type": "none",
                "sum": 0.0
            },
            {
                "type": "none",
                "sum": 0.0
            }
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

















<!-- -------_____------- -->




void main() async {
  final settings = ModelSettings();
  final shop = Shop(access: AccessInfo(groupCode: 'group-code', token: 'token'));
  
  final atolOnline = AtolOnlineV4(
    settingStore: settings,
    shop: shop,
  );
  
  await atolOnline.auth();
  
  final exchangeInfo = ExchangeInfo();
  await atolOnline.createCheck(exchangeInfo);
}





Для рефакторинга кода с использованием шаблонов проектирования можно применить паттерн "Наблюдатель" (Observer), чтобы обеспечить обновление `RepositoryCheck` при изменении токена, не нарушая принципа слабого связывания. В данном случае, `RepositoryAuth` будет испускать событие при успешной аутентификации, и `AtolOnlineV4` будет подписываться на это событие для обновления `RepositoryCheck`.

### Шаги:

1. **Создайте интерфейс `AuthObserver`:**

```dart
abstract class AuthObserver {
  void onAuthTokenChanged(String token);
}
```

2. **Измените `RepositoryAuth` для поддержки подписчиков:**

```dart
abstract class RepositoryAuth {
  Future<String> getAuthToken(String access);
  void addObserver(AuthObserver observer);
  void removeObserver(AuthObserver observer);
}

class RepositoryAuthImpl implements RepositoryAuth {
  final ApiRequestAtolAuth apiRequest;
  final List<AuthObserver> _observers = [];

  RepositoryAuthImpl(this.apiRequest);

  @override
  Future<String> getAuthToken(String access) async {
    final token = await apiRequest.getAuthToken(access);
    _notifyObservers(token);
    return token;
  }

  void _notifyObservers(String token) {
    for (var observer in _observers) {
      observer.onAuthTokenChanged(token);
    }
  }

  @override
  void addObserver(AuthObserver observer) {
    _observers.add(observer);
  }

  @override
  void removeObserver(AuthObserver observer) {
    _observers.remove(observer);
  }
}
```

3. **Измените `AtolOnlineV4` для подписки на события из `RepositoryAuth`:**

```dart
class AtolOnlineV4 implements AuthObserver {
  final ModelSettings settingStore;
  final Shop shop;
  final RepositoryAuth reposAuth;
  RepositoryCheck? reposCheck;
  String? token;

  AtolOnlineV4({
    required this.settingStore,
    required this.shop,
  }) : this.reposAuth = RepositoryAuthImpl(ApiRequestAtolAuthImpl()) {
    reposAuth.addObserver(this);
  }

  @override
  void onAuthTokenChanged(String token) {
    this.token = token;
    this.reposCheck = RepositoryCheckImpl(ApiRequestAtolCheckImpl(tokenCurrent: token));
  }

  /// 1 Step
  Future<void> auth() async {
    final resultToken = await reposAuth.getAuthToken(shop.access);
    // token and reposCheck will be updated through the observer mechanism
  }

  /// 2 Step
  Future<dynamic> createCheck(ExchangeInfo exchangeInfo) async {
    if (reposCheck == null || token == null) {
      throw Exception('No create token from init repo');
    }
    final result = await reposCheck!.createCheck(exchangeInfo, shop.access.groupCode);
    print(result);
  }
}
```

Теперь `AtolOnlineV4` подписывается на обновления токена из `RepositoryAuth` и автоматически обновляет `RepositoryCheck` при изменении токена, не требуя прямого вызова из `auth()`.

### Пример использования:

```dart
void main() async {
  final settings = ModelSettings();
  final shop = Shop(access: AccessInfo(groupCode: 'group-code', token: 'token'));
  
  final atolOnline = AtolOnlineV4(
    settingStore: settings,
    shop: shop,
  );
  
  await atolOnline.auth();
  
  final exchangeInfo = ExchangeInfo();
  await atolOnline.createCheck(exchangeInfo);
}
```

Теперь вы используете паттерн "Наблюдатель" для обеспечения слабого связывания между `RepositoryAuth` и `RepositoryCheck`, что улучшает масштабируемость и поддержку кода.


















-------------------











To avoid using the conditional initialization inside the `auth()` method and still achieve decoupling, we can use the Dependency Injection (DI) pattern combined with the Factory Method pattern. This way, we can inject the dependencies and handle the creation logic outside the `AtolOnlineV4` class.

### Step 1: Define the Factory Interface and Implementation

```dart
abstract class RepositoryFactory {
  RepositoryCheck createRepositoryCheck(String token);
}

class RepositoryFactoryImpl implements RepositoryFactory {
  @override
  RepositoryCheck createRepositoryCheck(String token) {
    return RepositoryCheckImpl(ApiRequestAtolCheckImpl(tokenCurrent: token), token);
  }
}
```

### Step 2: Update `AtolOnlineV4` to Use Dependency Injection

```dart
class AtolOnlineV4 {
  final ModelSettings settingStore;
  final Shop shop;
  final RepositoryAuth reposAuth;
  final RepositoryFactory repositoryFactory;
  RepositoryCheck? reposCheck;
  String? token;

  AtolOnlineV4({
    required this.settingStore,
    required this.shop,
    required this.reposAuth,
    required this.repositoryFactory,
  });

  Future<void> auth() async {
    final resultToken = await reposAuth.getAuthToken(shop.access);
    token = resultToken;

    reposCheck = repositoryFactory.createRepositoryCheck(token!);
    reposAuth.addObserver(reposCheck!);
  }

  Future<void> createCheck(ExchangeInfo exchangeInfo) async {
    if (reposCheck == null || token == null) {
      throw Exception('No create token from init repo');
    }

    final result = await reposCheck!.createCheck(exchangeInfo, shop.access.groupCode);
    print(result);
  }
}
```

### Step 3: Refactor the Observer Pattern

Ensure that `RepositoryCheckImpl` implements the `Observer` interface:

```dart
class RepositoryCheckImpl implements RepositoryCheck, Observer {
  final ApiRequestAtolCheck apiRequest;
  String _tokenCurrent;

  RepositoryCheckImpl(this.apiRequest, this._tokenCurrent);

  @override
  void update(String token) {
    _tokenCurrent = token;
    apiRequest.updateToken(token);
  }

  @override
  Future<dynamic> createCheck(ExchangeInfo exchangeInfo, String groupCode) async {
    // Implementation of createCheck using _tokenCurrent
  }
}
```

### Step 4: Dependency Injection Setup

Using a dependency injection framework like `get_it`, set up the dependencies:

```dart
final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ModelSettings>(ModelSettings());
  getIt.registerSingleton<Shop>(Shop());
  getIt.registerFactory<RepositoryAuth>(() => RepositoryAuthImpl(ApiRequestAtolAuthImpl()));
  getIt.registerFactory<RepositoryFactory>(() => RepositoryFactoryImpl());

  getIt.registerFactory<AtolOnlineV4>(() => AtolOnlineV4(
    settingStore: getIt<ModelSettings>(),
    shop: getIt<Shop>(),
    reposAuth: getIt<RepositoryAuth>(),
    repositoryFactory: getIt<RepositoryFactory>(),
  ));
}
```

### Step 5: Application Initialization

In your application initialization:

```dart
void main() {
  setup();
  final atolOnline = getIt<AtolOnlineV4>();
}
```

### Benefits

By using the Factory Method pattern along with Dependency Injection, the creation of `RepositoryCheck` is handled by the `RepositoryFactory`, ensuring that `AtolOnlineV4` remains clean and focused on its primary responsibilities. This approach also maintains decoupling between `RepositoryAuth` and `RepositoryCheck`.
























--------------------------














To achieve a decoupled design where `auth()` updates `RepositoryCheck` without the two features knowing about each other, we can use the Observer pattern. This pattern allows one object (the subject) to notify other objects (the observers) about changes in its state.

Here is the refactored code using the Observer pattern:

### Step 1: Define the Observer and Subject Interfaces

```dart
abstract class Observer {
  void update(String token);
}

abstract class Subject {
  void addObserver(Observer observer);
  void removeObserver(Observer observer);
  void notifyObservers();
}
```

### Step 2: Implement the Subject in RepositoryAuth

```dart
class RepositoryAuthImpl extends Subject {
  final ApiRequestAtolAuth apiRequest;
  String? _token;
  final List<Observer> _observers = [];

  RepositoryAuthImpl(this.apiRequest);

  Future<String> getAuthToken(Access access) async {
    _token = await apiRequest.fetchToken(access);
    notifyObservers();
    return _token!;
  }

  @override
  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  @override
  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }

  @override
  void notifyObservers() {
    for (final observer in _observers) {
      observer.update(_token!);
    }
  }
}
```

### Step 3: Implement the Observer in RepositoryCheck

```dart
class RepositoryCheckImpl implements RepositoryCheck, Observer {
  final ApiRequestAtolCheck apiRequest;
  String _tokenCurrent;

  RepositoryCheckImpl(this.apiRequest, this._tokenCurrent);

  @override
  void update(String token) {
    _tokenCurrent = token;
    apiRequest.updateToken(token);
  }

  @override
  Future<dynamic> createCheck(ExchangeInfo exchangeInfo, String groupCode) async {
    // Implementation of createCheck using _tokenCurrent
  }
}
```

### Step 4: Refactor `AtolOnlineV4` to Use the Observer Pattern

```dart
class AtolOnlineV4 {
  final ModelSettings settingStore;
  final Shop shop;
  final RepositoryAuth reposAuth;
  RepositoryCheck? reposCheck;
  String? token;

  AtolOnlineV4({
    required this.settingStore,
    required this.shop,
  }) : reposAuth = RepositoryAuthImpl(ApiRequestAtolAuthImpl());

  Future<void> auth() async {
    final resultToken = await reposAuth.getAuthToken(shop.access);
    token = resultToken;

    if (reposCheck == null) {
      reposCheck = RepositoryCheckImpl(ApiRequestAtolCheckImpl(tokenCurrent: token!), token!);
      reposAuth.addObserver(reposCheck!);
    }
  }

  Future<void> createCheck(ExchangeInfo exchangeInfo) async {
    if (reposCheck == null || token == null) {
      throw Exception('No create token from init repo');
    }

    final result = await reposCheck!.createCheck(exchangeInfo, shop.access.groupCode);
    print(result);
  }
}
```

### Step 5: Dependency Injection and Initialization

If you're using a dependency injection framework (e.g., `get_it`), you can set up the dependencies as follows:

```dart
final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ModelSettings>(ModelSettings());
  getIt.registerSingleton<Shop>(Shop());
  getIt.registerFactory<RepositoryAuth>(() => RepositoryAuthImpl(ApiRequestAtolAuthImpl()));
  getIt.registerFactoryParam<RepositoryCheck, String, void>((token, _) => RepositoryCheckImpl(ApiRequestAtolCheckImpl(tokenCurrent: token), token));
}
```

In your application initialization:

```dart
void main() {
  setup();
  final atolOnline = AtolOnlineV4(
    settingStore: getIt<ModelSettings>(),
    shop: getIt<Shop>(),
  );
}
```

By using the Observer pattern, you decouple `RepositoryAuth` and `RepositoryCheck`. `RepositoryCheck` observes `RepositoryAuth` for token updates, allowing each class to focus on its own responsibility without direct knowledge of the other.





















---------------------





















To refactor your class using design patterns, we can use the Use Case pattern, which is a common way to structure application logic in a clean and maintainable way. This pattern involves creating separate classes for each use case, ensuring single responsibility and easier testing.

Let's create two use cases: `AuthUseCase` and `CreateCheckUseCase`.

### Step 1: Create the Use Cases

```dart
class AuthUseCase {
  final RepositoryAuth reposAuth;
  final Shop shop;

  AuthUseCase({
    required this.reposAuth,
    required this.shop,
  });

  Future<String> execute() async {
    final resultToken = await reposAuth.getAuthToken(shop.access);
    return resultToken;
  }
}

class CreateCheckUseCase {
  final RepositoryCheck reposCheck;
  final Shop shop;

  CreateCheckUseCase({
    required this.reposCheck,
    required this.shop,
  });

  Future<dynamic> execute(ExchangeInfo exchangeInfo) async {
    final result = await reposCheck.createCheck(exchangeInfo, shop.access.groupCode);
    return result;
  }
}
```

### Step 2: Refactor `AtolOnlineV4` to Use the Use Cases

```dart
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

  Future<void> auth() async {
    final authUseCase = AuthUseCase(
      reposAuth: reposAuth,
      shop: shop,
    );
    token = await authUseCase.execute();
    reposCheck = RepositoryCheckImpl(ApiRequestAtolCheckImpl(tokenCurrent: token!));
  }

  Future<void> createCheck(ExchangeInfo exchangeInfo) async {
    if (reposCheck == null || token == null) {
      throw Exception('No create token from init repo');
    }

    final createCheckUseCase = CreateCheckUseCase(
      reposCheck: reposCheck!,
      shop: shop,
    );

    final result = await createCheckUseCase.execute(exchangeInfo);
    print(result);
  }
}
```

### Step 3: Dependency Injection and Initialization

If you're using a dependency injection framework (e.g., `get_it`), you can set up the dependencies as follows:

```dart
final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ModelSettings>(ModelSettings());
  getIt.registerSingleton<Shop>(Shop());
  getIt.registerFactory<RepositoryAuth>(() => RepositoryAuthImpl(ApiRequestAtolAuthImpl()));
  getIt.registerFactoryParam<RepositoryCheck, String, void>((token, _) => RepositoryCheckImpl(ApiRequestAtolCheckImpl(tokenCurrent: token)));

  getIt.registerFactory<AuthUseCase>(() => AuthUseCase(
    reposAuth: getIt<RepositoryAuth>(),
    shop: getIt<Shop>(),
  ));

  getIt.registerFactoryParam<CreateCheckUseCase, RepositoryCheck, void>((reposCheck, _) => CreateCheckUseCase(
    reposCheck: reposCheck,
    shop: getIt<Shop>(),
  ));
}
```

In your application initialization:

```dart
void main() {
  setup();
  final atolOnline = AtolOnlineV4(
    settingStore: getIt<ModelSettings>(),
    shop: getIt<Shop>(),
  );
}
```

By refactoring your code in this way, you follow the Single Responsibility Principle, making your classes easier to maintain and test. Each use case is now encapsulated in its own class, and your main class simply coordinates the use cases.

















-------------------









