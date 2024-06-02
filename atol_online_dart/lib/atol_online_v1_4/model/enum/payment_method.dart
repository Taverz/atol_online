enum PaymentMethod {
  fullPrepayment,
  prepayment,
  advance,
  fullPayment,
  partialPayment,
  credit,
  creditPayment,
}

extension PaymentMethodExtension on PaymentMethod {
  String get name {
    switch (this) {
      case PaymentMethod.fullPrepayment:
        return 'full_prepayment';
      case PaymentMethod.prepayment:
        return 'prepayment';
      case PaymentMethod.advance:
        return 'advance';
      case PaymentMethod.fullPayment:
        return 'full_payment';
      case PaymentMethod.partialPayment:
        return 'partial_payment';
      case PaymentMethod.credit:
        return 'credit';
      case PaymentMethod.creditPayment:
        return 'credit_payment';
      default:
        return '';
    }
  }

  static PaymentMethod? fromString(String value) {
    switch (value) {
      case 'full_prepayment':
        return PaymentMethod.fullPrepayment;
      case 'prepayment':
        return PaymentMethod.prepayment;
      case 'advance':
        return PaymentMethod.advance;
      case 'full_payment':
        return PaymentMethod.fullPayment;
      case 'partial_payment':
        return PaymentMethod.partialPayment;
      case 'credit':
        return PaymentMethod.credit;
      case 'credit_payment':
        return PaymentMethod.creditPayment;
      default:
        return null;
    }
  }
}
