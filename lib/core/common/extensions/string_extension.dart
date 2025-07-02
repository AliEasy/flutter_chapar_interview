import 'package:intl/intl.dart';

extension StringExtension on String {
  toDateTime() {
    if (isEmpty) {
      return DateTime.now();
    }
    try {
      final formatter = DateFormat('yyyy-M-d');
      return formatter.parseStrict(this);
    } catch (e) {
      return DateTime.now();
    }
  }
}
