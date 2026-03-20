import 'package:intl/intl.dart' show NumberFormat;

abstract class Utils {
  static String? tryFormatAmount(
    num? value, {
    String? locale,
    String? currency,
  }) {
    try {
      final intPartFormatted = NumberFormat.decimalPattern(
        locale,
      ).format(value);
      if (currency == null) {
        return intPartFormatted;
      } else {
        return '$currency $intPartFormatted';
      }
    } catch (_) {
      return null;
    }
  }

  static String? tryFormatNumber(num? value, {String? locale}) {
    try {
      final intPartFormatted = NumberFormat.decimalPattern(
        locale,
      ).format(value);
      return intPartFormatted;
    } catch (_) {
      return null;
    }
  }
}
