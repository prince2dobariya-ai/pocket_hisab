import 'package:intl/intl.dart';

class CurrencyHelper {
  static String format(double amount) {
    return NumberFormat.currency(
      locale: 'en_IN',
      symbol: '₹ ',
      decimalDigits: 0,
    ).format(amount);
  }
}