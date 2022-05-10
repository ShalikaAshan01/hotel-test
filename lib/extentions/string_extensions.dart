
extension StringExtension on String {
  double parseDouble() =>
      double.tryParse(this) ?? int.tryParse(this)?.toDouble() ?? 0;

  bool parseBool() => toLowerCase() == 'true' || this == '1';
}
