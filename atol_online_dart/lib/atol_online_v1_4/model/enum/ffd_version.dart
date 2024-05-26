enum FFDVersion {
  v1_5,
  v1_2,
}

extension FFDVersionExtension on FFDVersion {
  String get name {
    switch (this) {
      case FFDVersion.v1_5:
        return 'v4 - ФФД версия 1_5';
      case FFDVersion.v1_2:
        return 'v5 - ФФД версия 1_2';
    }
  }

  static FFDVersion? fromString(String value) {
    switch (value) {
      case 'v4 - ФФД версия 1_5':
        return FFDVersion.v1_5;
      case 'v5 - ФФД версия 1_2':
        return FFDVersion.v1_2;
      default:
        return null;
    }
  }
}