enum TaxSystem_SNO {
  osn,
  usnIncome,
  usnIncomeOutcome,
  envd,
  esn,
  patent,
}

extension TaxSystem_SNOExtension on TaxSystem_SNO {
  String get name {
    switch (this) {
      case TaxSystem_SNO.osn:
        return 'osn';
      case TaxSystem_SNO.usnIncome:
        return 'usn_income';
      case TaxSystem_SNO.usnIncomeOutcome:
        return 'usn_income_outcome';
      case TaxSystem_SNO.envd:
        return 'envd';
      case TaxSystem_SNO.esn:
        return 'esn';
      case TaxSystem_SNO.patent:
        return 'patent';
    }
  }

  static TaxSystem_SNO? fromString(String value) {
    switch (value) {
      case 'osn':
        return TaxSystem_SNO.osn;
      case 'usn_income':
        return TaxSystem_SNO.usnIncome;
      case 'usn_income_outcome':
        return TaxSystem_SNO.usnIncomeOutcome;
      case 'envd':
        return TaxSystem_SNO.envd;
      case 'esn':
        return TaxSystem_SNO.esn;
      case 'patent':
        return TaxSystem_SNO.patent;
      default:
        return null;
    }
  }
}
