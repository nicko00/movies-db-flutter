import 'package:intl/intl.dart';

extension StringExtensions on String {
  String get toFormattedDateString {
    return DateFormat('dd/MM/yyyy').format(_stringToDate);
  }

  DateTime get _stringToDate => DateTime.parse(this);
}
