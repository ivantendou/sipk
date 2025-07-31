class FormValidators {
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  static String? validateName(String? value, String fieldName) {
    final requiredError = validateRequired(value, fieldName);
    if (requiredError != null) return requiredError;

    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value!)) {
      return "$fieldName can only contain letters and spaces";
    }
    return null;
  }

  static String? validateAddress(String? value, String fieldName) {
    final requiredError = validateRequired(value, fieldName);
    if (requiredError != null) return requiredError;

    if (!RegExp(r"^[a-zA-Z0-9\s.,-/]+$").hasMatch(value!)) {
      return "$fieldName may contain letters, numbers, spaces, commas, periods, hyphens, and slashes.";
    }
    return null;
  }

  static String? validateNumber(String? value, String fieldName) {
    final requiredError = validateRequired(value, fieldName);
    if (requiredError != null) return requiredError;

    if (!RegExp(r"^\d+$").hasMatch(value!)) {
      return "$fieldName may only contain numbers";
    }
    return null;
  }

  static String? validateCurrency(String? value, String fieldName) {
    final requiredError = validateRequired(value, fieldName);
    if (requiredError != null) return requiredError;
    return null;
  }

  static String? validateEmail(String? value, String fieldName) {
    final requiredError = validateRequired(value, fieldName);
    if (requiredError != null) return requiredError;

    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );

    if (!emailRegex.hasMatch(value!)) {
      return "$fieldName must be a valid email address";
    }
    return null;
  }

  static String? validatePassword(String? value, String fieldName) {
    final requiredError = validateRequired(value, fieldName);
    if (requiredError != null) return requiredError;

    if (value!.length < 8) {
      return "$fieldName must be at least 8 characters";
    }
    return null;
  }
}
