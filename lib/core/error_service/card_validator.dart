class CardValidators {
  // NAME VALIDATOR
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    // فقط حروف ومسافات
    final regex = RegExp(r'^[a-zA-Z\s]+$');
    if (!regex.hasMatch(value.trim())) {
      return 'Name must contain letters only';
    }

    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }

    return null;
  }

  // CARD NUMBER VALIDATOR
  static String? validateCardNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Card number is required';
    }

    // إزالة المسافات
    final cleaned = value.replaceAll(' ', '');

    // لازم يكون أرقام فقط
    final regex = RegExp(r'^\d+$');
    if (!regex.hasMatch(cleaned)) {
      return 'Card number must contain digits only';
    }

    if (cleaned.length != 16) {
      return 'Card number must be 16 digits';
    }

    return null;
  }

  // EXPIRY DATE VALIDATOR
  static String? validateExpiry(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Expiry date is required';
    }

    // شكل التاريخ الصحيح: MM/YY
    final regex = RegExp(r'^\d{2}/\d{2}$');
    if (!regex.hasMatch(value)) {
      return 'Invalid format (MM/YY)';
    }

    final parts = value.split('/');
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);

    if (month == null || month < 1 || month > 12) {
      return 'Invalid month';
    }

    if (year == null || year < 0 || year > 99) {
      return 'Invalid year';
    }

    return null;
  }

  // CVV VALIDATOR
  static String? validateCVV(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'CVV is required';
    }

    // أرقام فقط
    final regex = RegExp(r'^\d+$');
    if (!regex.hasMatch(value)) {
      return 'CVV must contain digits only';
    }

    if (value.length != 3) {
      return 'CVV must be 3 digits';
    }

    return null;
  }
}
