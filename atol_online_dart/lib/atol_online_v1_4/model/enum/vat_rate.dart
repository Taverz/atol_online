enum VATRate {
  none,
  vat0,
  vat10,
  vat110,
  vat20,
  vat120,
}

extension VATRateExtension on VATRate {
  String get name {
    switch (this) {
      case VATRate.none:
        return 'none';
      case VATRate.vat0:
        return 'vat0';
      case VATRate.vat10:
        return 'vat10';
      case VATRate.vat110:
        return 'vat110';
      case VATRate.vat20:
        return 'vat20';
      case VATRate.vat120:
        return 'vat120';
    }
  }

  static VATRate? fromString(String value) {
    switch (value) {
      case 'none':
        return VATRate.none;
      case 'vat0':
        return VATRate.vat0;
      case 'vat10':
        return VATRate.vat10;
      case 'vat110':
        return VATRate.vat110;
      case 'vat20':
        return VATRate.vat20;
      case 'vat120':
        return VATRate.vat120;
      default:
        return null;
    }
  }
}
