class Validators {
  static String? validateRequired(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount is required';
    }
    final amount = double.tryParse(value);
    if (amount == null) {
      return 'Please enter a valid number';
    }
    if (amount <= 0) {
      return 'Amount must be greater than 0';
    }
    return null;
  }

  static String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Title is required';
    }
    if (value.length < 2) {
      return 'Title must be at least 2 characters';
    }
    if (value.length > 50) {
      return 'Title must be less than 50 characters';
    }
    return null;
  }

  static String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Category is required';
    }
    return null;
  }
}