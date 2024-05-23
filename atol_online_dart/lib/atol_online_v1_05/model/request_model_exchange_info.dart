import 'dart:convert';

class ExchangeInfo {
  final String externalId;
  final Receipt receipt;
  final Service service;
  final String timestamp;

  ExchangeInfo({
    required this.externalId,
    required this.receipt,
    required this.service,
    required this.timestamp,
  }) : assert(externalId.isNotEmpty && timestamp.isNotEmpty);

  ExchangeInfo copyWith({
    String? externalId,
    Receipt? receipt,
    Service? service,
    String? timestamp,
  }) {
    return ExchangeInfo(
      externalId: externalId ?? this.externalId,
      receipt: receipt ?? this.receipt,
      service: service ?? this.service,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'externalId': externalId,
      'receipt': receipt.toMap(),
      'service': service.toMap(),
      'timestamp': timestamp,
    };
  }
  factory ExchangeInfo.fromMap(Map<String, dynamic> map) {
    return ExchangeInfo(
      externalId: map['external_id'] as String,
      receipt: Receipt.fromMap(map['receipt'] as Map<String, dynamic>),
      service: Service.fromMap(map['service'] as Map<String, dynamic>),
      timestamp: map['timestamp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExchangeInfo.fromJson(String source) =>
      ExchangeInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExchangeInfo(externalId: $externalId, receipt: $receipt, service: $service, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant ExchangeInfo other) {
    if (identical(this, other)) return true;

    return other.externalId == externalId &&
        other.receipt == receipt &&
        other.service == service &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return externalId.hashCode ^
        receipt.hashCode ^
        service.hashCode ^
        timestamp.hashCode;
  }
}

class Receipt {
  final Client client;
  final Company company;
  final List<Item> items;
  final List<Payment> payments;
  final List<VatElement> vats;
  final double total;

  Receipt({
    required this.client,
    required this.company,
    required this.items,
    required this.payments,
    required this.vats,
    required this.total,
  }) : assert(total > 1.0 &&
            items.isNotEmpty &&
            payments.isNotEmpty &&
            vats.isNotEmpty);

  Receipt copyWith({
    Client? client,
    Company? company,
    List<Item>? items,
    List<Payment>? payments,
    List<VatElement>? vats,
    double? total,
  }) {
    return Receipt(
      client: client ?? this.client,
      company: company ?? this.company,
      items: items ?? this.items,
      payments: payments ?? this.payments,
      vats: vats ?? this.vats,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'client': client.toMap(),
      'company': company.toMap(),
      'items': items.map((x) => x.toMap()).toList(),
      'payments': payments.map((x) => x.toMap()).toList(),
      'vats': vats.map((x) => x.toMap()).toList(),
      'total': total,
    };
  }

  factory Receipt.fromMap(Map<String, dynamic> map) {
    return Receipt(
      client: Client.fromMap(map['client'] as Map<String, dynamic>),
      company: Company.fromMap(map['company'] as Map<String, dynamic>),
      items: List<Item>.from(
        (List<Map<String, dynamic>>.from(map['items']) ).map<Item>(
          (x) => Item.fromMap(x as Map<String, dynamic>),
        ),
      ),
      payments: List<Payment>.from(
        ( List<Map<String, dynamic>>.from(map['payments']) ).map<Payment>(
          (x) => Payment.fromMap(x as Map<String, dynamic>),
        ),
      ),
      vats: List<VatElement>.from(
        (List<Map<String, dynamic>>.from(map['vats'])).map<VatElement>(
          (x) => VatElement.fromMap(x as Map<String, dynamic>),
        ),
      ),
      total: map['total'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Receipt.fromJson(String source) =>
      Receipt.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Receipt(client: $client, company: $company, items: $items, payments: $payments, vats: $vats, total: $total)';
  }

  @override
  bool operator ==(covariant Receipt other) {
    if (identical(this, other)) return true;

    return other.client == client &&
        other.company == company &&
        // listEquals(other.items, items) &&
        // listEquals(other.payments, payments) &&
        // listEquals(other.vats, vats) &&
        other.total == total;
  }

  @override
  int get hashCode {
    return client.hashCode ^
        company.hashCode ^
        items.hashCode ^
        payments.hashCode ^
        vats.hashCode ^
        total.hashCode;
  }
}

class Client {
  final String email;

  Client({
    required this.email,
  }) : assert(email.isNotEmpty);

  Client copyWith({
    String? email,
  }) {
    return Client(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) =>
      Client.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Client(email: $email)';

  @override
  bool operator ==(covariant Client other) {
    if (identical(this, other)) return true;

    return other.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}

class Company {
  final String email;
  final String sno;
  final String inn;
  final String paymentAddress;

  Company({
    required this.email,
    required this.sno,
    required this.inn,
    required this.paymentAddress,
  }) : assert(email.isNotEmpty && sno.isNotEmpty && inn.isNotEmpty);

  Company copyWith({
    String? email,
    String? sno,
    String? inn,
    String? paymentAddress,
  }) {
    return Company(
      email: email ?? this.email,
      sno: sno ?? this.sno,
      inn: inn ?? this.inn,
      paymentAddress: paymentAddress ?? this.paymentAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'sno': sno,
      'inn': inn,
      'payment_address': paymentAddress,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      email: map['email'] as String,
      sno: map['sno'] as String,
      inn: map['inn'] as String,
      paymentAddress: map['payment_address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Company(email: $email, sno: $sno, inn: $inn, paymentAddress: $paymentAddress)';
  }

  @override
  bool operator ==(covariant Company other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.sno == sno &&
        other.inn == inn &&
        other.paymentAddress == paymentAddress;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        sno.hashCode ^
        inn.hashCode ^
        paymentAddress.hashCode;
  }
}

class Item {
  final String name;
  final double price;
  final double quantity;
  final double sum;
  final String measurementUnit;
  final String paymentMethod;
  final String paymentObject;
  final ItemVat vat;

  Item({
    required this.name,
    required this.price,
    required this.quantity,
    required this.sum,
    required this.measurementUnit,
    required this.paymentMethod,
    required this.paymentObject,
    required this.vat,
  }): assert(price > 1.0 && sum > 1.0 && paymentMethod.isNotEmpty);

  Item copyWith({
    String? name,
    double? price,
    double? quantity,
    double? sum,
    String? measurementUnit,
    String? paymentMethod,
    String? paymentObject,
    ItemVat? vat,
  }) {
    return Item(
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      sum: sum ?? this.sum,
      measurementUnit: measurementUnit ?? this.measurementUnit,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentObject: paymentObject ?? this.paymentObject,
      vat: vat ?? this.vat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'quantity': quantity,
      'sum': sum,
      'measurementUnit': measurementUnit,
      'paymentMethod': paymentMethod,
      'paymentObject': paymentObject,
      'vat': vat.toMap(),
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as double,
      sum: map['sum'] as double,
      measurementUnit: map['measurement_unit'] as String,
      paymentMethod: map['payment_method'] as String,
      paymentObject: map['payment_object'] as String,
      vat: ItemVat.fromMap(map['vat'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(name: $name, price: $price, quantity: $quantity, sum: $sum, measurementUnit: $measurementUnit, paymentMethod: $paymentMethod, paymentObject: $paymentObject, vat: $vat)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.price == price &&
        other.quantity == quantity &&
        other.sum == sum &&
        other.measurementUnit == measurementUnit &&
        other.paymentMethod == paymentMethod &&
        other.paymentObject == paymentObject &&
        other.vat == vat;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        quantity.hashCode ^
        sum.hashCode ^
        measurementUnit.hashCode ^
        paymentMethod.hashCode ^
        paymentObject.hashCode ^
        vat.hashCode;
  }
}

class ItemVat {
  final String type;

  ItemVat({
    required this.type,
  });

  ItemVat copyWith({
    String? type,
  }) {
    return ItemVat(
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
    };
  }

  factory ItemVat.fromMap(Map<String, dynamic> map) {
    return ItemVat(
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemVat.fromJson(String source) =>
      ItemVat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ItemVat(type: $type)';

  @override
  bool operator ==(covariant ItemVat other) {
    if (identical(this, other)) return true;

    return other.type == type;
  }

  @override
  int get hashCode => type.hashCode;
}

class Payment {
  final int type;
  final double sum;

  Payment({
    required this.type,
    required this.sum,
  });

  Payment copyWith({
    int? type,
    double? sum,
  }) {
    return Payment(
      type: type ?? this.type,
      sum: sum ?? this.sum,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'sum': sum,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      type: map['type'] as int,
      sum: map['sum'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Payment(type: $type, sum: $sum)';

  @override
  bool operator ==(covariant Payment other) {
    if (identical(this, other)) return true;

    return other.type == type && other.sum == sum;
  }

  @override
  int get hashCode => type.hashCode ^ sum.hashCode;
}

class VatElement {
  final String type;
  final double sum;

  VatElement({
    required this.type,
    required this.sum,
  });

  // VatElement copyWith({
  //     String? type,
  //     double? sum,
  // }) =>
  //     VatElement(
  //         type: type ?? this.type,
  //         sum: sum ?? this.sum,
  //     );

  VatElement copyWith({
    String? type,
    double? sum,
  }) {
    return VatElement(
      type: type ?? this.type,
      sum: sum ?? this.sum,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'sum': sum,
    };
  }

  factory VatElement.fromMap(Map<String, dynamic> map) {
    return VatElement(
      type: map['type'] as String,
      sum: map['sum'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory VatElement.fromJson(String source) =>
      VatElement.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VatElement(type: $type, sum: $sum)';

  @override
  bool operator ==(covariant VatElement other) {
    if (identical(this, other)) return true;

    return other.type == type && other.sum == sum;
  }

  @override
  int get hashCode => type.hashCode ^ sum.hashCode;
}

class Service {
  final String callbackUrl;

  Service({
    required this.callbackUrl,
  });

  Service copyWith({
    String? callbackUrl,
  }) {
    return Service(
      callbackUrl: callbackUrl ?? this.callbackUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'callback_url': callbackUrl,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      callbackUrl: map['callback_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Service(callbackUrl: $callbackUrl)';

  @override
  bool operator ==(covariant Service other) {
    if (identical(this, other)) return true;

    return other.callbackUrl == callbackUrl;
  }

  @override
  int get hashCode => callbackUrl.hashCode;
}
