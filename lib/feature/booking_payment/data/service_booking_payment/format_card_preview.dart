class FormatCardPreview {
  static String formatCardNumberForPreview(String value) {
    final cleanValue = value.replaceAll(' ', '');

    final groups = <String>[];

    for (int i = 0; i < cleanValue.length; i += 4) {
      final end =
          (i + 4 < cleanValue.length)
              ? i + 4
              : cleanValue.length;

      groups.add(cleanValue.substring(i, end));
    }

    return groups.join('    ');
  }
}