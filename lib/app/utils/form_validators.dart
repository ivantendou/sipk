class FormValidators {
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName tidak boleh kosong";
    }
    return null;
  }

  static String? validateName(String? value, String fieldName) {
    final requiredError = validateRequired(value, fieldName);
    if (requiredError != null) return requiredError;

    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value!)) {
      return "$fieldName hanya boleh berisi huruf dan spasi";
    }
    return null;
  }

  static String? validateAddress(String? value, String fieldName) {
    final requiredError = validateRequired(value, fieldName);
    if (requiredError != null) return requiredError;

    if (!RegExp(r"^[a-zA-Z0-9\s.,-/]+$").hasMatch(value!)) {
      return "$fieldName hanya boleh berisi huruf, angka, spasi, koma, titik, strip, dan garis miring";
    }
    return null;
  }

  static String? validateNumber(String? value, String fieldName) {
    final requiredError = validateRequired(value, fieldName);
    if (requiredError != null) return requiredError;

    if (!RegExp(r"^\d+$").hasMatch(value!)) {
      return "$fieldName hanya boleh berisi angka";
    }
    return null;
  }

  static String? validateEmail(String? value, String fieldName) {
    final requiredError = validateRequired(value, fieldName);
    if (requiredError != null) return requiredError;

    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );

    if (!emailRegex.hasMatch(value!)) {
      return "$fieldName harus berupa alamat email yang valid";
    }
    return null;
  }
}
