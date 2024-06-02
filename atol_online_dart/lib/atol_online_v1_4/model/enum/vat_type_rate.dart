
/// Example

void kExampleVatTypeCalculateRate() {
  double price = 1000.0;

  // Рассчитаем сумму НДС для ставки 20%
  VATRate vatRate = VATRate.vat20;
  double vatSum = vatRate.calculateVATSum(price);

  print('Ставка НДС: ${vatRate.name}, Сумма НДС: $vatSum');

  // Рассчитаем сумму без НДС
  vatRate = VATRate.none;
  vatSum = vatRate.calculateVATSum(price);
  print('Ставка НДС: ${vatRate.name}, Сумма НДС: $vatSum');

  // Примеры для других ставок
  vatRate = VATRate.vat10;
  vatSum = vatRate.calculateVATSum(price);
  print('Ставка НДС: ${vatRate.name}, Сумма НДС: $vatSum');

}


enum VATRate {
  none(0),
  vat0(0),
  vat10(10),
  vat110(10 / 110),
  vat20(20),
  vat120(20 / 120);

  final double value;

  const VATRate(this.value);

  /// Расчет сцммы товара (для поля Sum в vat), на основе налога
  /// - также стоит учитывать payment_method (частичная оплата, предоплата ...)
  double calculateVATSum(double price) {
    if (this == VATRate.vat110 || this == VATRate.vat120) {
      return price * value;
    }
    return price * value / 100;
  }
}