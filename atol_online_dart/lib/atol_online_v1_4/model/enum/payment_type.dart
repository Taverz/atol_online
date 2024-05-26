enum PaymentType {
  cash,
  electronic,
}

extension PaymentTypeExtension on PaymentType {
  int get value {
    switch (this) {
      case PaymentType.cash:
        return 1;
      case PaymentType.electronic:
        return 2;
    }
  }

  static PaymentType? fromInt(int value) {
    switch (value) {
      case 1:
        return PaymentType.cash;
      case 2:
        return PaymentType.electronic;
      default:
        return null;
    }
  }
}

