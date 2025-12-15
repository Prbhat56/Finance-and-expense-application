import 'package:intl/intl.dart';

class Formatters {
  static final DateFormat _dateFormat = DateFormat('dd MMM yyyy');
  static final DateFormat _timeFormat = DateFormat('hh:mm a');
  static final DateFormat _monthYearFormat = DateFormat('MMM yyyy');
  static final NumberFormat _currencyFormat = NumberFormat.currency(
    symbol: '₹',
    decimalDigits: 2,
  );

  static String formatDate(DateTime date) {
    return _dateFormat.format(date);
  }

  static String formatTime(DateTime date) {
    return _timeFormat.format(date);
  }

  static String formatDateTime(DateTime date) {
    return '${formatDate(date)} • ${formatTime(date)}';
  }

  static String formatMonthYear(DateTime date) {
    return _monthYearFormat.format(date);
  }

  static String formatCurrency(double amount) {
    return _currencyFormat.format(amount);
  }

  static String formatCompactCurrency(double amount) {
    if (amount >= 1000000) {
      return '₹${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      return '₹${(amount / 1000).toStringAsFixed(1)}K';
    }
    return formatCurrency(amount);
  }

  static String formatPercentage(double value) {
    return '${value.toStringAsFixed(1)}%';
  }
}