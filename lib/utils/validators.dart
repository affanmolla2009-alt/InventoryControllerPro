class Validators {
  Validators._();

  static String? requiredField(
    String? value, {
    String fieldName = "This field",
  }) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required.";
    }

    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required.";
    }

    final regex = RegExp(
      r'^[\w\-.]+@([\w\-]+\.)+[\w\-]{2,4}$',
    );

    if (!regex.hasMatch(value.trim())) {
      return "Enter a valid email address.";
    }

    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Phone number is required.";
    }

    final regex = RegExp(r'^[0-9]{10}$');

    if (!regex.hasMatch(value.trim())) {
      return "Enter a valid 10-digit phone number.";
    }

    return null;
  }

  static String? password(
    String? value, {
    int minLength = 6,
  }) {
    if (value == null || value.isEmpty) {
      return "Password is required.";
    }

    if (value.length < minLength) {
      return "Password must be at least $minLength characters.";
    }

    return null;
  }

  static String? number(
    String? value,
  ) {
    if (value == null || value.trim().isEmpty) {
      return "Value is required.";
    }

    if (double.tryParse(value.trim()) == null) {
      return "Enter a valid number.";
    }

    return null;
  }

  static String? integer(
    String? value,
  ) {
    if (value == null || value.trim().isEmpty) {
      return "Value is required.";
    }

    if (int.tryParse(value.trim()) == null) {
      return "Enter a valid integer.";
    }

    return null;
  }

  static String? positiveNumber(
    String? value,
  ) {
    if (value == null || value.trim().isEmpty) {
      return "Value is required.";
    }

    final number = double.tryParse(value.trim());

    if (number == null) {
      return "Enter a valid number.";
    }

    if (number <= 0) {
      return "Value must be greater than zero.";
    }

    return null;
  }

  static String? quantity(
    String? value,
  ) {
    if (value == null || value.trim().isEmpty) {
      return "Quantity is required.";
    }

    final quantity = int.tryParse(value.trim());

    if (quantity == null) {
      return "Enter a valid quantity.";
    }

    if (quantity < 0) {
      return "Quantity cannot be negative.";
    }

    return null;
  }

  static String? sku(
    String? value,
  ) {
    if (value == null || value.trim().isEmpty) {
      return "SKU is required.";
    }

    if (value.trim().length < 3) {
      return "SKU is too short.";
    }

    return null;
  }

  static String? minLength(
    String? value,
    int length,
  ) {
    if (value == null || value.trim().length < length) {
      return "Minimum $length characters required.";
    }

    return null;
  }

  static String? maxLength(
    String? value,
    int length,
  ) {
    if (value != null &&
        value.trim().length > length) {
      return "Maximum $length characters allowed.";
    }

    return null;
  }

  static String? imagePath(
    String? value,
  ) {
    if (value == null || value.trim().isEmpty) {
      return "Please select an image.";
    }

    return null;
  }

  static String? url(
    String? value,
  ) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    final regex = RegExp(
      r'^(http|https):\/\/([\w\-]+\.)+[\w\-]+(\/[\w\-./?%&=]*)?$',
    );

    if (!regex.hasMatch(value.trim())) {
      return "Enter a valid URL.";
    }

    return null;
  }
}